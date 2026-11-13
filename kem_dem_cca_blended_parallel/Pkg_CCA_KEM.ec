(* CCA_KEM: pkeyl = pkeyl, skeyl = skeyl, dkeyl = dkeyl, kctl = kctl *)

require import AllCore Distr FMap Int IntDiv Types.

module type CCA_KEM_Imports = {
  proc d_KEM_DECAPS(sk : bits_skeyl, c : bits_kctl) : bits_dkeyl option option
  proc d_KEM_ENCAPS(pk : bits_pkeyl) : (bits_dkeyl * bits_kctl) option
  proc d_KEM_GEN() : (bits_pkeyl * bits_skeyl) option
}.

module CCA_KEM (O : CCA_KEM_Imports) = {
  var pk : bits_pkeyl option
  var sk : bits_skeyl option
  var c : bits_kctl option
  var b : bool

  proc init(b_ : bool) : unit = {
    pk <- None;
    sk <- None;
    c <- None;
    b <- b_;
  }

  proc d_KEMGEN() : bits_pkeyl option = {
    var ec_result : bits_pkeyl option;
    var ec_r1 : (bits_pkeyl * bits_skeyl) option;
    var invoke_result_1 : (bits_pkeyl * bits_skeyl);
    var pk_ : bits_pkeyl;
    var sk_ : bits_skeyl;
    ec_result <- None;
    if (pk = None) {
      ec_r1 <@ O.d_KEM_GEN();
      if (!(ec_r1 = None)) {
        invoke_result_1 <- oget ec_r1;
        (pk_, sk_) <- invoke_result_1;
        pk <- Some pk_;
        sk <- Some sk_;
        ec_result <- Some pk_;
      }
    }
    return ec_result;
  }

  proc d_ENCAPS() : (bits_kctl * bits_dkeyl) option = {
    var ec_result : (bits_kctl * bits_dkeyl) option;
    var ec_r1 : (bits_dkeyl * bits_kctl) option;
    var invoke_result_1 : (bits_dkeyl * bits_kctl);
    var k : bits_dkeyl;
    var c_ : bits_kctl;
    ec_result <- None;
    if (!(pk = None)) {
      if (c = None) {
        ec_r1 <@ O.d_KEM_ENCAPS(oget pk);
        if (!(ec_r1 = None)) {
          invoke_result_1 <- oget ec_r1;
          (k, c_) <- invoke_result_1;
          c <- Some c_;
          if (b) {
            k <$ dbits_dkeyl;
          }
          ec_result <- Some (c_, k);
        }
      }
    }
    return ec_result;
  }

  proc d_DECAPS(c_ : bits_kctl) : bits_dkeyl option option = {
    var ec_result : bits_dkeyl option option;
    var ec_r1 : bits_dkeyl option option;
    var k : bits_dkeyl option;
    ec_result <- None;
    if (!(sk = None)) {
      if (!(c = None)) {
        if (!(c_ = oget c)) {
          ec_r1 <@ O.d_KEM_DECAPS(oget sk, c_);
          if (!(ec_r1 = None)) {
            k <- oget ec_r1;
            ec_result <- Some k;
          }
        }
      }
    }
    return ec_result;
  }
}.

type CCA_KEM_pkgstate = {
  CCA_KEM_pk : bits_pkeyl option;
  CCA_KEM_sk : bits_skeyl option;
  CCA_KEM_c : bits_kctl option
}.
