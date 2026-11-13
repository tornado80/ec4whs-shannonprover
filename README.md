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
