(* Nonces: n = n *)

require import AllCore Distr FMap Int IntDiv Types.

module Nonces = {
  var d_Nonces : (bits_n, bool) fmap
  var b : bool

  proc init(b_ : bool) : unit = {
    d_Nonces <- empty;
    b <- b_;
  }

  proc d_Sample() : bits_n option = {
    var ec_result : bits_n option;
    var ec_done : bool;
    var ni : bits_n;
    ec_result <- None;
    ec_done <- false;
    ni <$ dbits_n;
    if (b) {
      if (d_Nonces.[ni] = None) {
        d_Nonces.[ni] <- true;
      } else {
        ec_done <- true;
      }
    }
    if (!ec_done) {
      ec_result <- Some ni;
    }
    return ec_result;
  }
}.

type Nonces_pkgstate = {
  Nonces_d_Nonces : (bits_n, bool) fmap
}.

type Nonces_pkgparams = {
  Nonces_param_b : bool
}.
