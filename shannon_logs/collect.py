#!/usr/bin/env python3
"""Splice Shannon Prover results into a branch checkout and check them with EasyCrypt.

Run from the shannon-prover root:
  uv run python artifacts/ec4whs/drivers/collect.py --runs artifacts/ec4whs/<branch>/runs \
      --branch-dir ~/ec4whs-shannonprover --subdir Full4WHS [--lemmas A,B] [--dry-run]

For each lemma the latest run (directory <stamp>_<LEMMA>/ holding iteration_1/) is used:
- status `verified`: the proof written back into the run's isolated copy replaces the
  lemma's proof in the branch file;
- otherwise, if the run left a partial proof prefix: prefix + one `admit.` per open goal
  (count from the node's last manager view, confirmed by compiling) + a PARTIAL comment.
  With --keep-better-admits the partial replaces the branch proof only if it has fewer
  admits than the branch proof.
Every changed file is compiled with EasyCrypt; a file that does not compile is restored.
Prints one JSON line per lemma (also appended to <runs>/collect_results.jsonl).
"""
from __future__ import annotations

import argparse
import glob
import json
import os
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT))
os.chdir(ROOT)

from workflow.interleaved.proof_source import proof_body_span  # noqa: E402

ENV = None


def ec_env() -> dict:
    global ENV
    if ENV is None:
        out = subprocess.run([sys.executable, "tools/bootstrap_easycrypt.py", "--print-env"],
                             cwd=ROOT, capture_output=True, text=True, check=True).stdout
        env = dict(os.environ)
        for m in re.finditer(r"export (\w+)=(.*)", out):
            val = m.group(2).strip()
            if val[:1] in "'\"":
                val = val[1:-1]
            env[m.group(1)] = os.path.expandvars(val)
        ENV = env
    return ENV


def compile_ok(path: Path, subdir_root: Path, timeout: int = 3600) -> tuple[bool, str]:
    env = ec_env()
    extra = ["-timeout", os.environ["EC_COMPILE_TIMEOUT"]] if os.environ.get("EC_COMPILE_TIMEOUT") else []
    cmd = ["easycrypt", "compile", *extra, "-why3", env["SHANNON_WHY3_CONFIG"], "-I", str(subdir_root),
           "-I", str(ROOT / "easycrypt-src/theories"), str(path)]
    try:
        p = subprocess.run(cmd, cwd=subdir_root, env=env, capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        return False, "timeout"
    tail = re.sub(r"\[[-\\|/]\] \[\d+\][^\n]*?(?=\[|$)", "", p.stdout + p.stderr)[-1500:]
    return p.returncode == 0, tail


def count_admits(body: str) -> int:
    return len(re.findall(r"(?<![A-Za-z_])admit\s*\.", re.sub(r"\(\*.*?\*\)", "", body, flags=re.S)))


def latest_runs(runs: Path) -> dict[str, Path]:
    found = {}
    for it in sorted(glob.glob(str(runs / "**" / "iteration_1"), recursive=True), key=lambda p: Path(p).parent.name):
        d = Path(it).parent
        m = re.match(r"\d{4}-\d\d-\d\d_\d{4}(?:\d\d)?_(.+?)(?:_\d+)?$", d.name)
        if m:
            found[m.group(1)] = d
    return found


def source_manifest(run_dir: Path) -> dict:
    for parent in run_dir.parents:
        m = parent / "source_manifest.json"
        if m.is_file():
            return json.loads(m.read_text())
        if parent == ROOT:
            break
    raise FileNotFoundError(f"no source_manifest.json above {run_dir}")


def splice(text: str, lemma: str, new_body: str) -> str:
    _, (a, b) = proof_body_span(text, lemma)
    return text[:a] + "\n" + new_body.strip("\n") + "\n" + text[b:]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--runs", required=True, type=Path)
    ap.add_argument("--branch-dir", required=True, type=Path)
    ap.add_argument("--subdir", required=True)
    ap.add_argument("--lemmas", default="")
    ap.add_argument("--keep-better-admits", action="store_true")
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()
    runs = (ROOT / a.runs).resolve()
    sub_root = a.branch_dir.expanduser().resolve() / a.subdir
    wanted = {x for x in a.lemmas.split(",") if x}
    for lemma, run_dir in latest_runs(runs).items():
        if wanted and lemma not in wanted:
            continue
        it = run_dir / "iteration_1"
        res = json.loads((it / "prover_run_result.json").read_text()) if (it / "prover_run_result.json").is_file() else {}
        status = res.get("status", "no_result")
        man = source_manifest(run_dir)
        isolated = ROOT / man["isolated_file"] if not os.path.isabs(man["isolated_file"]) else Path(man["isolated_file"])
        rel = Path(man["isolated_file"]).relative_to(Path(man["isolated_root"]))
        target = sub_root / rel
        old_text = target.read_text(encoding="utf-8")
        old_body, _ = proof_body_span(old_text, lemma)
        row = {"lemma": lemma, "status": status, "run_dir": str(run_dir.relative_to(ROOT)),
               "file": str(Path(a.subdir) / rel), "old_admits": count_admits(old_body)}
        if status == "verified":
            body, _ = proof_body_span(isolated.read_text(encoding="utf-8"), lemma)
            body = re.sub(r"[ \t]*\(\* (?:COMPLETE THIS|PROVE THIS)[^*]*\*\)\n?", "", body)
            row["kind"] = "proof"
        elif (it / "partial_proof_prefix.ec").is_file():
            prefix = (it / "partial_proof_prefix.ec").read_text(encoding="utf-8").rstrip()
            closed = re.search(r"(?:^|\n)\s*qed\s*\.\s*$", prefix) is not None
            prefix = re.sub(r"\s*qed\s*\.\s*$", "", prefix)
            views = sorted((it / "node_memory").glob("*/latest_workspace_view.json"), key=lambda p: p.stat().st_mtime)
            ps = json.loads(views[-1].read_text()).get("proof_status", {}) if views else {}
            n = int(ps.get("remaining_goals") or 1)
            row["kind"] = "partial"
            row["open_goals"] = n
            body = None
            if closed and not a.dry_run:
                # The node committed qed but the harness reported no verified proof
                # (e.g. the worker died afterwards). Accept it only if EasyCrypt checks it.
                target.write_text(splice(old_text, lemma, prefix), encoding="utf-8")
                ok, _ = compile_ok(target, sub_root)
                target.write_text(old_text, encoding="utf-8")
                if ok:
                    body = prefix
                    row["kind"] = "proof_recovered"
                    row["open_goals"] = 0
            for k in ([] if body is not None else [n] + [x for x in range(1, 41) if x != n]):
                cand = (prefix + f"\n(* PARTIAL: Shannon Prover stopped here ({status}, run {run_dir.name});"
                        f" the {k} remaining goal(s) are admitted. *)\n" + "admit.\n" * k)
                if a.dry_run:
                    body = cand; break
                target.write_text(splice(old_text, lemma, cand), encoding="utf-8")
                ok, _ = compile_ok(target, sub_root)
                if ok:
                    body = cand; row["open_goals"] = k; break
            target.write_text(old_text, encoding="utf-8")
            if body is None:
                row["kind"] = "partial_uncompilable"
        else:
            row["kind"] = "nothing"
            body = None
        if body is not None:
            row["new_admits"] = count_admits(body)
            if row["kind"] == "partial" and a.keep_better_admits and row["new_admits"] >= row["old_admits"]:
                row["applied"] = False
                row["reason"] = "partial has no fewer admits than the existing proof"
            elif a.dry_run:
                row["applied"] = False
            else:
                target.write_text(splice(old_text, lemma, body), encoding="utf-8")
                ok, tail = compile_ok(target, sub_root)
                row["compiles"] = ok
                row["applied"] = ok
                if not ok:
                    row["compile_tail"] = tail
                    target.write_text(old_text, encoding="utf-8")
        print(json.dumps(row), flush=True)
        with open(runs / "collect_results.jsonl", "a") as f:
            f.write(json.dumps(row) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
