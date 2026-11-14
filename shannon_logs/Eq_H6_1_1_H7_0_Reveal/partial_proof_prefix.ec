(* d_Reveal *)
+ proc; inline.
sp 1 1.
if.
+ auto => /#.
+ sp 2 2.
if.
+ move=> /> &1 &2 *; smt().
+ sp 1 1.
if.
+ move=> /> &1 &2.
move=> h0 h1 h2 h3 _ _ h4 h5; move: h0 h1 h2 h3 h4 h5; smt().
+ if.
+ move=> /> &1 &2.
move=> h0 h1 h2 h3 _ _ h4 h5; move: h0 h1 h2 h3 h4 h5; smt().
+ if.
+ move=> /> &1 &2.
move=> h0 h1 h2 h3 _ _ h4 h5 h6; move: h0 h1 h2 h3 h4 h5 h6; smt().
+ rcondt{1} ^if; 1: auto => /#.
rcondt{1} ^if; 1: auto => /#.
rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if.
+ move => &m.
auto.
move=> &hr; rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /=; move=> />.
move=> hst7 hst6 hR h6 h7 hab hne6 _ _; have [hT [hSE _]] := hR hab; have [_ [_ [_ [hNO _]]]] := h6 hab; have [_ [_ [_ [_ [_ [hSK _]]]]]] := h7 hab; move: hSE; rewrite /StateRelation_relation_state_equality /= => hSE; have [hne7 _] := hSE ctr{hr}; have := hSK ctr{hr}; rewrite -hst7 /=; have := hNO kid{hr}; smt().
sp 7 7.
if.
+ move=> /> &1 &2.
move=> x0 x1 x2 x3 h4 h5 h6 h7 _ _ h8 h9 h10 h11; move: x0 x1 x2 x3 h4 h5 h6 h7 h8 h9 h10 h11; smt().
+ rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{1} ^if; 1: by auto.
rcondf{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ move: hpre => />; smt(get_setE mem_set remE mem_rem emptyE).
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ move => hpre1 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre1.
rewrite /StateRelation_invariant /=.
do split.
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ rewrite /StateRelation_relation_state_equality /=.
move => ctr1 /=.
do split.
+ smt().
+ move => hpre2 /=.
do split.
+ move => hpre3 /=.
smt().
+ move => hpre3 /=.
smt().
+ rewrite /StateRelation_relation_prf_equality /=.
move => kid1 d_U0 d_V0 ni0 nr0 /=.
do split.
+ smt().
+ smt().
+ rewrite /StateRelation_relation_kmac_consistent_in_state_and_mac /=.
move => ctr1 /=.
move => hpre2 /=.
move => hpre3 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre3.
do split.
+ move => hpre4 /=.
smt().
+ move => hpre4 /=.
smt().
+ rcondt{1} ^if.
+ move => &m.
auto.
move=> &hr [[dRTE_R dRT_R HR] hcond]; move: HR => [_ [_ [_ [_ [_ [_ [_ [dRTE_L dRT_L HL]]]]]]]]; move: HL => [hRT [hRTE [hh [hx [hk0 [hx0 [_ [HG hrevL]]]]]]]]; move: HG => [[[hst7 [hst6 [HC hne6]]] hacc] hsid]; move: HC => [_ [_ [_ [_ [[_ [_ [_ [hinv [h6 h7]]]]] hab]]]]].
move: h6; rewrite /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /= => /(_ hab) [hl [_ [_ [_ [_ [hwf [hreq [hsidwf [_ [_ [hhf hkp]]]]]]]]]]].
rewrite hk0 hh hx0 hx /=; have hS := hreq ctr0{hr} hne6; have hW := hwf ctr0{hr} hne6; have hI := hsidwf ctr0{hr} hne6; have hF := hhf ctr0{hr} hne6; rewrite -hst6 /= in hS; rewrite -hst6 /= in hW; rewrite -hst6 /= in hI; rewrite -hst6 /= in hF; have [_ hkm] := hS hsid; have hsid' := hI hsid; have [hFne [hHne hFeq]] := hF.
have hH : Comp_H6.Cloned_Pkg_PRF.PRF.d_H{hr}.[kid{hr}] = Some true by move: hcond hHne; rewrite hk0 hh; case: (Comp_H6.Cloned_Pkg_PRF.PRF.d_H{hr}.[kid{hr}]) => // -[] //.
move: hW; rewrite hFeq hH /= => hW; have hk := hW hkm; move: hrevL; rewrite hsid' /= => hrevL; case: (Comp_H6.Cloned_Pkg_PRF.PRF.d_PRF{hr}.[kid{hr}, (d_U{hr}, d_V{hr}, oget ni{hr}, oget nr{hr}, true)] = None) => // hne; have := hkp kid{hr} d_U{hr} d_V{hr} (oget ni{hr}) (oget nr{hr}) hne; rewrite -hk hrevL.
by [].
rcondt{2} ^if.
+ move => &m.
auto.
move=> &hr [[dRTE_R dRT_R HR] hcond]; move: HR => [hRT7 [hRTE7 [hh7 [hx7 [hk07 [hx07 [_ [dRTE_L dRT_L HL]]]]]]]]; move: HL => [hRT [hRTE [hh [hx [hk0 [hx0 [_ [HG hrevL]]]]]]]]; move: HG => [[[hst7 [hst6 [HC hne6]]] hacc] hsid]; move: HC => [hc1 [_ [hc3 [_ [[_ [_ [hc [hinv [h6 h7]]]]] hab]]]]].
have hL : Comp_H6.Cloned_Pkg_PRF.PRF.d_PRF{m}.[kid{m}, (d_U{m}, d_V{m}, oget ni{m}, oget nr{m}, true)] = None.
+ move: h6; rewrite /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /= => /(_ hab) [hl [_ [_ [_ [_ [hwf [hreq [hsidwf [_ [_ [hhf hkp]]]]]]]]]]]; have hS := hreq ctr0{m} hne6; have hW := hwf ctr0{m} hne6; have hI := hsidwf ctr0{m} hne6; have hF := hhf ctr0{m} hne6; rewrite -hst6 /= in hS; rewrite -hst6 /= in hW; rewrite -hst6 /= in hI; rewrite -hst6 /= in hF; have [_ hkm] := hS hsid; have hsid' := hI hsid; have [hFne [hHne hFeq]] := hF; have hH : Comp_H6.Cloned_Pkg_PRF.PRF.d_H{m}.[kid{m}] = Some true by move: hcond hHne; rewrite hk0 hh; case: (Comp_H6.Cloned_Pkg_PRF.PRF.d_H{m}.[kid{m}]) => // -[] //.
move: hW; rewrite hFeq hH /= => hW; have hk := hW hkm; move: hrevL; rewrite hsid' /= => hrevL; case: (Comp_H6.Cloned_Pkg_PRF.PRF.d_PRF{m}.[kid{m}, (d_U{m}, d_V{m}, oget ni{m}, oget nr{m}, true)] = None) => // hne; have := hkp kid{m} d_U{m} d_V{m} (oget ni{m}) (oget nr{m}) hne; rewrite -hk hrevL.
by [].
move: hinv; rewrite /inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /= => -[_ [_ /(_ hab) [_ [hSE [hPE _]]]]]; have hc0 : ctr0{hr} = ctr0{m} by rewrite hc1 hc3 hc.
have [_ hS] := hSE ctr0{m}; have hR := hS hne6; move: hst7; rewrite hc0 => hst7.
move: hR; rewrite -hst6 /= => hR; have heq : kid{hr} = kid{m} /\ d_U{hr} = d_U{m} /\ d_V{hr} = d_V{m} /\ ni{hr} = ni{m} /\ nr{hr} = nr{m}.
+ move: hR hst7; case: (Comp_H7.Cloned_Pkg_KX.KX_noprfkey.d_Fresh{hr}.[ctr0{m}] = Some true) => hF; rewrite ?hF /= => -> /=; [smt() | rewrite -hst6 /=; smt()].
have [h1 _] := hPE kid{m} d_U{m} d_V{m} (oget ni{m}) (oget nr{m}); rewrite hk07 hh7 hx07 hx7 /=; move: heq => [-> [-> [-> [-> ->]]]]; by rewrite -h1.
seq 1 1 : (#pre /\ temp{1} = temp{2}); 1: auto => />.
rcondt{1} ^if.
+ move => &m.
auto.
smt(get_setE mem_set remE mem_rem emptyE).
rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if.
+ move => &m.
auto.
smt(get_setE mem_set remE mem_rem emptyE).
rcondt{2} ^if; 1: auto => /#.
rcondf{1} ^if; 1: by auto.
rcondf{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt(get_setE mem_set remE mem_rem emptyE).
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ move => hpre1 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre1.
rewrite /StateRelation_invariant /=.
do split.
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ rewrite /StateRelation_relation_state_equality /=.
move => ctr1 /=.
do split.
+ smt().
+ move => hpre2 /=.
do split.
+ move => hpre3 /=.
smt().
+ move => hpre3 /=.
smt().
+ rewrite /StateRelation_relation_prf_equality /=.
move => kid1 d_U0 d_V0 ni0 nr0 /=.
do split.
+ move: hpre hpre1 => />; smt(get_setE mem_set remE mem_rem emptyE).
+ smt(get_setE mem_set remE mem_rem emptyE).
+ rewrite /StateRelation_relation_kmac_consistent_in_state_and_mac /=.
move => ctr1 /=.
move => hpre2 /=.
move => hpre3 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre3.
do split.
+ move => hpre4 /=.
smt().
+ move => hpre4 /=.
smt().
+ rcondt{1} ^if; 1: by auto.
rcondt{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ rcondt{1} ^if; 1: by auto.
rcondt{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ rcondt{1} ^if; 1: by auto.
rcondt{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ rcondt{1} ^if; 1: by auto.
rcondt{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ smt().
+ auto => /#.
qed.
