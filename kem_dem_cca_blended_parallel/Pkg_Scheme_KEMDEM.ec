(* Scheme_KEMDEM: pkeyl = pkeyl, skeyl = skeyl, ptl = ptl, dkeyl = dkeyl, kctl = kctl, dctl = dctl *)

require import AllCore Distr FMap Int IntDiv Types.

module type Scheme_KEMDEM_Imports = {
  proc d_DEM_DEC(k : bits_dkeyl, c : bits_dctl) : bits_ptl option
  proc d_DEM_ENC(k : bits_dkeyl, m : bits_ptl) : bits_dctl option
  proc d_KEM_DECAPS(sk : bits_skeyl, c : bits_kctl) : bits_dkeyl option option
  proc d_KEM_ENCAPS(pk : bits_pkeyl) : (bits_dkeyl * bits_kctl) option
  proc d_KEM_GEN() : (bits_pkeyl * bits_skeyl) option
}.

module Scheme_KEMDEM (O : Scheme_KEMDEM_Imports) = {
  proc d_GEN() : (bits_pkeyl * bits_skeyl) option = {
    var ec_result : (bits_pkeyl * bits_skeyl) option;
    var ec_r1 : (bits_pkeyl * bits_skeyl) option;
    var pk_sk : (bits_pkeyl * bits_skeyl);
    ec_result <- None;
    ec_r1 <@ O.d_KEM_GEN();
    if (!(ec_r1 = None)) {
      pk_sk <- oget ec_r1;
      ec_result <- Some pk_sk;
    }
    return ec_result;
  }

  proc d_ENC(pk : bits_pkeyl, m : bits_ptl) : (bits_kctl * bits_dctl) option = {
    var ec_result : (bits_kctl * bits_dctl) option;
    var ec_r1 : (bits_dkeyl * bits_kctl) option;
    var invoke_result_1 : (bits_dkeyl * bits_kctl);
    var k : bits_dkeyl;
    var c_kem : bits_kctl;
    var ec_r2 : bits_dctl option;
    var c_dem : bits_dctl;
    ec_result <- None;
    ec_r1 <@ O.d_KEM_ENCAPS(pk);
    if (!(ec_r1 = None)) {
      invoke_result_1 <- oget ec_r1;
      (k, c_kem) <- invoke_result_1;
      ec_r2 <@ O.d_DEM_ENC(k, m);
      if (!(ec_r2 = None)) {
        c_dem <- oget ec_r2;
        ec_result <- Some (c_kem, c_dem);
      }
    }
    return ec_result;
  }

  proc d_DEC(sk : bits_skeyl, c : (bits_kctl * bits_dctl)) : bits_ptl option option = {
    var ec_result : bits_ptl option option;
    var c_kem : bits_kctl;
    var c_dem : bits_dctl;
    var ec_r1 : bits_dkeyl option option;
    var k : bits_dkeyl option;
    var ec_r2 : bits_ptl option;
    var m : bits_ptl;
    ec_result <- None;
    (c_kem, c_dem) <- c;
    ec_r1 <@ O.d_KEM_DECAPS(sk, c_kem);
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
    return ec_result;
  }
}.
