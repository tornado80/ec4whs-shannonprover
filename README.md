# ec4whs-shannonprover: Full4WHS, hop H0 = H1_0, without invariant

Fresh `domino easycrypt export` of theorem `Full4WHS` (ec4whs `8a37b6b`, Domino
`domino-amir-easycrypt-export` `0ba6551e`), cut down to the games H0 and H1 and
their packages. All files are in `Full4WHS/`.

There is no invariant file and no oracle lemmas. `Eq_H0_H1_0.ec` holds only
the main lemma `H0_H1_0_equiv`, with proof `admit.` Its statement is the one
Domino generates; only the `require` lines of the invariant and oracle files
and the proof were removed.

Lemma to prove: `H0_H1_0_equiv`.
Compile: `easycrypt compile -I Full4WHS Full4WHS/Eq_H0_H1_0.ec`.

## Shannon Prover run (2026-11-13)

Result: **not proved; partial proof committed.** `H0_H1_0_equiv` in `Full4WHS/Eq_H0_H1_0.ec`
now holds Shannon's 49 accepted tactics: `byequiv`, a `call` with an invariant the agent
chose itself (equal KX package state, equal abort flags, nonce bit `false` in H1), and the
proofs of all oracle cases. The only open goal is the initialisation step (the code before
the `call`), closed with one `admit.` and marked `(* PARTIAL ... *)`. The file compiles.

Why it stopped: after 4 minutes the agent called `amend_and_replay` as a tool of its own,
which is not enabled in this run; eval mode kills the agent on any disallowed tool call
(`shannon_logs/H0_H1_0_equiv/worker_stderr.log`). Shannon classifies this as
`infrastructure_invalid`, i.e. not a valid proof attempt.

Setup: Shannon Prover 0.3.2 (commit `ba30e6c9`), Claude Code 2.1.323, agent backend
`claude`, model `claude-opus-5-5`, effort `low`, profile `proof_state_compiler`, one proof
node, 60 min limit. Isolation: `eval_suite` in eval mode: the agent worked on a copy of
`Full4WHS/` with every proof replaced by `admit`, in a bubblewrap namespace holding only that
copy, Shannon's runtime and the EasyCrypt libraries, without built-in file or shell tools
(source read only through Shannon's source tools over the copy). Suite: `shannon_logs/suite.json`.

Tokens and cost (cost = API list-price equivalent from platform.claude.com pricing, not a
subscription bill; all cache writes were 1-hour writes):

| lemma | result | committed | admits before → after | wall time | turns | msgs | input | output | cache wr 5m | cache wr 1h | cache read | cost (USD) |
|---|---|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `H0_H1_0_equiv` | infrastructure_invalid | partial | 1 → 1 | 0:03:59 | 42 | 47 | 94 | 11,425 | 0 | 167,487 | 4,441,393 | 2.46 |
| **total** | 0/1 verified | | | 0:03:59 | 42 | 47 | 94 | 11,425 | 0 | 167,487 | 4,441,393 | 2.46 |


Logs (`shannon_logs/`): `suite_run.log`, `report.json`, `collect_results.jsonl`, and in
`H0_H1_0_equiv/`: `summary.json`, `prover_run_result.json`, `prover_output.txt`,
`timeline.jsonl` (every tactic tried), `partial_proof_prefix.ec`, `worker_stderr.log`,
`token_usage.jsonl` (usage and cost per model message) and the Claude transcript
(`transcript_*.jsonl.gz`).
