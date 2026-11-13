# ec4whs-shannonprover: KEM-DEM CCA (blended parallel), whole theorem

Fresh `domino easycrypt export` of project `kem-dem-cca-blended-parallel`
(ec4whs `8a37b6b`, Domino `domino-amir-easycrypt-export` `0ba6551e`), all 50
files, in `kem_dem_cca_blended_parallel/`. The invariant files
(`Eq_*_Invariants.ec`) are kept.

Every oracle lemma (`Eq_*_<Oracle>`, `Red_*_<Oracle>`) and every `run_*` lemma
has proof `admit.`; the hop lemmas (`*_equiv`), the reduction bounds and
`main` in `Prop_main.ec` are proved from them.
Compile: `easycrypt compile -I kem_dem_cca_blended_parallel kem_dem_cca_blended_parallel/Prop_main.ec`.
