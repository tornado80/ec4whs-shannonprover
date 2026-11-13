(* Scheme_DEM: dkeyl = dkeyl, ptl = ptl, dctl = dctl, dem_enc = func_dem_enc, dem_dec = func_dem_dec *)

require import AllCore Distr FMap Int IntDiv Types.

module Scheme_DEM = {
  proc d_DEM_ENC(k : bits_dkeyl, m : bits_ptl) : bits_dctl option = {
    var ec_result : bits_dctl option;
    ec_result <- None;
    ec_result <- Some (func_dem_enc k m);
    return ec_result;
  }

  proc d_DEM_DEC(k : bits_dkeyl, c : bits_dctl) : bits_ptl option = {
    var ec_result : bits_ptl option;
    ec_result <- None;
    ec_result <- Some (func_dem_dec k c);
    return ec_result;
  }
}.
