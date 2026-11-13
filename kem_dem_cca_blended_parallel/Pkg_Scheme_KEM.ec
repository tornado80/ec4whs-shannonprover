(* Scheme_KEM: pkeyl = pkeyl, skeyl = skeyl, dkeyl = dkeyl, kctl = kctl, kgenr = kgenr, kencr = kencr, kem_gen = func_kem_gen, kem_encaps = func_kem_encaps, kem_decaps = func_kem_decaps *)

require import AllCore Distr FMap Int IntDiv Types.

module Scheme_KEM = {
  var st : bits

  proc init() : unit = {
    st <- zero;
  }

  proc d_KEM_GEN() : (bits_pkeyl * bits_skeyl) option = {
    var ec_result : (bits_pkeyl * bits_skeyl) option;
    var r : bits_kgenr;
    var pk : bits_pkeyl;
    var sk : bits_skeyl;
    ec_result <- None;
    r <$ dbits_kgenr;
    (st, pk, sk) <- func_kem_gen st r;
    ec_result <- Some (pk, sk);
    return ec_result;
  }

  proc d_KEM_ENCAPS(pk : bits_pkeyl) : (bits_dkeyl * bits_kctl) option = {
    var ec_result : (bits_dkeyl * bits_kctl) option;
    var r : bits_kencr;
    var k : bits_dkeyl;
    var c : bits_kctl;
    ec_result <- None;
    r <$ dbits_kencr;
    (st, k, c) <- func_kem_encaps st r pk;
    ec_result <- Some (k, c);
    return ec_result;
  }

  proc d_KEM_DECAPS(sk : bits_skeyl, c : bits_kctl) : bits_dkeyl option option = {
    var ec_result : bits_dkeyl option option;
    var k : bits_dkeyl option;
    ec_result <- None;
    (st, k) <- func_kem_decaps st sk c;
    ec_result <- Some k;
    return ec_result;
  }
}.

type Scheme_KEM_pkgstate = {
  Scheme_KEM_st : bits
}.
