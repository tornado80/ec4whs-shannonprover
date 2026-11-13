(* KX_noprfkey: n = n, mac = func_mac *)

require import AllCore Distr FMap Int IntDiv Types.

module type KX_noprfkey_Imports = {
  proc d_Eval(h : int, x : (int * int * bits_n * bits_n * bool)) : bits_n option
  proc d_Hon(h : int) : bool option
  proc d_Run1(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int)) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n) option
  proc d_Run2(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int), ni : bits_n) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n)) option
  proc d_Run3(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int), msg : (bits_n * bits_n)) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n)) option
  proc d_Run4(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int), msg : (bits_n * bits_n)) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n) option
  proc d_Run5(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int), tau : bits_n) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bool) option
}.

module KX_noprfkey (O : KX_noprfkey_Imports) = {
  var ctr_ : int
  var d_RevTested : ((int * int * bits_n * bits_n * bits_n), bool) fmap
  var d_Fresh : (int, bool) fmap
  var d_RevTestEval : ((int * int * int * bits_n * bits_n), int) fmap
  var d_ReverseMac : (((int * int * int * bits_n * bits_n) * (bits_n * int)), int) fmap
  var d_First : ((int * int * bits_n * bits_n * bits_n), int) fmap
  var d_Second : ((int * int * bits_n * bits_n * bits_n), int) fmap
  var d_State : (int, (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int)) fmap
  var btest : bool
  var bleast : bool

  proc init(btest_ : bool, bleast_ : bool) : unit = {
    ctr_ <- 0;
    d_RevTested <- empty;
    d_Fresh <- empty;
    d_RevTestEval <- empty;
    d_ReverseMac <- empty;
    d_First <- empty;
    d_Second <- empty;
    d_State <- empty;
    btest <- btest_;
    bleast <- bleast_;
  }

  proc d_NewSession(d_U : int, u : bool, d_V : int, kid : int) : int option = {
    var ec_result : int option;
    var ec_r1 : bool option;
    var hon : bool;
    ec_result <- None;
    ctr_ <- ctr_ + 1;
    d_State.[ctr_] <- (d_U, u, d_V, kid, None, None, None, None, None, None, 0);
    ec_r1 <@ O.d_Hon(kid);
    if (!(ec_r1 = None)) {
      hon <- oget ec_r1;
      d_Fresh.[ctr_] <- hon;
      ec_result <- Some ctr_;
    }
    return ec_result;
  }

  proc d_Send1(ctr : int) : bits_n option = {
    var ec_result : bits_n option;
    var state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int);
    var ec_r1 : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n) option;
    var d_return : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n);
    var msg : bits_n;
    ec_result <- None;
    if (!(d_State.[ctr] = None)) {
      state <- oget d_State.[ctr];
      ec_r1 <@ O.d_Run1(state);
      if (!(ec_r1 = None)) {
        d_return <- oget ec_r1;
        (state, msg) <- d_return;
        d_State.[ctr] <- state;
        ec_result <- Some msg;
      }
    }
    return ec_result;
  }

  proc d_Send2(ctr : int, msg : bits_n) : (bits_n * bits_n) option = {
    var ec_result : (bits_n * bits_n) option;
    var state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int);
    var ec_r1 : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n)) option;
    var d_return : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n));
    var msg_ : (bits_n * bits_n);
    var d_U : int;
    var u : bool;
    var d_V : int;
    var kid : int;
    var acc : bool option;
    var k : bits_n option;
    var ni : bits_n option;
    var nr : bits_n option;
    var kmac : bits_n option;
    var sid : (int * int * bits_n * bits_n * bits_n) option;
    var mess : int;
    ec_result <- None;
    if (!(d_State.[ctr] = None)) {
      state <- oget d_State.[ctr];
      ec_r1 <@ O.d_Run2(state, msg);
      if (!(ec_r1 = None)) {
        d_return <- oget ec_r1;
        (state, msg_) <- d_return;
        d_State.[ctr] <- state;
        (d_U, u, d_V, kid, acc, k, ni, nr, kmac, sid, mess) <- state;
        if (!(ni = None)) {
          if (!(nr = None)) {
            d_ReverseMac.[((kid, d_U, d_V, oget ni, oget nr), (oget nr, 2))] <- ctr;
            ec_result <- Some msg_;
          }
        }
      }
    }
    return ec_result;
  }

  proc d_Send3(ctr : int, msg : (bits_n * bits_n)) : (bits_n * bits_n) option = {
    var ec_result : (bits_n * bits_n) option;
    var ec_done : bool;
    var state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int);
    var ec_r1 : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n)) option;
    var d_return : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n));
    var msg_ : (bits_n * bits_n);
    var d_U : int;
    var u : bool;
    var d_V : int;
    var kid : int;
    var acc : bool option;
    var k : bits_n option;
    var ni : bits_n option;
    var nr : bits_n option;
    var kmac : bits_n option;
    var sid : (int * int * bits_n * bits_n * bits_n) option;
    var mess : int;
    ec_result <- None;
    ec_done <- false;
    if (!(d_State.[ctr] = None)) {
      state <- oget d_State.[ctr];
      ec_r1 <@ O.d_Run3(state, msg);
      if (!(ec_r1 = None)) {
        d_return <- oget ec_r1;
        (state, msg_) <- d_return;
        (d_U, u, d_V, kid, acc, k, ni, nr, kmac, sid, mess) <- state;
        if (mess = 2) {
          if (!(sid = None)) {
            if (d_First.[oget sid] = None) {
              d_First.[oget sid] <- ctr;
            } else {
              if (d_Second.[oget sid] = None) {
                d_Second.[oget sid] <- ctr;
              }
            }
            if (!(ni = None)) {
              if (!(nr = None)) {
                d_ReverseMac.[((kid, d_U, d_V, oget ni, oget nr), (oget ni, 3))] <- ctr;
              } else {
                ec_done <- true;
              }
            } else {
              ec_done <- true;
            }
          } else {
            ec_done <- true;
          }
        }
        if (!ec_done) {
          d_State.[ctr] <- state;
          ec_result <- Some msg_;
        }
      }
    }
    return ec_result;
  }

  proc d_Send4(ctr : int, msg : (bits_n * bits_n)) : bits_n option = {
    var ec_result : bits_n option;
    var ec_done : bool;
    var state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int);
    var ec_r1 : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n) option;
    var d_return : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n);
    var msg_ : bits_n;
    var d_U : int;
    var u : bool;
    var d_V : int;
    var kid : int;
    var acc : bool option;
    var k : bits_n option;
    var ni : bits_n option;
    var nr : bits_n option;
    var kmac : bits_n option;
    var sid : (int * int * bits_n * bits_n * bits_n) option;
    var mess : int;
    ec_result <- None;
    ec_done <- false;
    if (!(d_State.[ctr] = None)) {
      state <- oget d_State.[ctr];
      ec_r1 <@ O.d_Run4(state, msg);
      if (!(ec_r1 = None)) {
        d_return <- oget ec_r1;
        (state, msg_) <- d_return;
        d_State.[ctr] <- state;
        (d_U, u, d_V, kid, acc, k, ni, nr, kmac, sid, mess) <- state;
        if (acc = Some true) {
          if (!(sid = None)) {
            if (d_First.[oget sid] = None) {
              d_First.[oget sid] <- ctr;
            } else {
              if (d_Second.[oget sid] = None) {
                d_Second.[oget sid] <- ctr;
              }
            }
            if (!(ni = None)) {
              if (!(nr = None)) {
                d_ReverseMac.[((kid, d_U, d_V, oget ni, oget nr), (zero_n, 4))] <- ctr;
              } else {
                ec_done <- true;
              }
            } else {
              ec_done <- true;
            }
          } else {
            ec_done <- true;
          }
        }
        if (!ec_done) {
          ec_result <- Some msg_;
        }
      }
    }
    return ec_result;
  }

  proc d_Send5(ctr : int, msg : bits_n) : bool option = {
    var ec_result : bool option;
    var state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int);
    var ec_r1 : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bool) option;
    var d_return : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bool);
    var stop : bool;
    ec_result <- None;
    if (!(d_State.[ctr] = None)) {
      state <- oget d_State.[ctr];
      ec_r1 <@ O.d_Run5(state, msg);
      if (!(ec_r1 = None)) {
        d_return <- oget ec_r1;
        (state, stop) <- d_return;
        d_State.[ctr] <- state;
        ec_result <- Some stop;
      }
    }
    return ec_result;
  }

  proc d_Reveal(ctr : int) : bits_n option = {
    var ec_result : bits_n option;
    var d_U : int;
    var u : bool;
    var d_V : int;
    var kid : int;
    var acc : bool option;
    var _k : bits_n option;
    var ni : bits_n option;
    var nr : bits_n option;
    var kmac : bits_n option;
    var sid : (int * int * bits_n * bits_n * bits_n) option;
    var mess : int;
    var ec_r1 : bits_n option;
    var k : bits_n;
    ec_result <- None;
    if (!(d_State.[ctr] = None)) {
      (d_U, u, d_V, kid, acc, _k, ni, nr, kmac, sid, mess) <- oget d_State.[ctr];
      if (acc = Some true) {
        if (!(sid = None)) {
          if (d_RevTested.[oget sid] = None) {
            d_RevTested.[oget sid] <- false;
            if (!(ni = None)) {
              if (!(nr = None)) {
                d_RevTestEval.[(kid, d_U, d_V, oget ni, oget nr)] <- ctr;
                ec_r1 <@ O.d_Eval(kid, (d_U, d_V, oget ni, oget nr, true));
                if (!(ec_r1 = None)) {
                  k <- oget ec_r1;
                  ec_result <- Some k;
                }
              }
            }
          }
        }
      }
    }
    return ec_result;
  }

  proc d_Test(ctr : int) : bits_n option = {
    var ec_result : bits_n option;
    var ec_done : bool;
    var d_U : int;
    var u : bool;
    var d_V : int;
    var kid : int;
    var acc : bool option;
    var _k : bits_n option;
    var ni : bits_n option;
    var nr : bits_n option;
    var kmac : bits_n option;
    var sid : (int * int * bits_n * bits_n * bits_n) option;
    var mess : int;
    var k : bits_n;
    var ec_r1 : bits_n option;
    ec_result <- None;
    ec_done <- false;
    if (!(d_State.[ctr] = None)) {
      (d_U, u, d_V, kid, acc, _k, ni, nr, kmac, sid, mess) <- oget d_State.[ctr];
      if (acc = Some true) {
        if (!(d_Fresh.[ctr] = None)) {
          if (oget d_Fresh.[ctr]) {
            if (!(sid = None)) {
              if (d_RevTested.[oget sid] = None) {
                d_RevTested.[oget sid] <- true;
                if (btest) {
                  k <$ dbits_n;
                } else {
                  if (!(ni = None)) {
                    if (!(nr = None)) {
                      d_RevTestEval.[(kid, d_U, d_V, oget ni, oget nr)] <- ctr;
                      ec_r1 <@ O.d_Eval(kid, (d_U, d_V, oget ni, oget nr, true));
                      if (!(ec_r1 = None)) {
                        k <- oget ec_r1;
                      } else {
                        ec_done <- true;
                      }
                    } else {
                      ec_done <- true;
                    }
                  } else {
                    ec_done <- true;
                  }
                }
                if (!ec_done) {
                  ec_result <- Some k;
                }
              }
            }
          }
        }
      }
    }
    return ec_result;
  }

  proc d_SameKey(ctr1 : int, ctr2 : int) : bool option = {
    var ec_result : bool option;
    var _U : int;
    var _u : bool;
    var _V : int;
    var _kid : int;
    var acc1 : bool option;
    var k1 : bits_n option;
    var _ni : bits_n option;
    var _nr : bits_n option;
    var _kmac : bits_n option;
    var sid1 : (int * int * bits_n * bits_n * bits_n) option;
    var _mess : int;
    var acc2 : bool option;
    var k2 : bits_n option;
    var sid2 : (int * int * bits_n * bits_n * bits_n) option;
    ec_result <- None;
    if (!(d_State.[ctr1] = None)) {
      (_U, _u, _V, _kid, acc1, k1, _ni, _nr, _kmac, sid1, _mess) <- oget d_State.[ctr1];
      if (!(d_State.[ctr2] = None)) {
        (_U, _u, _V, _kid, acc2, k2, _ni, _nr, _kmac, sid2, _mess) <- oget d_State.[ctr2];
        ec_result <- Some false;
      }
    }
    return ec_result;
  }

  proc d_AtMost(ctr1 : int, ctr2 : int, ctr3 : int) : bool option = {
    var ec_result : bool option;
    var _U : int;
    var _u : bool;
    var _V : int;
    var _kid : int;
    var acc1 : bool option;
    var _k : bits_n option;
    var _ni : bits_n option;
    var _nr : bits_n option;
    var _kmac : bits_n option;
    var sid1 : (int * int * bits_n * bits_n * bits_n) option;
    var _mess : int;
    var acc2 : bool option;
    var sid2 : (int * int * bits_n * bits_n * bits_n) option;
    var acc3 : bool option;
    var sid3 : (int * int * bits_n * bits_n * bits_n) option;
    ec_result <- None;
    if (!(d_State.[ctr1] = None)) {
      (_U, _u, _V, _kid, acc1, _k, _ni, _nr, _kmac, sid1, _mess) <- oget d_State.[ctr1];
      if (!(d_State.[ctr2] = None)) {
        (_U, _u, _V, _kid, acc2, _k, _ni, _nr, _kmac, sid2, _mess) <- oget d_State.[ctr2];
        if (!(d_State.[ctr3] = None)) {
          (_U, _u, _V, _kid, acc3, _k, _ni, _nr, _kmac, sid3, _mess) <- oget d_State.[ctr3];
          ec_result <- Some false;
        }
      }
    }
    return ec_result;
  }

  proc d_AtLeast(sid : (int * int * bits_n * bits_n * bits_n)) : bool option = {
    var ec_result : bool option;
    var ec_done : bool;
    var _U : int;
    var _u : bool;
    var _V : int;
    var _kid : int;
    var acc1 : bool option;
    var _k : bits_n option;
    var _ni : bits_n option;
    var _nr : bits_n option;
    var _kmac : bits_n option;
    var _sid : (int * int * bits_n * bits_n * bits_n) option;
    var _mess : int;
    ec_result <- None;
    ec_done <- false;
    if (bleast = false /\ !(d_First.[sid] = None) /\ d_Second.[sid] = None) {
      if (!(d_First.[sid] = None)) {
        if (!(d_State.[oget d_First.[sid]] = None)) {
          (_U, _u, _V, _kid, acc1, _k, _ni, _nr, _kmac, _sid, _mess) <- oget d_State.[oget d_First.[sid]];
          if (acc1 = Some true /\ d_Fresh.[oget d_First.[sid]] = Some true) {
            ec_result <- Some true;
            ec_done <- true;
          }
        } else {
          ec_done <- true;
        }
      } else {
        ec_done <- true;
      }
    }
    if (!ec_done) {
      ec_result <- Some false;
    }
    return ec_result;
  }
}.

type KX_noprfkey_pkgstate = {
  KX_noprfkey_ctr_ : int;
  KX_noprfkey_d_RevTested : ((int * int * bits_n * bits_n * bits_n), bool) fmap;
  KX_noprfkey_d_Fresh : (int, bool) fmap;
  KX_noprfkey_d_RevTestEval : ((int * int * int * bits_n * bits_n), int) fmap;
  KX_noprfkey_d_ReverseMac : (((int * int * int * bits_n * bits_n) * (bits_n * int)), int) fmap;
  KX_noprfkey_d_First : ((int * int * bits_n * bits_n * bits_n), int) fmap;
  KX_noprfkey_d_Second : ((int * int * bits_n * bits_n * bits_n), int) fmap;
  KX_noprfkey_d_State : (int, (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int)) fmap
}.

type KX_noprfkey_pkgparams = {
  KX_noprfkey_param_btest : bool;
  KX_noprfkey_param_bleast : bool;
  KX_noprfkey_param_mac : bits_n -> bits_n -> int -> bits_n
}.
