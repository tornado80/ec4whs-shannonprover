(* d_Send4 *)
+ proc; inline.
sp 1 1.
if.
+ auto => /#.
+ sp 4 4.
if.
+ move=> /> &1 &2 *; smt().
+ sp 7 8.
if.
+ auto => /#.
+ if.
+ auto => /#.
+ if.
+ auto => /#.
+ rcondt{1} ^if; 1: auto => /#.
rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
sp 1 8.
if{1}.
+ if{2}.
+ rcondt{1} ^if; 1: auto => /#.
rcondt{1} ^if; 1: auto => /#.
rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
sp 9 35.
if.
move=> &1 &2 />.
move=> dSR dVR accR dSL HR HL _ Hinv _ _ Hab Hne _; move: (Hinv Hab); rewrite /StateRelation_invariant /StateRelation_relation_trivial_equalities /StateRelation_relation_state_equality /= => -[#] _ _ _ _ _ _ HF _ _ _ HS _ _; have [_ HS2] := HS ctr{2}; have := HS2 Hne; rewrite HF; smt().
+ rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{1} ^if; 1: by auto.
rcondf{2} ^if; 1: by auto.
auto => &1 &2 hpre.
have Hmsg: msg_{1} = msg_{2}.
move: hpre => />.
move=> dSR dVR accR dSL HR HL Hb Hinv H6 H7 Hab Hne Hhon _; move: (Hinv Hab); rewrite /StateRelation_invariant /StateRelation_relation_trivial_equalities /StateRelation_relation_state_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /= => -[#] _ _ HH _ _ HFr _ _ _ _ HS _ HK; move: (H6 Hab); rewrite /Comp_H6.side_inv_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /= => -[_ [HE [_ [_ [_ [_ [_ [_ [_ [_ [HFM _]]]]]]]]]]]; clear Hinv H6 H7.
have Heq: kid0{2} = kid0{1} /\ d_U0{2} = d_U0{1} /\ d_V0{2} = d_V0{1} /\ ni_{2} = ni_{1} /\ nr0{2} = nr0{1}.
+ have [_ HS1] := HS ctr{2}; move: (HS1 Hne); case: (Comp_H7.Cloned_Pkg_KX.KX_noprfkey.d_Fresh{2}.[ctr{2}] = Some true) => _ H; move: HR; rewrite H -HL /= => -[#] -> _ -> -> _ _ -> -> //.
have Hfr: Comp_H7.Cloned_Pkg_KX.KX_noprfkey.d_Fresh{2}.[ctr{2}] = Some true by move: (HFM _ Hne) Hhon Heq; rewrite -HL /= HFr HH; smt().
have Hk: kmac0{1} <> None by move: (HE _ Hne); rewrite -HL /=; smt().
move: (HK _ Hne); rewrite -HL /= Hk Hfr /= => ->; smt().
