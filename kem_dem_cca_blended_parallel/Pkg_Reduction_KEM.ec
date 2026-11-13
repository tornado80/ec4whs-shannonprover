(* Reduction_KEM: pkeyl = pkeyl, ptl = ptl, dkeyl = dkeyl, kctl = kctl, dctl = dctl *)

require import AllCore Distr FMap Int IntDiv Types.

module type Reduction_KEM_Imports = {
  proc d_DECAPS(c : bits_kctl) : bits_dkeyl option option
  proc d_DEM_DEC(k : bits_dkeyl, c : bits_dctl) : bits_ptl option
  proc d_DEM_ENC(k : bits_dkeyl, m : bits_ptl) : bits_dctl option
  proc d_ENCAPS() : (bits_kctl * bits_dkeyl) option
  proc d_KEMGEN() : bits_pkeyl option
}.

module Reduction_KEM (O : Reduction_KEM_Imports) = {
  var pk : bits_pkeyl option
  var c : (bits_kctl * bits_dctl) option
  var k : bits_dkeyl option
  var b : bool

  proc init(b_ : bool) : unit = {
    pk <- None;
    c <- None;
    k <- None;
    b <- b_;
  }

  proc d_PKGEN() : bits_pkeyl option = {
    var ec_result : bits_pkeyl option;
    var ec_r1 : bits_pkeyl option;
    var pk_ : bits_pkeyl;
    ec_result <- None;
    if (pk = None) {
      ec_r1 <@ O.d_KEMGEN();
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
    var k_ : bits_dkeyl;
    var ec_r2 : bits_dctl option;
    var c_dem : bits_dctl;
    var ec_r3 : bits_dctl option;
    ec_result <- None;
    ec_done <- false;
    if (!(pk = None)) {
      if (c = None) {
        ec_r1 <@ O.d_ENCAPS();
        if (!(ec_r1 = None)) {
          invoke_result_1 <- oget ec_r1;
          (c_kem, k_) <- invoke_result_1;
          k <- Some k_;
          if (b) {
            ec_r2 <@ O.d_DEM_ENC(k_, m1);
            if (!(ec_r2 = None)) {
              c_dem <- oget ec_r2;
            } else {
              ec_done <- true;
            }
          } else {
            ec_r3 <@ O.d_DEM_ENC(k_, m0);
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
    var ec_done : bool;
    var c_kem_ : bits_kctl;
    var c_dem : bits_dctl;
    var c_kem : bits_kctl;
    var d__ : bits_dctl;
    var ec_r1 : bits_dkeyl option option;
    var k_ : bits_dkeyl option;
    var ec_r2 : bits_ptl option;
    var m : bits_ptl;
    ec_result <- None;
    ec_done <- false;
    if (!(pk = None)) {
      if (!(c = None)) {
        if (!(c_ = oget c)) {
          (c_kem_, c_dem) <- c_;
          (c_kem, d__) <- oget c;
          if (!(c_kem_ = c_kem)) {
            ec_r1 <@ O.d_DECAPS(c_kem_);
            if (!(ec_r1 = None)) {
              k_ <- oget ec_r1;
            } else {
              ec_done <- true;
            }
          } else {
            k_ <- k;
          }
          if (!ec_done) {
            if (k_ = None) {
              ec_result <- Some None;
            } else {
              if (!(k_ = None)) {
                ec_r2 <@ O.d_DEM_DEC(oget k_, c_dem);
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

type Reduction_KEM_pkgstate = {
  Reduction_KEM_pk : bits_pkeyl option;
  Reduction_KEM_c : (bits_kctl * bits_dctl) option;
  Reduction_KEM_k : bits_dkeyl option
}.
