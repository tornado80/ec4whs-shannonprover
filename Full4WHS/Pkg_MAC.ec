(* MAC: n = n, mac = func_mac *)

require import AllCore Distr FMap Int IntDiv Types.

module MAC = {
  var d_Keys : ((int * int * int * bits_n * bits_n), bits_n) fmap
  var d_Values : (((int * int * int * bits_n * bits_n) * (bits_n * int)), bits_n) fmap
  var b : bool

  proc init(b_ : bool) : unit = {
    d_Keys <- empty;
    d_Values <- empty;
    b <- b_;
  }

  proc d_Init(handle : (int * int * int * bits_n * bits_n)) : unit option = {
    var ec_result : unit option;
    var key : bits_n;
    ec_result <- None;
    if (d_Keys.[handle] = None) {
      key <$ dbits_n;
      d_Keys.[handle] <- key;
      ec_result <- Some tt;
    } else {
      ec_result <- Some tt;
    }
    return ec_result;
  }

  proc d_Mac(handle : (int * int * int * bits_n * bits_n), value : (bits_n * int)) : bits_n option = {
    var ec_result : bits_n option;
    var key : bits_n option;
    var val1 : bits_n;
    var val2 : int;
    var tag : bits_n;
    ec_result <- None;
    key <- d_Keys.[handle];
    if (!(key = None)) {
      (val1, val2) <- value;
      tag <- func_mac (oget key) val1 val2;
      d_Values.[(handle, value)] <- tag;
      ec_result <- Some tag;
    }
    return ec_result;
  }

  proc d_Verify(handle : (int * int * int * bits_n * bits_n), value : (bits_n * int), tag : bits_n) : bool option = {
    var ec_result : bool option;
    var key : bits_n option;
    var entry : bits_n option;
    var val1 : bits_n;
    var val2 : int;
    var tag_ : bits_n;
    ec_result <- None;
    key <- d_Keys.[handle];
    if (!(key = None)) {
      if (b) {
        entry <- d_Values.[(handle, value)];
        if (entry = None) {
          ec_result <- Some false;
        } else {
          if (!(entry = None)) {
            if (!(oget entry = tag)) {
              ec_result <- Some false;
            } else {
              ec_result <- Some true;
            }
          }
        }
      } else {
        (val1, val2) <- value;
        tag_ <- func_mac (oget key) val1 val2;
        ec_result <- Some (tag = tag_);
      }
    }
    return ec_result;
  }
}.

type MAC_pkgstate = {
  MAC_d_Keys : ((int * int * int * bits_n * bits_n), bits_n) fmap;
  MAC_d_Values : (((int * int * int * bits_n * bits_n) * (bits_n * int)), bits_n) fmap
}.

type MAC_pkgparams = {
  MAC_param_mac : bits_n -> bits_n -> int -> bits_n;
  MAC_param_b : bool
}.
