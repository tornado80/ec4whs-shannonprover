(* Reduction_DEM: pkeyl = pkeyl, skeyl = skeyl, ptl = ptl, dkeyl = dkeyl, kctl = kctl, dctl = dctl *)

require import AllCore Distr FMap Int IntDiv Types.

module type Reduction_DEM_Imports = {
  proc d_DEC(c_ : bits_dctl) : bits_ptl option
  proc d_DEM_DEC(k : bits_dkeyl, c : bits_dctl) : bits_ptl option
  proc d_ENC(m0 : bits_ptl, m1 : bits_ptl) : bits_dctl option
  proc d_KEM_DECAPS(sk : bits_skeyl, c : bits_kctl) : bits_dkeyl option option
  proc d_KEM_ENCAPS(pk : bits_pkeyl) : (bits_dkeyl * bits_kctl) option
  proc d_KEM_GEN() : (bits_pkeyl * bits_skeyl) option
}.

module Reduction_DEM (O : Reduction_DEM_Imports) = {
  var sk : bits_skeyl option
  var pk : bits_pkeyl option
  var c : (bits_kctl * bits_dctl) option

  proc init() : unit = {
    sk <- None;
    pk <- None;
    c <- None;
  }

  proc d_PKGEN() : bits_pkeyl option = {
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

  proc d_PKENC(m0 : bits_ptl, m1 : bits_ptl) : (bits_kctl * bits_dctl) option = {
    var ec_result : (bits_kctl * bits_dctl) option;
    var ec_r1 : (bits_dkeyl * bits_kctl) option;
    var invoke_result_1 : (bits_dkeyl * bits_kctl);
    var d__ : bits_dkeyl;
    var c_kem : bits_kctl;
    var ec_r2 : bits_dctl option;
    var c_dem : bits_dctl;
    ec_result <- None;
    if (!(pk = None)) {
      if (c = None) {
        ec_r1 <@ O.d_KEM_ENCAPS(oget pk);
        if (!(ec_r1 = None)) {
          invoke_result_1 <- oget ec_r1;
          (d__, c_kem) <- invoke_result_1;
          ec_r2 <@ O.d_ENC(m0, m1);
          if (!(ec_r2 = None)) {
            c_dem <- oget ec_r2;
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
    var c_kem_ : bits_kctl;
    var c_dem : bits_dctl;
    var c_kem : bits_kctl;
    var d__ : bits_dctl;
    var ec_r1 : bits_dkeyl option option;
    var k : bits_dkeyl option;
    var ec_r2 : bits_ptl option;
    var m : bits_ptl;
    var ec_r3 : bits_ptl option;
    ec_result <- None;
    if (!(sk = None)) {
      if (!(c = None)) {
        if (!(c_ = oget c)) {
          (c_kem_, c_dem) <- c_;
          (c_kem, d__) <- oget c;
          if (!(c_kem_ = c_kem)) {
            ec_r1 <@ O.d_KEM_DECAPS(oget sk, c_kem_);
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
          } else {
            ec_r3 <@ O.d_DEC(c_dem);
            if (!(ec_r3 = None)) {
              m <- oget ec_r3;
              ec_result <- Some (Some m);
            }
          }
        }
      }
    }
    return ec_result;
  }
}.

type Reduction_DEM_pkgstate = {
  Reduction_DEM_sk : bits_skeyl option;
  Reduction_DEM_pk : bits_pkeyl option;
  Reduction_DEM_c : (bits_kctl * bits_dctl) option
}.
