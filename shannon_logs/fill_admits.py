#!/usr/bin/env python3
"""Let Shannon Prover fill the admits of an existing partial proof, one lemma at a time.

Run from the shannon-prover root:
  uv run python artifacts/ec4whs/drivers/fill_admits.py \
      --snapshot artifacts/ec4whs/<branch>/snapshot/Full4WHS --out artifacts/ec4whs/<branch>/runs \
      --model claude-opus-5-5 --effort high --timeout 60 FILE.ec:LEMMA [FILE.ec:LEMMA ...]

Per target (sequentially, never two at once):
 1. eval source prep: the snapshot directory is copied and EVERY proof in the copy is
    replaced by an admit shell (the canonical proof-stripped eval copy);
 2. the partial proof of the target is added to the copy as a read-only comment file
    PARTIAL_<LEMMA>.ec, registered in the source manifest, so the agent can read it with
    Shannon's source tools (no other proof text is reachable);
 3. Shannon's outer-proof handoff (workflow.interleaved.warm_handoff) replays the partial
    proof's tactics up to its first `admit.` in a fresh manager session and certifies the
    resulting goal; the handoff briefing carries the rest of the partial proof as the
    candidate suffix plus a short task note;
 4. the orchestrator runs in eval mode with filesystem confinement (bubblewrap: the agent
    sees only the proof-stripped copy, runtime code and EasyCrypt libraries; no built-in
    file/shell tools) and manager-owned source navigation over the stripped copy.
The verified proof (or partial prefix) lands in the run directory; nothing is written to
the snapshot or to the branch checkout. collect.py splices results into the branch.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import time
from datetime import datetime
from pathlib import Path
from types import SimpleNamespace

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT))
os.chdir(ROOT)

from core.easycrypt.ec_daemon import _split_ec_commands  # noqa: E402
from core.easycrypt.eval_source_prep import prepare_eval_source  # noqa: E402
from workflow.interleaved.proof_source import proof_body_span  # noqa: E402
from workflow.interleaved.warm_handoff import prepare_outer_proof_handoff  # noqa: E402
from workflow.proof_management.tactic_utils import strip_easycrypt_comments  # noqa: E402
from workflow.proof_tool.easycrypt_source_resource import SOURCE_RESOURCE_MANIFEST_ENV  # noqa: E402
from workflow.provider.eval_agent_confinement import (  # noqa: E402
    clear_confinement_environment,
    confinement_environment,
)

CLOSER = re.compile(r"(?i)^\s*(?:[+*\-]\s*)?admit\s*\.\s*$")
INCLUDE_DIR = "easycrypt-src/theories"


def sha(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def log(msg: str) -> None:
    print(f"[fill_admits {datetime.now():%H:%M:%S}] {msg}", flush=True)


def lemma_block(text: str, lemma: str) -> str:
    """Declaration + proof of `lemma`, verbatim, from its `lemma` keyword through `qed.`."""
    m = re.search(rf"(?m)^\s*(?:local\s+)?(?:lemma|equiv|hoare|phoare)\s+{re.escape(lemma)}\b", text)
    if not m:
        raise ValueError(f"{lemma} not declared")
    _, (_, body_end) = proof_body_span(text, lemma)
    q = re.compile(r"(?i)qed\s*\.").search(text, body_end)
    return text[m.start(): q.end()]


def count_admits(body: str) -> int:
    return sum(1 for c in _split_ec_commands(body) if CLOSER.fullmatch(strip_easycrypt_comments(c).strip()))


def task_note(lemma: str, partial_rel: str, n_admits: int) -> str:
    return f"""Task: complete an existing partial proof of `{lemma}`.

An earlier tool (Domino, an automated state-separating-proof prover) produced a proof of
this lemma that is complete except for {n_admits} `admit.` hole(s). Its comment after each
hole says why it was left open (typically: its final smt() call timed out). Your task is to
fill these holes and otherwise keep that proof.

- The manager has already replayed the partial proof's tactics up to the boundary reported
  below (normally its first `admit.`); the current goal is the goal at that boundary.
- The full partial proof, verbatim, is in `{partial_rel}` (read it with the source tools;
  it is a comment, nothing loads it). The candidate suffix below is the same text from the
  boundary on, truncated if long.
- After you close the current hole's goal, continue with the partial proof's following
  tactics. You may commit several of its tactic sentences in one commit_tactic payload, but
  keep each block small enough for EasyCrypt to check in about two minutes (a commit has a
  180 s limit). Fill each later `admit.` the same way, until `qed`.
- Keep the rest of the partial proof exactly as it is. Do not re-prove the lemma from scratch
  and do not restructure it. If one of its tactics really fails and must change, keep the
  change minimal and local (that one step or that one subgoal), then continue with the
  partial proof's own tactics. The final proof must be admit-free.
- This machine has only 4 GB of RAM: work in this one proof session, one commit at a time;
  do not try to start further EasyCrypt sessions or parallel checks.
"""


def prepare_target(snapshot: Path, out: Path, file_rel: str, lemma: str, stop_after: int = 0) -> dict:
    stamp = datetime.now().strftime("%Y-%m-%d_%H%M%S")
    run_root = out / f"{stamp}_{lemma}"
    run_root.mkdir(parents=True)
    source = snapshot / file_rel
    original_text = source.read_text(encoding="utf-8")
    body, _ = proof_body_span(original_text, lemma)
    n_admits = count_admits(body)

    # 1. canonical proof-stripped isolated copy + manifest
    prep = prepare_eval_source(
        source_file=source, target_lemma=lemma, output_dir=run_root,
        copy_root=snapshot, strip_proofs=True,
    )
    manifest_path = run_root / "source_manifest.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))

    # 2. the partial proof as a readable comment file, registered in the manifest ledger
    block = lemma_block(original_text, lemma)
    partial_name = f"PARTIAL_{lemma}.ec"
    partial_text = (
        f"(* Partial proof of {lemma} to complete: Domino's proof from {file_rel}, verbatim.\n"
        f"   It has {n_admits} `admit.` hole(s). This file is a comment; nothing requires it. *)\n"
        "(*\n" + block + "\n*)\n"
    )
    partial_path = prep.isolated_root / partial_name
    partial_path.write_text(partial_text, encoding="utf-8")
    manifest["stripped_files"].append({
        "path": partial_name, "proofs_replaced": 0,
        "raw_sha256": sha(partial_text), "stripped_sha256": sha(partial_text),
        "added_by": "fill_admits.py: partial proof handed to the agent",
    })
    manifest["stripped_file_count"] = len(manifest["stripped_files"])
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    # 3. candidate = the stripped copy with the target file restored to the partial proof;
    #    the handoff preparation replays it up to the first admit and certifies the goal.
    cand_root = run_root / "candidate" / snapshot.name
    shutil.copytree(prep.isolated_root, cand_root)
    (cand_root / partial_name).unlink()
    cand_text = original_text
    if stop_after:
        # Hand over after the first `stop_after` commands: the candidate keeps only those plus
        # an `admit.`, so the replay boundary is fixed there (the replay of later smt() steps is
        # not deterministic, and the proof state further on can exceed the launch-argument limit).
        # The agent still gets every later partial-proof command as the candidate suffix.
        _all = [c.strip() for c in _split_ec_commands(body) if c.strip()]
        _, (a, b) = proof_body_span(original_text, lemma)
        cand_text = original_text[:a] + "\n" + "\n".join(_all[:stop_after] + ["admit."]) + "\n" + original_text[b:]
    (cand_root / file_rel).write_text(cand_text, encoding="utf-8")
    partial_rel = partial_path.relative_to(ROOT).as_posix()
    note = run_root / "task_note.md"
    note.write_text(task_note(lemma, partial_rel, n_admits), encoding="utf-8")
    ctx = SimpleNamespace(
        root=ROOT,
        project=SimpleNamespace(
            target_file=(cand_root / file_rel).relative_to(ROOT).as_posix(),
            session_include_dir=INCLUDE_DIR,
        ),
    )
    isolated_rel = prep.isolated_file.relative_to(ROOT).as_posix()
    log(f"{lemma}: replaying the partial proof up to its first admit ({n_admits} admits)")
    t0 = time.time()
    handoff = prepare_outer_proof_handoff(
        ctx, run_rel=run_root.relative_to(ROOT), lemma=lemma,
        strategy_note=note.relative_to(ROOT).as_posix(),
        runtime_target_file=isolated_rel,
    )
    data = json.loads(handoff.read_text(encoding="utf-8"))
    # warm_handoff stops its candidate at the first closer, so its suffix is empty; hand over
    # the rest of the partial proof (from the boundary on) as the candidate suffix.
    cmds = [c.strip() for c in _split_ec_commands(body) if c.strip()]
    accepted = data["replay"]["accepted_command_count"]
    data["briefing"]["candidate_suffix"] = "\n".join(cmds[accepted:])[:200_000]
    handoff.write_text(json.dumps(data, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    log(f"{lemma}: handoff ready in {time.time()-t0:.0f}s: {accepted} command(s) replayed, "
        f"boundary={data['boundary']['reason']} failed_tactic={data['boundary']['failed_tactic'][:60]!r}")
    return {
        "lemma": lemma, "file": file_rel, "run_root": str(run_root.relative_to(ROOT)),
        "isolated_file": isolated_rel, "manifest": str(manifest_path.relative_to(ROOT)),
        "handoff": str(handoff.relative_to(ROOT)), "admits": n_admits,
        "replayed_commands": accepted, "boundary": data["boundary"]["reason"],
    }


def run_target(t: dict, args) -> int:
    run_root = ROOT / t["run_root"]
    cmd = [
        sys.executable, "-m", "workflow.orchestrator",
        "--file", t["isolated_file"], "--lemma", t["lemma"],
        "--include-dir", INCLUDE_DIR, "--max-iterations", "1",
        "--prover-timeout-minutes", str(args.timeout),
        "--surface-profile", "proof_state_compiler", "--eval-mode",
        "--agent-backend", "claude", "--prover-model", args.model, "--prover-effort", args.effort,
        "--tree-initial-provers", "1", "--tree-max-concurrent", "1",
        "--outer-proof-handoff", t["handoff"],
        "--output-dir", str(Path(t["run_root"]) / "run"),
    ]
    env = confinement_environment(manifest_path=ROOT / t["manifest"], base=clear_confinement_environment(os.environ))
    env[SOURCE_RESOURCE_MANIFEST_ENV] = str(ROOT / t["manifest"])
    (run_root / "command.json").write_text(json.dumps({"cmd": cmd, "target": t}, indent=2) + "\n")
    log(f"{t['lemma']}: launching orchestrator ({args.model}, effort {args.effort}, {args.timeout} min)")
    with open(run_root / "orchestrator.log", "w") as logf:
        p = subprocess.Popen(cmd, cwd=ROOT, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        for line in p.stdout:
            sys.stdout.write(line); sys.stdout.flush(); logf.write(line); logf.flush()
        return p.wait()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--snapshot", required=True, type=Path)
    ap.add_argument("--out", required=True, type=Path)
    ap.add_argument("--model", default="claude-opus-5-5")
    ap.add_argument("--effort", default="high")
    ap.add_argument("--timeout", type=int, default=80)
    ap.add_argument("--prepare-only", action="store_true")
    ap.add_argument("--stop-after", type=int, default=0,
                    help="hand over after this many partial-proof commands (0 = at the first admit)")
    ap.add_argument("targets", nargs="+", help="FILE.ec:LEMMA relative to --snapshot")
    args = ap.parse_args()
    snapshot = (ROOT / args.snapshot).resolve()
    out = (ROOT / args.out).resolve()
    results = []
    for spec in args.targets:
        file_rel, lemma = spec.split(":")
        try:
            t = prepare_target(snapshot, out, file_rel, lemma, args.stop_after)
        except Exception as exc:  # one broken target must not stop the rest
            log(f"{lemma}: PREPARATION FAILED: {type(exc).__name__}: {exc}")
            results.append({"lemma": lemma, "file": file_rel, "error": f"{type(exc).__name__}: {exc}"})
            continue
        t["returncode"] = None if args.prepare_only else run_target(t, args)
        results.append(t)
        with open(out / "fill_admits_results.jsonl", "a") as f:
            f.write(json.dumps(t) + "\n")
    log("done: " + ", ".join(f"{r['lemma']}={r.get('returncode', r.get('error'))}" for r in results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
