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
