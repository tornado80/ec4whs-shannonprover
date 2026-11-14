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
move=> &hr [[[[htr [htl [[hc0 [_ [hc0m [_ [[_ [_ [hcc [hinv [hs6 hs7]]]]] hnab]]]]] hst]]] hacc] hsid] hrt].
move: hinv; rewrite /inv /= => [[_ [habeq hrel]]]; move: (hrel hnab); rewrite /StateRelation_invariant /StateRelation_relation_trivial_equalities /StateRelation_relation_state_equality /= => [[[_ [hltk [hH _]]] [hsteq _]]]; clear hrel.
have hstr : Comp_H7.Cloned_Pkg_KX.KX_noprfkey.d_State{hr}.[ctr0{hr}] <> None by (rewrite hc0 -hcc -hc0m; case: (hsteq ctr0{m}) => heq _; rewrite -heq; exact hst).
have hab7 : !Comp_H7.Game_H7.abort_flag{hr} by (rewrite -habeq; exact hnab).
move: hs7; rewrite /Comp_H7.side_inv_H7 /= hab7 /= => [[_ [_ [_ [_ [_ [hkey _]]]]]]]; move: (hkey ctr0{hr}); rewrite /= hstr /= -htr /= => hk; clear hkey hsteq.
move: hs6; rewrite /Comp_H6.side_inv_H6 /= hnab /= => [[_ [_ [_ [hno _]]]]]; move: (hno kid{hr}); rewrite /Comp_H6.GameInv_no__overwriting__prf_of_H6 /= hltk hH => [[_ [_ [h _]]]]; clear hno; smt().
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
move=> &hr [[R1 R2 [_ [_ [_ [_ [_ [_ [_ [L1 L2 [hrtd [hrted [hh [hx [hk0 [hx0 [_ [[[[_ [htl [[_ [_ [hc0 [_ [[_ [_ [_ [hinv [hs6 _]]]]] hnab]]]]] hst]]] hacc] hsid] hrt]]]]]]]]]]]]]]]]] hbr].
clear hinv; rewrite hx0 hx hk0 hh; move: hbr; rewrite hk0 hh => hbr; move: hs6; rewrite /Comp_H6.side_inv_H6 /= hnab /= => [[_ [_ [_ [_ [_ [hkw [hkr [hsw [_ [_ [hhf hkp]]]]]]]]]]]].
move: hkw hkr hsw hhf hkp; rewrite /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /= => hkw hkr hsw hhf hkp; have hkw0 := hkw ctr0{hr}; have hkr0 := hkr ctr0{hr}; have hsw0 := hsw ctr0{hr}; have hhf0 := hhf ctr0{hr}; have hkp0 := hkp kid{hr} d_U{hr} d_V{hr} (oget ni{hr}) (oget nr{hr}); clear hkw hkr hsw hhf hkp.
move: hkw0 hkr0 hsw0 hhf0; rewrite hst /= -htl /= => hkw0 hkr0 hsw0 hhf0; clear hrtd hrted hh hx hk0 hx0 htl hst; smt().
rcondt{2} ^if.
+ move => &m.
auto.
move=> &hr [[R1 R2 [_ [_ [hhR [hxR [hk0R [hx0R [_ [L1 L2 [_ [_ [hhL [hxL [hk0L [hx0L [_ [[[[htr [htl [[hc0r [_ [hc0l [_ [[_ [_ [hcc [hinv [hs6 _]]]]] hnab]]]]] hst]]] hacc] hsid] hrt]]]]]]]]]]]]]]]]] hbr].
rewrite hx0R hxR hk0R hhR; move: hbr; rewrite hk0L hhL => hbr; move: hs6; rewrite /Comp_H6.side_inv_H6 /= hnab /= => [[_ [_ [_ [_ [_ [hkw [hkr [hsw [_ [_ [hhf hkp]]]]]]]]]]]]; move: hkw hkr hsw hhf hkp; rewrite /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /= => hkw hkr hsw hhf hkp; have hkw0 := hkw ctr0{m}; have hkr0 := hkr ctr0{m}; have hsw0 := hsw ctr0{m}; have hhf0 := hhf ctr0{m}; have hkp0 := hkp kid{m} d_U{m} d_V{m} (oget ni{m}) (oget nr{m}); clear hkw hkr hsw hhf hkp; move: hkw0 hkr0 hsw0 hhf0; rewrite hst /= -htl /= => hkw0 hkr0 hsw0 hhf0; have hL : Comp_H6.Cloned_Pkg_PRF.PRF.d_PRF{m}.[kid{m}, (d_U{m}, d_V{m}, oget ni{m}, oget nr{m}, true)] = None by smt(); have hFr : Comp_H6.Cloned_Pkg_KX.KX_noprfkey.d_Fresh{m}.[ctr0{m}] = Some true by smt(); clear hkw0 hkr0 hsw0 hhf0 hkp0 hrt hbr.
move: hinv; rewrite /inv /= hnab /= => [[_ [_ hrel]]]; move: hrel; rewrite /StateRelation_invariant /StateRelation_relation_trivial_equalities /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /= => [[[_ [_ [_ [_ [_ [hfr _]]]]]] [hsteq [hprf _]]]]; have hs := hsteq ctr0{m}; have hp := hprf kid{m} d_U{m} d_V{m} (oget ni{m}) (oget nr{m}); clear hsteq hprf.
have hce : ctr0{hr} = ctr0{m} by (rewrite hc0r -hcc hc0l).
have hFr : Comp_H7.Cloned_Pkg_KX.KX_noprfkey.d_Fresh{hr}.[ctr0{m}] = Some true by (rewrite -hfr; smt()).
case: hs => _ hS.
have hS2 := hS hst.
move: hS2; rewrite hFr /= -htl /= => hS2.
move: htr; rewrite hce hS2 /= => [[-> [_ [-> [-> [_ [_ [-> [-> _]]]]]]]]].
move: hp => [<- _].
exact hL.
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
