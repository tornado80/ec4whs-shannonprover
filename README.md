# ec4whs-shannonprover: Full4WHS, hop H0 = H1_0, with invariant

Fresh `domino easycrypt export` of theorem `Full4WHS` (ec4whs `8a37b6b`, Domino
`domino-amir-easycrypt-export` `0ba6551e`), cut down to the first equivalence
H0 = H1_0 and the packages and games it needs. All files are in `Full4WHS/`.

- `Eq_H0_H1_0_Invariants.ec`: the invariant `inv` translated from Domino.
- `Eq_H0_H1_0_<Oracle>.ec` (12 files): one oracle lemma each, proof `admit.`
- `Eq_H0_H1_0.ec`: `H0_H1_0_equiv`, proved from the 12 oracle lemmas.

Lemmas to prove: `Eq_H0_H1_0_NewKey`, `_NewSession`, `_Send1` ... `_Send5`,
`_Reveal`, `_Test`, `_SameKey`, `_AtMost`, `_AtLeast`.
Compile: `easycrypt compile -I Full4WHS Full4WHS/Eq_H0_H1_0.ec`.

## Shannon Prover run (2026-11-13)

Result: **11 of 12 oracle lemmas proved** (all except `Eq_H0_H1_0_Send5`). The proofs
are in the `Full4WHS/Eq_H0_H1_0_<Oracle>.ec` files; `Send5` holds Shannon's partial proof
(`proc; inline *; sp.` then one `admit.`, marked `(* PARTIAL ... *)`). Every changed file
and the main file `Eq_H0_H1_0.ec` compile with EasyCrypt r2026.06.

Why `Send5` failed: after `proc; inline *; sp.` the goal was larger than the proof tool's
2 MB response limit (`proof-tool endpoint response is too large`), so the agent could not
see the proof state any more and stopped after 2 minutes. This is a Shannon harness limit,
not a failed proof search.

Setup:
- Shannon Prover 0.3.2 (commit `ba30e6c9`), Claude Code 2.1.323, agent backend `claude`,
  model `claude-opus-5-5`, effort `low`, profile `proof_state_compiler`, one proof node per
  lemma, 30 min limit, lemmas run one at a time.
- Isolation: `eval_suite` in eval mode. Each lemma got a copy of `Full4WHS/` with every proof
  replaced by `admit`; the agent ran in a bubblewrap namespace that contains only that copy,
  Shannon's runtime and the EasyCrypt libraries, with no built-in file or shell tools; it read
  source only through Shannon's source tools over the copy. The suite is `shannon_logs/suite.json`.
- Proofs were taken from the verified run output (fresh offline EasyCrypt check by Shannon)
  and re-checked in this branch.

Per-lemma results, tokens and cost (cost = API list-price equivalent from
platform.claude.com pricing, not a subscription bill; all cache writes were 1-hour writes):

| lemma | result | committed | admits before → after | wall time | turns | msgs | input | output | cache wr 5m | cache wr 1h | cache read | cost (USD) |
|---|---|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `Eq_H0_H1_0_NewKey` | verified | proof | 1 → 0 | 0:00:29 | 3 | 7 | 14 | 1,541 | 0 | 19,723 | 105,346 | 0.21 |
| `Eq_H0_H1_0_NewSession` | verified | proof | 1 → 0 | 0:00:30 | 4 | 7 | 14 | 1,525 | 0 | 20,542 | 118,205 | 0.22 |
| `Eq_H0_H1_0_Send1` | verified | proof | 1 → 0 | 0:01:24 | 13 | 19 | 38 | 5,589 | 0 | 92,180 | 992,960 | 1.05 |
| `Eq_H0_H1_0_Send2` | verified | proof | 1 → 0 | 0:02:30 | 16 | 23 | 46 | 9,465 | 0 | 104,334 | 1,381,913 | 1.30 |
| `Eq_H0_H1_0_Send3` | verified | proof | 1 → 0 | 0:00:41 | 4 | 8 | 16 | 1,712 | 0 | 26,103 | 156,403 | 0.27 |
| `Eq_H0_H1_0_Send4` | verified | proof | 1 → 0 | 0:00:38 | 3 | 8 | 16 | 1,640 | 0 | 20,820 | 134,597 | 0.23 |
| `Eq_H0_H1_0_Send5` | incomplete | partial | 1 → 1 | 0:02:14 | 7 | 13 | 26 | 3,498 | 0 | 26,607 | 281,218 | 0.34 |
| `Eq_H0_H1_0_Reveal` | verified | proof | 1 → 0 | 0:00:54 | 6 | 11 | 22 | 2,320 | 0 | 31,255 | 242,047 | 0.34 |
| `Eq_H0_H1_0_Test` | verified | proof | 1 → 0 | 0:00:43 | 5 | 9 | 18 | 2,401 | 0 | 33,167 | 203,818 | 0.35 |
| `Eq_H0_H1_0_SameKey` | verified | proof | 1 → 0 | 0:00:34 | 3 | 9 | 18 | 1,758 | 0 | 18,068 | 142,470 | 0.21 |
| `Eq_H0_H1_0_AtLeast` | verified | proof | 1 → 0 | 0:00:45 | 6 | 11 | 22 | 2,957 | 0 | 29,002 | 232,592 | 0.34 |
| `Eq_H0_H1_0_AtMost` | verified | proof | 1 → 0 | 0:00:41 | 5 | 10 | 20 | 1,770 | 0 | 23,472 | 182,534 | 0.26 |
| **total** | 11/12 verified | | | 0:12:09 | 75 | 135 | 270 | 36,176 | 0 | 445,273 | 4,174,103 | 5.12 |

Logs (`shannon_logs/`): `suite_run.log` (orchestrator output of the whole run),
`report.json` (the table above), `collect_results.jsonl` (how each result was put into this
branch), and per lemma: `summary.json`, `prover_run_result.json` (Shannon's canonical
result), `prover_report.json` (the agent's blockers/discoveries), `prover_output.txt`,
`timeline.jsonl` (every tactic the agent tried), `partial_proof_prefix.ec` (if not proved),
`token_usage.jsonl` (usage and cost of every model message) and the full Claude transcript
(`transcript_*.jsonl.gz`).

## Shannon Prover rerun of `Eq_H0_H1_0_Send5` (2026-11-14): proved

**All 12 oracle lemmas are now proved**; no admit is left in `Full4WHS/`, and `Eq_H0_H1_0.ec`
compiles. The rerun of `Send5` (Opus 5.5 low, eval-mode sandbox from a proof-stripped copy,
60 min limit, EasyCrypt limited to one SMT solver at a time) was verified by Shannon in 44
seconds. The proof is `proc; inline *.` then `wp; skip` and an `smt()` on the unfolded
invariant. In the first run the agent continued with `sp.` after inlining, and the resulting
goal exceeded the proof tool's 2 MB response limit; this time it applied `wp; skip` directly.
The proof replaces the partial one.

| lemma | result | committed | admits before → after | wall time | turns | msgs | input | output | cache wr 5m | cache wr 1h | cache read | cost (USD) |
|---|---|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `Eq_H0_H1_0_Send5` | verified | proof | 1 → 0 | 0:00:44 | 5 | 9 | 18 | 1,846 | 0 | 29,106 | 187,404 | 0.31 |
| **total** | 1/1 verified | | | 0:00:44 | 5 | 9 | 18 | 1,846 | 0 | 29,106 | 187,404 | 0.31 |

Logs: `shannon_logs/rerun_2026-11-14/` (same layout as above; suite `suite_2026-11-14.json`).
