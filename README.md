# ec4whs-shannonprover: Full4WHS, hop H6_1_1 = H7_0, Shannon's partial proof

The partial Shannon Prover proof of H6_1_1 = H7_0 (made with Opus 5.5, low
effort), copied from `ec4whs/shannonprover/Full4WHS` at ec4whs `8a37b6b` and
cut down to the files this hop needs. All files are in `Full4WHS/`. The
packages here are the current ones (without `ReverseMac`), as used for that
proof.

Proved: the oracle lemmas `NewKey`, `NewSession`, `Send1`, `Send2`, `Send5`,
`Reveal`, `Test`, `SameKey`, `AtMost`, `AtLeast` and the main lemma
`H6_1_1_H7_0_equiv`.

Open (to prove with Opus 5.5, high effort):
- `Eq_H6_1_1_H7_0_Send3` (9 admits in `Eq_H6_1_1_H7_0_Send3.ec`)
- `Eq_H6_1_1_H7_0_Send4` (1 admit in `Eq_H6_1_1_H7_0_Send4.ec`)

The side-invariant files `SideInv_H6*`, `SideInv_H7*`, `SideInvInit_H6/H7`
are the untouched translation, each lemma admitted; they are not part of this
task.
Compile: `easycrypt compile -I Full4WHS Full4WHS/Eq_H6_1_1_H7_0.ec`.

## Shannon Prover run (2026-11-13), Opus 5.5 high, from scratch

Both open lemmas were attempted again **from scratch**: the agent got a copy of `Full4WHS/`
with every proof (including the earlier partial proofs) replaced by `admit`, and a fresh
Claude profile without earlier transcripts.

Result:
- **`Eq_H6_1_1_H7_0_Send3`: proved** (was 9 admits). The agent's restarted node closed all goals
  and committed `qed` after about 41 minutes, but its worker then died, so Shannon reported the
  run as `infrastructure_invalid` instead of extracting the proof (the same "closed proof not
  extracted" problem as in the earlier Send2/Send5 runs). The committed proof is the node's
  recorded tactic history (`shannon_logs/Eq_H6_1_1_H7_0_Send3/partial_proof_prefix.ec`, ends in
  `qed.`); it was spliced into `Eq_H6_1_1_H7_0_Send3.ec` and checked here with EasyCrypt
  (no admits, compiles).
- **`Eq_H6_1_1_H7_0_Send4`: not proved; partial proof committed.** The first agent was killed
  after 36 minutes by a harness error (`unknown Claude user block 'text'`, Claude CLI output
  Shannon does not parse); every restart then failed with "OAuth token revoked" during a Claude
  login outage (19:05-19:20). `Eq_H6_1_1_H7_0_Send4.ec` now holds the furthest state, the first
  agent's 18 accepted tactics (`proc`, the abort-flag case, inlining `d_Send4`/`d_Run4`, a `seq`
  and `conseq` through the MAC check, ...), followed by 5 `admit.` for the 5 goals still open,
  marked `(* PARTIAL ... *)`; the file compiles. (The restarts replayed shorter prefixes and
  never got further.) One retry is queued. Kill reasons:
  `shannon_logs/Eq_H6_1_1_H7_0_Send*/worker_stderr/`.
- The main file `Eq_H6_1_1_H7_0.ec` does not compile in this environment, before and after this
  change: `cannot prove goal` at lines 112-113 (the initial-state step), independent of the
  oracle lemmas.

Setup: Shannon Prover 0.3.2 (commit `ba30e6c9`), Claude Code 2.1.323, agent backend
`claude`, model `claude-opus-5-5`, effort `high`, profile `proof_state_compiler`, one proof
node per lemma (restarted by Shannon after a crash), 60 min limit, lemmas run one at a time.
Isolation: `eval_suite` in eval mode, bubblewrap namespace holding only the proof-stripped
copy, Shannon's runtime and the EasyCrypt libraries, no built-in file or shell tools, source
read only through Shannon's source tools over the copy. Suite: `shannon_logs/suite.json`.

Tokens and cost (cost = API list-price equivalent from platform.claude.com pricing, not a
subscription bill; all cache writes were 1-hour writes):

| lemma | result | committed | admits before → after | wall time | turns | msgs | input | output | cache wr 5m | cache wr 1h | cache read | cost (USD) |
|---|---|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `Eq_H6_1_1_H7_0_Send3` | infrastructure_invalid | proof_recovered | 9 → 0 | 0:40:58 | 92 | 158 | 316 | 149,266 | 0 | 1,497,789 | 27,539,102 | 20.48 |
| `Eq_H6_1_1_H7_0_Send4` | infrastructure_invalid |  |  | 0:35:49 | 43 | 72 | 132 | 96,020 | 0 | 513,938 | 11,548,389 | 8.34 |
| **total** | 0/2 verified | | | 1:16:47 | 135 | 230 | 448 | 245,286 | 0 | 2,011,727 | 39,087,491 | 28.82 |

Logs (`shannon_logs/`): `suite_run.log`, `report.json`, `collect_results.jsonl`, and per
lemma: `summary.json`, `prover_run_result.json`, `prover_report.json`, `prover_output.txt`,
`timeline.jsonl`, `partial_proof_prefix.ec`, `worker_stderr/` (one log per node),
`token_usage.jsonl` (usage and cost per model message) and the Claude transcripts
(`transcript_*.jsonl.gz`).
