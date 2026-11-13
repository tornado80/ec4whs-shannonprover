# ec4whs-shannonprover: KEM-DEM CCA (blended parallel), whole theorem

Fresh `domino easycrypt export` of project `kem-dem-cca-blended-parallel`
(ec4whs `8a37b6b`, Domino `domino-amir-easycrypt-export` `0ba6551e`), all 50
files, in `kem_dem_cca_blended_parallel/`. The invariant files
(`Eq_*_Invariants.ec`) are kept.

Every oracle lemma (`Eq_*_<Oracle>`, `Red_*_<Oracle>`) and every `run_*` lemma
has proof `admit.`; the hop lemmas (`*_equiv`), the reduction bounds and
`main` in `Prop_main.ec` are proved from them.
Compile: `easycrypt compile -I kem_dem_cca_blended_parallel kem_dem_cca_blended_parallel/Prop_main.ec`.

## Shannon Prover run (2026-11-13)

Result: **17 of 18 oracle lemmas proved**; all except `Eq_H3_H4_PKDEC`, which holds Shannon's
partial proof (`proc; inline *; sp.` then one `admit.`, marked `(* PARTIAL ... *)`). The
proofs are in the `Eq_*_<Oracle>.ec` and `Red_*_<Oracle>.ec` files. Every changed file and
`Prop_main.ec` compile with EasyCrypt r2026.06; `Eq_H3_H4_PKDEC` is the only admit left.

Why `Eq_H3_H4_PKDEC` failed: EasyCrypt took longer than the manager's 180 s per-command limit
on `proc; inline *; sp.`, the proof node was marked unhealthy and stopped after 4 minutes
(`shannon_logs/Eq_H3_H4_PKDEC/worker_stderr.log`). Shannon classifies this as
`infrastructure_invalid`, i.e. not a valid proof attempt.

Setup: Shannon Prover 0.3.2 (commit `ba30e6c9`), Claude Code 2.1.323, agent backend
`claude`, model `claude-opus-5-5`, effort `low`, profile `proof_state_compiler`, one proof
node per lemma, 30 min limit, lemmas run one at a time. Isolation: `eval_suite` in eval mode:
each lemma got a copy of `kem_dem_cca_blended_parallel/` with every proof replaced by
`admit`; the agent ran in a bubblewrap namespace holding only that copy, Shannon's runtime and
the EasyCrypt libraries, without built-in file or shell tools (source read only through
Shannon's source tools over the copy). Suite: `shannon_logs/suite.json`. Proofs were taken
from the verified run outputs (fresh offline EasyCrypt check by Shannon) and re-checked here.

Per-lemma results, tokens and cost (cost = API list-price equivalent from
platform.claude.com pricing, not a subscription bill; all cache writes were 1-hour writes):

| lemma | result | committed | admits before → after | wall time | turns | msgs | input | output | cache wr 5m | cache wr 1h | cache read | cost (USD) |
|---|---|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `Eq_CCA_PKE_H0_PKGEN` | verified | proof | 1 → 0 | 0:00:56 | 8 | 12 | 24 | 2,632 | 0 | 40,327 | 353,394 | 0.45 |
| `Eq_CCA_PKE_H0_PKENC` | verified | proof | 1 → 0 | 0:01:36 | 12 | 17 | 34 | 6,002 | 0 | 109,591 | 1,147,552 | 1.23 |
| `Eq_CCA_PKE_H0_PKDEC` | verified | proof | 1 → 0 | 0:00:40 | 3 | 8 | 16 | 3,149 | 0 | 39,810 | 232,998 | 0.43 |
| `Eq_H1_H2_PKENC` | verified | proof | 1 → 0 | 0:01:08 | 7 | 12 | 24 | 4,164 | 0 | 70,240 | 522,134 | 0.75 |
| `Eq_H1_H2_PKGEN` | verified | proof | 1 → 0 | 0:00:41 | 5 | 9 | 18 | 2,146 | 0 | 34,244 | 227,581 | 0.36 |
| `Eq_H1_H2_PKDEC` | verified | proof | 1 → 0 | 0:01:00 | 5 | 10 | 20 | 3,390 | 0 | 36,712 | 283,735 | 0.42 |
| `Eq_H3_H4_PKGEN` | verified | proof | 1 → 0 | 0:00:50 | 8 | 13 | 26 | 3,163 | 0 | 54,621 | 491,127 | 0.60 |
| `Eq_H3_H4_PKENC` | verified | proof | 1 → 0 | 0:01:42 | 10 | 15 | 30 | 6,857 | 0 | 96,482 | 858,550 | 1.08 |
| `Eq_H3_H4_PKDEC` | infrastructure_invalid | partial | 1 → 1 | 0:04:24 | 2 | 7 | 14 | 1,959 | 0 | 31,462 | 167,992 | 0.32 |
| `Red_H0_H1_PKGEN` | verified | proof | 1 → 0 | 0:01:18 | 10 | 16 | 32 | 3,727 | 0 | 70,653 | 705,527 | 0.78 |
| `Red_H0_H1_PKENC` | verified | proof | 1 → 0 | 0:01:21 | 7 | 11 | 22 | 4,893 | 0 | 66,027 | 440,274 | 0.71 |
| `Red_H0_H1_PKDEC` | verified | proof | 1 → 0 | 0:04:14 | 9 | 15 | 30 | 3,622 | 0 | 49,607 | 474,533 | 0.56 |
| `Red_H2_H3_PKGEN` | verified | proof | 1 → 0 | 0:00:49 | 7 | 13 | 26 | 2,974 | 0 | 45,302 | 399,171 | 0.50 |
| `Red_H2_H3_PKENC` | verified | proof | 1 → 0 | 0:01:35 | 12 | 15 | 30 | 6,542 | 0 | 99,990 | 896,084 | 1.11 |
| `Red_H2_H3_PKDEC` | verified | proof | 1 → 0 | 0:00:39 | 3 | 9 | 18 | 2,562 | 0 | 32,556 | 230,383 | 0.36 |
| `Red_H4_0_H4_1_PKGEN` | verified | proof | 1 → 0 | 0:00:57 | 9 | 13 | 26 | 2,116 | 0 | 38,780 | 379,684 | 0.43 |
| `Red_H4_0_H4_1_PKENC` | verified | proof | 1 → 0 | 0:01:44 | 15 | 19 | 38 | 7,038 | 0 | 124,198 | 1,439,567 | 1.42 |
| `Red_H4_0_H4_1_PKDEC` | verified | proof | 1 → 0 | 0:02:15 | 5 | 11 | 22 | 3,410 | 0 | 33,848 | 297,850 | 0.40 |
| **total** | 17/18 verified | | | 0:28:00 | 137 | 225 | 450 | 70,346 | 0 | 1,074,450 | 9,548,136 | 11.91 |

Logs (`shannon_logs/`): `suite_run.log`, `report.json` (the table above),
`collect_results.jsonl`, and per lemma: `summary.json`, `prover_run_result.json`,
`prover_report.json`, `prover_output.txt`, `timeline.jsonl` (every tactic tried),
`partial_proof_prefix.ec` (if not proved), `token_usage.jsonl` (usage and cost per model
message) and the Claude transcript (`transcript_*.jsonl.gz`).
