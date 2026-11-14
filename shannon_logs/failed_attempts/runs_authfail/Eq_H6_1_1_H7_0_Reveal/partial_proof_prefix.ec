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
