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
+ auto => /#.
+ rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{1} ^if; 1: by auto.
rcondf{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ move => hpre1 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre1.
rewrite /StateRelation_invariant /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_state_equality /=.
move => ctr1 /=.
do split.
+ smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre2 /=.
do split.
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ rewrite /StateRelation_relation_prf_equality /=.
move => kid2 d_U1 d_V1 ni1 nr1 /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_kmac_consistent_in_state_and_mac /=.
move => ctr1 /=.
move => hpre2 /=.
move => hpre3 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre3.
do split.
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ if.
+ auto => /#.
+ rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{1} ^if; 1: by auto.
rcondf{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ move => hpre1 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre1.
rewrite /StateRelation_invariant /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_state_equality /=.
move => ctr1 /=.
do split.
+ smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre2 /=.
do split.
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ rewrite /StateRelation_relation_prf_equality /=.
move => kid2 d_U1 d_V1 ni1 nr1 /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_kmac_consistent_in_state_and_mac /=.
move => ctr1 /=.
move => hpre2 /=.
move => hpre3 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre3.
do split.
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{1} ^if; 1: by auto.
rcondf{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ move => hpre1 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre1.
rewrite /StateRelation_invariant /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_state_equality /=.
move => ctr1 /=.
do split.
+ smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre2 /=.
do split.
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ rewrite /StateRelation_relation_prf_equality /=.
move => kid2 d_U1 d_V1 ni1 nr1 /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_kmac_consistent_in_state_and_mac /=.
move => ctr1 /=.
move => hpre2 /=.
move => hpre3 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre3.
do split.
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ rcondt{1} ^if; 1: auto => /#.
rcondt{1} ^if; 1: auto => /#.
rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
sp 9 10.
if.
+ auto => /#.
+ rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{1} ^if; 1: by auto.
rcondf{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ move => hpre1 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre1.
rewrite /StateRelation_invariant /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_state_equality /=.
move => ctr1 /=.
do split.
+ smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre2 /=.
do split.
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ rewrite /StateRelation_relation_prf_equality /=.
move => kid2 d_U1 d_V1 ni1 nr1 /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_kmac_consistent_in_state_and_mac /=.
move => ctr1 /=.
move => hpre2 /=.
move => hpre3 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre3.
do split.
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ if.
+ auto => /#.
+ rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{1} ^if; 1: by auto.
rcondf{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ move => hpre1 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre1.
rewrite /StateRelation_invariant /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_state_equality /=.
move => ctr1 /=.
do split.
+ smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre2 /=.
do split.
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ rewrite /StateRelation_relation_prf_equality /=.
move => kid2 d_U1 d_V1 ni1 nr1 /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_kmac_consistent_in_state_and_mac /=.
move => ctr1 /=.
move => hpre2 /=.
move => hpre3 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre3.
do split.
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{1} ^if; 1: by auto.
rcondf{2} ^if; 1: by auto.
auto => &1 &2 hpre.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ move => hpre1 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre1.
rewrite /StateRelation_invariant /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_state_equality /=.
move => ctr1 /=.
do split.
+ smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre2 /=.
do split.
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre3 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ rewrite /StateRelation_relation_prf_equality /=.
move => kid2 d_U1 d_V1 ni1 nr1 /=.
do split.
+ smt timeout=60.
+ smt timeout=60.
+ rewrite /StateRelation_relation_kmac_consistent_in_state_and_mac /=.
move => ctr1 /=.
move => hpre2 /=.
move => hpre3 /=.
rewrite /inv /params_inv /StateRelation_invariant /StateRelation_relation_state_equality /StateRelation_relation_prf_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /StateRelation_relation_trivial_equalities /Comp_H6.side_inv_H6 /Comp_H6.links_H6 /Comp_H6.GameInv_stuff__not__initialized__early_of_H6 /Comp_H6.GameInv_revtesteval__populated_of_H6 /Comp_H6.GameInv_no__overwriting__prf_of_H6 /Comp_H6.GameInv_kmac__before__k_of_H6 /Comp_H6.GameInv_kmac__is__wellformed_of_H6 /Comp_H6.GameInv_kmac__requires__nonces_of_H6 /Comp_H6.GameInv_sid__is__wellformed_of_H6 /Comp_H6.GameInv_honest__kmac_of_H6 /Comp_H6.GameInv_sid__requires__nonces_of_H6 /Comp_H6.GameInv_h__and__fresh__match_of_H6 /Comp_H6.GameInv_k__prf__implies__rev__tested__sid_of_H6 /Comp_H7.side_inv_H7 /Comp_H7.links_H7 /Comp_H7.GameInv_first__points__to__state_of_H7 /Comp_H7.GameInv_first__entry__after__message1_of_H7 /Comp_H7.GameInv_keys__above__counter__empty_of_H7 /Comp_H7.GameInv_sessions__above__counter__empty_of_H7 /Comp_H7.GameInv_session__key__is__defined_of_H7 /Comp_H7.GameInv_fresh__accepted__first__has__second_of_H7 /Comp_H7.GameInv_session__freshness__matches__honesty_of_H7 /Comp_H7.GameInv_early__fresh__session__has__no__complete__transcript_of_H7 /Comp_H7.GameInv_mac3__entry__authenticates__first_of_H7 /Comp_H7.GameInv_mac4__entry__authenticates__second_of_H7 /Comp_H7.GameInv_mac__values__are__correct_of_H7 /Comp_H7.GameInv_fresh__sid__authenticated__by__mac2_of_H7 in hpre3.
do split.
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ move => hpre4 /=.
smt timeout=60 wantedlemmas=(get_setE mem_set remE mem_rem emptyE).
+ if{2}.
+ rcondt{1} ^if; 1: auto => /#.
rcondf{1} ^if; 1: auto => /#.
rcondt{1} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondt{2} ^if; 1: auto => /#.
rcondf{2} ^if.
+ move => &m.
auto.
move=> &hr />.
move=> HR HL Hb Hinv H6 H7 Hab HLnn Hnv Hhon.
have := Hinv Hab.
rewrite /StateRelation_invariant /StateRelation_relation_trivial_equalities /StateRelation_relation_state_equality /StateRelation_relation_kmac_consistent_in_state_and_mac /=.
move=> [#] HNon HLTK HH Hkid Hctr HFresh HFirst HSecond HRT HRTE Hse Hprf Hkm.
move: H6; rewrite /Comp_H6.side_inv_H6 /= => /(_ Hab) [#] _ Hsn _ _ _ _ _ _ _ _ Hhf _.
have Hse1 := Hse ctr{hr}.
have Hkm1 := Hkm ctr{hr}.
have Hsn1 := Hsn ctr{hr}.
have Hhf1 := Hhf ctr{hr}.
clear Hse Hkm Hsn Hhf Hprf H7 Hinv.
have HLs : Comp_H6.Cloned_Pkg_KX.KX_noprfkey.d_State{m}.[ctr{hr}] = Some (d_U0{m}, true, d_V0{m}, kid0{m}, None, k0{m}, ni_{m}, nr0{m}, kmac0{m}, sid0{m}, 1).
+ by rewrite HL; move: HLnn; case: (Comp_H6.Cloned_Pkg_KX.KX_noprfkey.d_State{m}.[ctr{hr}]).
move: Hsn1 Hhf1 Hse1 Hkm1; rewrite /= HLs /= => Hsn1 Hhf1 Hse1 Hkm1.
