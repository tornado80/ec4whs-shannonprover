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
