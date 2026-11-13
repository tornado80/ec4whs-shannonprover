(* Correct_KEM: pkeyl = pkeyl, skeyl = skeyl, dkeyl = dkeyl, kctl = kctl *)

require import AllCore Distr FMap Int IntDiv Types.

module type Correct_KEM_Imports = {
  proc d_KEM_DECAPS(sk : bits_skeyl, c : bits_kctl) : bits_dkeyl option option
  proc d_KEM_ENCAPS(pk : bits_pkeyl) : (bits_dkeyl * bits_kctl) option
  proc d_KEM_GEN() : (bits_pkeyl * bits_skeyl) option
}.

module Correct_KEM (O : Correct_KEM_Imports) = {
  var sk : bits_skeyl option
  var pk : bits_pkeyl option
  var c : bits_kctl option
  var k : bits_dkeyl option
  var b : bool

  proc init(b_ : bool) : unit = {
    sk <- None;
    pk <- None;
    c <- None;
    k <- None;
    b <- b_;
  }

  proc d_CORR_GEN() : bits_pkeyl option = {
    var ec_result : bits_pkeyl option;
    var ec_r1 : (bits_pkeyl * bits_skeyl) option;
    var invoke_result_1 : (bits_pkeyl * bits_skeyl);
    var pk_ : bits_pkeyl;
    var sk_ : bits_skeyl;
    ec_result <- None;
    ec_r1 <@ O.d_KEM_GEN();
    if (!(ec_r1 = None)) {
      invoke_result_1 <- oget ec_r1;
      (pk_, sk_) <- invoke_result_1;
      sk <- Some sk_;
      pk <- Some pk_;
      ec_result <- Some pk_;
    }
    return ec_result;
  }

  proc d_CORR_ENCAPS() : (bits_kctl * bits_dkeyl) option = {
    var ec_result : (bits_kctl * bits_dkeyl) option;
    var ec_r1 : (bits_dkeyl * bits_kctl) option;
    var invoke_result_1 : (bits_dkeyl * bits_kctl);
    var k_ : bits_dkeyl;
    var c_ : bits_kctl;
    ec_result <- None;
    if (!(pk = None)) {
      if (c = None) {
        ec_r1 <@ O.d_KEM_ENCAPS(oget pk);
        if (!(ec_r1 = None)) {
          invoke_result_1 <- oget ec_r1;
          (k_, c_) <- invoke_result_1;
          c <- Some c_;
          k <- Some k_;
          ec_result <- Some (c_, k_);
        }
      }
    }
    return ec_result;
  }

  proc d_CORR_DECAPS(c_ : bits_kctl) : bits_dkeyl option option = {
    var ec_result : bits_dkeyl option option;
    var ec_r1 : bits_dkeyl option option;
    var k_ : bits_dkeyl option;
    ec_result <- None;
    if (!(sk = None)) {
      if (!(c = None)) {
        if (c_ = oget c /\ b) {
          ec_result <- Some k;
        } else {
          ec_r1 <@ O.d_KEM_DECAPS(oget sk, c_);
          if (!(ec_r1 = None)) {
            k_ <- oget ec_r1;
            ec_result <- Some k_;
          }
        }
      }
    }
    return ec_result;
  }
}.

type Correct_KEM_pkgstate = {
  Correct_KEM_sk : bits_skeyl option;
  Correct_KEM_pk : bits_pkeyl option;
  Correct_KEM_c : bits_kctl option;
  Correct_KEM_k : bits_dkeyl option
}.
