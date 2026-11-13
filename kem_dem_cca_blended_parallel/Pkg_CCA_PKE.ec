(* CCA_PKE: pkeyl = pkeyl, skeyl = skeyl, ptl = ptl, kctl = kctl, dctl = dctl *)

require import AllCore Distr FMap Int IntDiv Types.

module type CCA_PKE_Imports = {
  proc d_DEC(sk : bits_skeyl, c : (bits_kctl * bits_dctl)) : bits_ptl option option
  proc d_ENC(pk : bits_pkeyl, m : bits_ptl) : (bits_kctl * bits_dctl) option
  proc d_GEN() : (bits_pkeyl * bits_skeyl) option
}.

module CCA_PKE (O : CCA_PKE_Imports) = {
  var pk : bits_pkeyl option
  var sk : bits_skeyl option
  var c : (bits_kctl * bits_dctl) option
  var b : bool
  var dkeyl : int

  proc init(b_ : bool, dkeyl_ : int) : unit = {
    pk <- None;
    sk <- None;
    c <- None;
    b <- b_;
    dkeyl <- dkeyl_;
  }

  proc d_PKGEN() : bits_pkeyl option = {
    var ec_result : bits_pkeyl option;
    var ec_r1 : (bits_pkeyl * bits_skeyl) option;
    var invoke_result_1 : (bits_pkeyl * bits_skeyl);
    var pk_ : bits_pkeyl;
    var sk_ : bits_skeyl;
    ec_result <- None;
    if (pk = None) {
      ec_r1 <@ O.d_GEN();
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

  proc d_PKENC(m0 : bits_ptl, m1 : bits_ptl) : (bits_kctl * bits_dctl) option = {
    var ec_result : (bits_kctl * bits_dctl) option;
    var ec_done : bool;
    var ec_r1 : (bits_kctl * bits_dctl) option;
    var c_ : (bits_kctl * bits_dctl);
    var ec_r2 : (bits_kctl * bits_dctl) option;
    ec_result <- None;
    ec_done <- false;
    if (!(pk = None)) {
      if (c = None) {
        if (b) {
          ec_r1 <@ O.d_ENC(oget pk, m1);
          if (!(ec_r1 = None)) {
            c_ <- oget ec_r1;
          } else {
            ec_done <- true;
          }
        } else {
          ec_r2 <@ O.d_ENC(oget pk, m0);
          if (!(ec_r2 = None)) {
            c_ <- oget ec_r2;
          } else {
            ec_done <- true;
          }
        }
        if (!ec_done) {
          c <- Some c_;
          ec_result <- Some c_;
        }
      }
    }
    return ec_result;
  }

  proc d_PKDEC(c_ : (bits_kctl * bits_dctl)) : bits_ptl option option = {
    var ec_result : bits_ptl option option;
    var ec_r1 : bits_ptl option option;
    var m : bits_ptl option;
    ec_result <- None;
    if (!(sk = None)) {
      if (!(c = None)) {
        if (!(c_ = oget c)) {
          ec_r1 <@ O.d_DEC(oget sk, c_);
          if (!(ec_r1 = None)) {
            m <- oget ec_r1;
            ec_result <- Some m;
          }
        }
      }
    }
    return ec_result;
  }
}.

type CCA_PKE_pkgstate = {
  CCA_PKE_pk : bits_pkeyl option;
  CCA_PKE_sk : bits_skeyl option;
  CCA_PKE_c : (bits_kctl * bits_dctl) option
}.
