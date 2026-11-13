(* CCA_DEM: dkeyl = dkeyl, ptl = ptl, dctl = dctl *)

require import AllCore Distr FMap Int IntDiv Types.

module type CCA_DEM_Imports = {
  proc d_DEM_DEC(k : bits_dkeyl, c : bits_dctl) : bits_ptl option
  proc d_DEM_ENC(k : bits_dkeyl, m : bits_ptl) : bits_dctl option
}.

module CCA_DEM (O : CCA_DEM_Imports) = {
  var k : bits_dkeyl option
  var c : bits_dctl option
  var b : bool

  proc init(b_ : bool) : unit = {
    k <- None;
    c <- None;
    b <- b_;
  }

  proc d_ENC(m0 : bits_ptl, m1 : bits_ptl) : bits_dctl option = {
    var ec_result : bits_dctl option;
    var ec_done : bool;
    var k_ : bits_dkeyl;
    var ec_r1 : bits_dctl option;
    var c_ : bits_dctl;
    var ec_r2 : bits_dctl option;
    ec_result <- None;
    ec_done <- false;
    if (k = None) {
      k_ <$ dbits_dkeyl;
      k <- Some k_;
      if (b) {
        ec_r1 <@ O.d_DEM_ENC(k_, m1);
        if (!(ec_r1 = None)) {
          c_ <- oget ec_r1;
        } else {
          ec_done <- true;
        }
      } else {
        ec_r2 <@ O.d_DEM_ENC(k_, m0);
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
    return ec_result;
  }

  proc d_DEC(c_ : bits_dctl) : bits_ptl option = {
    var ec_result : bits_ptl option;
    var ec_r1 : bits_ptl option;
    var m : bits_ptl;
    ec_result <- None;
    if (!(k = None)) {
      if (!(c = None)) {
        if (!(c_ = oget c)) {
          ec_r1 <@ O.d_DEM_DEC(oget k, c_);
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

type CCA_DEM_pkgstate = {
  CCA_DEM_k : bits_dkeyl option;
  CCA_DEM_c : bits_dctl option
}.
