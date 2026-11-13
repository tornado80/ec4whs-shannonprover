(* ReductionMac: n = n, mac = func_mac *)

require import AllCore Distr FMap Int IntDiv Types.

module type ReductionMac_Imports = {
  proc d_Eval(kid : int, x : (int * int * bits_n * bits_n * bool)) : bits_n option
  proc d_Hon(h : int) : bool option
  proc d_Init(handle : (int * int * int * bits_n * bits_n)) : unit option
  proc d_Mac(handle : (int * int * int * bits_n * bits_n), value : (bits_n * int)) : bits_n option
  proc d_Sample() : bits_n option
  proc d_Verify(handle : (int * int * int * bits_n * bits_n), value : (bits_n * int), tag : bits_n) : bool option
}.

module ReductionMac (O : ReductionMac_Imports) = {
  proc d_Run1(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int)) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n) option = {
    var ec_result : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n) option;
    var d_U : int;
    var u : bool;
    var d_V : int;
    var kid : int;
    var acc : bool option;
    var k : bits_n option;
    var ni_ : bits_n option;
    var nr : bits_n option;
    var kmac : bits_n option;
    var sid : (int * int * bits_n * bits_n * bits_n) option;
    var mess : int;
    var ec_r1 : bits_n option;
    var ni : bits_n;
    ec_result <- None;
    (d_U, u, d_V, kid, acc, k, ni_, nr, kmac, sid, mess) <- state;
    if (acc = None) {
      if (mess = 0) {
        if (u = false) {
          ec_r1 <@ O.d_Sample();
          if (!(ec_r1 = None)) {
            ni <- oget ec_r1;
            ec_result <- Some ((d_U, u, d_V, kid, None, k, Some ni, nr, kmac, sid, 1), ni);
          }
        }
      }
    }
    return ec_result;
  }

  proc d_Run2(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int), ni : bits_n) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n)) option = {
    var ec_result : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n)) option;
    var ec_done : bool;
    var d_U : int;
    var v : bool;
    var d_V : int;
    var kid : int;
    var acc : bool option;
    var k_ : bits_n option;
    var ni_ : bits_n option;
    var nr_ : bits_n option;
    var kmac__ : bits_n option;
    var sid_ : (int * int * bits_n * bits_n * bits_n) option;
    var mess : int;
    var ec_r1 : bits_n option;
    var nr : bits_n;
    var ec_r2 : bool option;
    var hon : bool;
    var ec_r3 : unit option;
    var d__ : unit;
    var ec_r4 : bits_n option;
    var tau : bits_n;
    var kmac : bits_n option;
    var ec_r5 : bits_n option;
    var kmac_ : bits_n;
    var sid : (int * int * bits_n * bits_n * bits_n);
    ec_result <- None;
    ec_done <- false;
    (d_U, v, d_V, kid, acc, k_, ni_, nr_, kmac__, sid_, mess) <- state;
    if (acc = None) {
      if (mess = 0) {
        if (v = true) {
          ec_r1 <@ O.d_Sample();
          if (!(ec_r1 = None)) {
            nr <- oget ec_r1;
            ec_r2 <@ O.d_Hon(kid);
            if (!(ec_r2 = None)) {
              hon <- oget ec_r2;
              if (hon) {
                ec_r3 <@ O.d_Init((kid, d_U, d_V, ni, nr));
                if (!(ec_r3 = None)) {
                  d__ <- oget ec_r3;
                  ec_r4 <@ O.d_Mac((kid, d_U, d_V, ni, nr), (nr, 2));
                  if (!(ec_r4 = None)) {
                    tau <- oget ec_r4;
                    kmac <- None;
                  } else {
                    ec_done <- true;
                  }
                } else {
                  ec_done <- true;
                }
              } else {
                ec_r5 <@ O.d_Eval(kid, (d_U, d_V, ni, nr, false));
                if (!(ec_r5 = None)) {
                  kmac_ <- oget ec_r5;
                  tau <- func_mac kmac_ nr 2;
                  kmac <- Some kmac_;
                } else {
                  ec_done <- true;
                }
              }
              if (!ec_done) {
                sid <- (d_U, d_V, ni, nr, tau);
                ec_result <- Some ((d_U, v, d_V, kid, None, None, Some ni, Some nr, kmac, Some sid, 1), (nr, tau));
              }
            }
          }
        }
      }
    }
    return ec_result;
  }

  proc d_Run3(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int), msg : (bits_n * bits_n)) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n)) option = {
    var ec_result : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * (bits_n * bits_n)) option;
    var ec_done : bool;
    var d_U : int;
    var u : bool;
    var d_V : int;
    var kid : int;
    var acc : bool option;
    var k_ : bits_n option;
    var ni : bits_n option;
    var nr_ : bits_n option;
    var kmac__ : bits_n option;
    var sid_ : (int * int * bits_n * bits_n * bits_n) option;
    var mess : int;
    var nr : bits_n;
    var tau : bits_n;
    var ec_r1 : bool option;
    var hon : bool;
    var ec_r2 : unit option;
    var d__ : unit;
    var kmac : bits_n option;
    var ec_r3 : bits_n option;
    var kmac_ : bits_n;
    var sid : (int * int * bits_n * bits_n * bits_n);
    var ec_r4 : bool option;
    var verified : bool;
    var ec_r5 : bits_n option;
    var tau_new : bits_n;
    ec_result <- None;
    ec_done <- false;
    (d_U, u, d_V, kid, acc, k_, ni, nr_, kmac__, sid_, mess) <- state;
    if (mess = 1) {
      if (acc = None) {
        if (u = false) {
          (nr, tau) <- msg;
          ec_r1 <@ O.d_Hon(kid);
          if (!(ec_r1 = None)) {
            hon <- oget ec_r1;
            if (hon) {
              if (!(ni = None)) {
                ec_r2 <@ O.d_Init((kid, d_U, d_V, oget ni, nr));
                if (!(ec_r2 = None)) {
                  d__ <- oget ec_r2;
                  kmac <- None;
                } else {
                  ec_done <- true;
                }
              } else {
                ec_done <- true;
              }
            } else {
              if (!(ni = None)) {
                ec_r3 <@ O.d_Eval(kid, (d_U, d_V, oget ni, nr, false));
                if (!(ec_r3 = None)) {
                  kmac_ <- oget ec_r3;
                  kmac <- Some kmac_;
                } else {
                  ec_done <- true;
                }
              } else {
                ec_done <- true;
              }
            }
            if (!ec_done) {
              if (!(ni = None)) {
                sid <- (d_U, d_V, oget ni, nr, tau);
                if (hon) {
                  ec_r4 <@ O.d_Verify((kid, d_U, d_V, oget ni, nr), (nr, 2), tau);
                  if (!(ec_r4 = None)) {
                    verified <- oget ec_r4;
                  } else {
                    ec_done <- true;
                  }
                } else {
                  if (!(kmac = None)) {
                    verified <- func_mac (oget kmac) nr 2 = tau;
                  } else {
                    ec_done <- true;
                  }
                }
                if (!ec_done) {
                  if (verified) {
                    if (hon) {
                      ec_r5 <@ O.d_Mac((kid, d_U, d_V, oget ni, nr), (oget ni, 3));
                      if (!(ec_r5 = None)) {
                        tau_new <- oget ec_r5;
                      } else {
                        ec_done <- true;
                      }
                    } else {
                      if (!(kmac = None)) {
                        tau_new <- func_mac (oget kmac) (oget ni) 3;
                      } else {
                        ec_done <- true;
                      }
                    }
                    if (!ec_done) {
                      ec_result <- Some ((d_U, u, d_V, kid, None, None, ni, Some nr, kmac, Some sid, 2), (oget ni, tau_new));
                    }
                  } else {
                    ec_result <- Some (state, (zero_n, zero_n));
                  }
                }
              }
            }
          }
        }
      }
    }
    return ec_result;
  }

  proc d_Run4(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int), msg : (bits_n * bits_n)) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n) option = {
    var ec_result : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bits_n) option;
    var ec_done : bool;
    var d_U : int;
    var v : bool;
    var d_V : int;
    var kid : int;
    var acc : bool option;
    var k : bits_n option;
    var ni_ : bits_n option;
    var nr : bits_n option;
    var kmac : bits_n option;
    var sid : (int * int * bits_n * bits_n * bits_n) option;
    var mess : int;
    var ni : bits_n;
    var tau : bits_n;
    var ec_r1 : bool option;
    var hon : bool;
    var ec_r2 : bool option;
    var verified : bool;
    var ec_r3 : bits_n option;
    var tau_new : bits_n;
    ec_result <- None;
    ec_done <- false;
    (d_U, v, d_V, kid, acc, k, ni_, nr, kmac, sid, mess) <- state;
    if (acc = None) {
      if (mess = 1) {
        if (v = true) {
          (ni, tau) <- msg;
          ec_r1 <@ O.d_Hon(kid);
          if (!(ec_r1 = None)) {
            hon <- oget ec_r1;
            if (hon) {
              if (!(ni_ = None)) {
                if (!(nr = None)) {
                  ec_r2 <@ O.d_Verify((kid, d_U, d_V, oget ni_, oget nr), (ni, 3), tau);
                  if (!(ec_r2 = None)) {
                    verified <- oget ec_r2;
                  } else {
                    ec_done <- true;
                  }
                } else {
                  ec_done <- true;
                }
              } else {
                ec_done <- true;
              }
            } else {
              if (!(kmac = None)) {
                verified <- func_mac (oget kmac) ni 3 = tau;
              } else {
                ec_done <- true;
              }
            }
            if (!ec_done) {
              if (!(ni_ = None)) {
                if (verified /\ ni = oget ni_) {
                  acc <- Some true;
                  if (hon) {
                    if (!(nr = None)) {
                      ec_r3 <@ O.d_Mac((kid, d_U, d_V, oget ni_, oget nr), (zero_n, 4));
                      if (!(ec_r3 = None)) {
                        tau_new <- oget ec_r3;
                      } else {
                        ec_done <- true;
                      }
                    } else {
                      ec_done <- true;
                    }
                  } else {
                    if (!(kmac = None)) {
                      tau_new <- func_mac (oget kmac) zero_n 4;
                    } else {
                      ec_done <- true;
                    }
                  }
                  if (!ec_done) {
                    ec_result <- Some ((d_U, v, d_V, kid, acc, k, ni_, nr, kmac, sid, 2), tau_new);
                  }
                } else {
                  acc <- Some false;
                  ec_result <- Some ((d_U, v, d_V, kid, acc, k, ni_, nr, kmac, sid, 2), zero_n);
                }
              }
            }
          }
        }
      }
    }
    return ec_result;
  }

  proc d_Run5(state : (int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int), tau : bits_n) : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bool) option = {
    var ec_result : ((int * bool * int * int * bool option * bits_n option * bits_n option * bits_n option * bits_n option * (int * int * bits_n * bits_n * bits_n) option * int) * bool) option;
    var ec_done : bool;
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
    var ec_r1 : bool option;
    var hon : bool;
    var ec_r2 : bool option;
    var verified : bool;
    ec_result <- None;
    ec_done <- false;
    (d_U, u, d_V, kid, acc, k, ni, nr, kmac, sid, mess) <- state;
    if (acc = None) {
      if (mess = 2) {
        if (u = false) {
          ec_r1 <@ O.d_Hon(kid);
          if (!(ec_r1 = None)) {
            hon <- oget ec_r1;
            if (hon) {
              if (!(ni = None)) {
                if (!(nr = None)) {
                  ec_r2 <@ O.d_Verify((kid, d_U, d_V, oget ni, oget nr), (zero_n, 4), tau);
                  if (!(ec_r2 = None)) {
                    verified <- oget ec_r2;
                  } else {
                    ec_done <- true;
                  }
                } else {
                  ec_done <- true;
                }
              } else {
                ec_done <- true;
              }
            } else {
              if (!(kmac = None)) {
                verified <- func_mac (oget kmac) zero_n 4 = tau;
              } else {
                ec_done <- true;
              }
            }
            if (!ec_done) {
              if (verified) {
                ec_result <- Some ((d_U, u, d_V, kid, Some true, k, ni, nr, kmac, sid, 3), true);
              } else {
                ec_result <- Some (state, false);
              }
            }
          }
        }
      }
    }
    return ec_result;
  }
}.

type ReductionMac_pkgparams = {
  ReductionMac_param_mac : bits_n -> bits_n -> int -> bits_n
}.
