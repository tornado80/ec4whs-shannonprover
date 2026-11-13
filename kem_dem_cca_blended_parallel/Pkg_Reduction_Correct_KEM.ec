(* Reduction_Correct_KEM: pkeyl = pkeyl, ptl = ptl, dkeyl = dkeyl, kctl = kctl, dctl = dctl *)

require import AllCore Distr FMap Int IntDiv Types.

module type Reduction_Correct_KEM_Imports = {
  proc d_CORR_DECAPS(c : bits_kctl) : bits_dkeyl option option
  proc d_CORR_ENCAPS() : (bits_kctl * bits_dkeyl) option
  proc d_CORR_GEN() : bits_pkeyl option
  proc d_DEM_DEC(k : bits_dkeyl, c : bits_dctl) : bits_ptl option
  proc d_DEM_ENC(k : bits_dkeyl, m : bits_ptl) : bits_dctl option
}.

module Reduction_Correct_KEM (O : Reduction_Correct_KEM_Imports) = {
  var pk : bits_pkeyl option
  var c : (bits_kctl * bits_dctl) option
  var b : bool

  proc init(b_ : bool) : unit = {
    pk <- None;
    c <- None;
    b <- b_;
  }

  proc d_PKGEN() : bits_pkeyl option = {
    var ec_result : bits_pkeyl option;
    var ec_r1 : bits_pkeyl option;
    var pk_ : bits_pkeyl;
    ec_result <- None;
    if (pk = None) {
      ec_r1 <@ O.d_CORR_GEN();
      if (!(ec_r1 = None)) {
        pk_ <- oget ec_r1;
        pk <- Some pk_;
        ec_result <- Some pk_;
      }
    }
    return ec_result;
  }

  proc d_PKENC(m0 : bits_ptl, m1 : bits_ptl) : (bits_kctl * bits_dctl) option = {
    var ec_result : (bits_kctl * bits_dctl) option;
    var ec_done : bool;
    var ec_r1 : (bits_kctl * bits_dkeyl) option;
    var invoke_result_1 : (bits_kctl * bits_dkeyl);
    var c_kem : bits_kctl;
    var k : bits_dkeyl;
    var ec_r2 : bits_dctl option;
    var c_dem : bits_dctl;
    var ec_r3 : bits_dctl option;
    ec_result <- None;
    ec_done <- false;
    if (!(pk = None)) {
      if (c = None) {
        ec_r1 <@ O.d_CORR_ENCAPS();
        if (!(ec_r1 = None)) {
          invoke_result_1 <- oget ec_r1;
          (c_kem, k) <- invoke_result_1;
          if (b) {
            ec_r2 <@ O.d_DEM_ENC(k, m1);
            if (!(ec_r2 = None)) {
              c_dem <- oget ec_r2;
            } else {
              ec_done <- true;
            }
          } else {
            ec_r3 <@ O.d_DEM_ENC(k, m0);
            if (!(ec_r3 = None)) {
              c_dem <- oget ec_r3;
            } else {
              ec_done <- true;
            }
          }
          if (!ec_done) {
            c <- Some (c_kem, c_dem);
            ec_result <- Some (c_kem, c_dem);
          }
        }
      }
    }
    return ec_result;
  }

  proc d_PKDEC(c_ : (bits_kctl * bits_dctl)) : bits_ptl option option = {
    var ec_result : bits_ptl option option;
    var c_kem : bits_kctl;
    var c_dem : bits_dctl;
    var ec_r1 : bits_dkeyl option option;
    var k : bits_dkeyl option;
    var ec_r2 : bits_ptl option;
    var m : bits_ptl;
    ec_result <- None;
    if (!(pk = None)) {
      if (!(c = None)) {
        if (!(c_ = oget c)) {
          (c_kem, c_dem) <- c_;
          ec_r1 <@ O.d_CORR_DECAPS(c_kem);
          if (!(ec_r1 = None)) {
            k <- oget ec_r1;
            if (k = None) {
              ec_result <- Some None;
            } else {
              if (!(k = None)) {
                ec_r2 <@ O.d_DEM_DEC(oget k, c_dem);
                if (!(ec_r2 = None)) {
                  m <- oget ec_r2;
                  ec_result <- Some (Some m);
                }
              }
            }
          }
        }
      }
    }
    return ec_result;
  }
}.

type Reduction_Correct_KEM_pkgstate = {
  Reduction_Correct_KEM_pk : bits_pkeyl option;
  Reduction_Correct_KEM_c : (bits_kctl * bits_dctl) option
}.
