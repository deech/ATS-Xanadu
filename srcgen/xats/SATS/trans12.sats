(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload "./symmap.sats"
//
(* ****** ****** *)
//
#staload
  FP0 = "./filepath.sats"
//
(* ****** ****** *)

#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
#staload S2E = "./staexp2.sats"
#staload D2E = "./dynexp2.sats"

(* ****** ****** *)

symintr trans12

(* ****** ****** *)

typedef fpath = $FP0.filepath

(* ****** ****** *)
//
typedef sort1 = $S1E.sort1
typedef sort1opt = $S1E.sort1opt
typedef sort1lst = $S1E.sort1lst
//
typedef s1arg = $S1E.s1arg
typedef s1marg = $S1E.s1marg
typedef s1arglst = $S1E.s1arglst
//
typedef s1rtcon = $S1E.s1rtcon
//
typedef s1exp = $S1E.s1exp
typedef s1eff = $S1E.s1eff
typedef s1expopt = $S1E.s1expopt
typedef s1explst = $S1E.s1explst
//
typedef s1qua = $S1E.s1qua
typedef s1qualst = $S1E.s1qualst
//
(* ****** ****** *)
//
typedef sort2 = $S2E.sort2
typedef sort2opt = $S2E.sort2opt
typedef sort2lst = $S2E.sort2lst
//
(* ****** ****** *)
//
typedef s2cst = $S2E.s2cst
typedef s2var = $S2E.s2var
//
typedef s2cstlst = $S2E.s2cstlst
typedef s2varlst = $S2E.s2varlst
//
(* ****** ****** *)
//
typedef s2exp = $S2E.s2exp
typedef s2eff = $S2E.s2eff
typedef s2expopt = $S2E.s2expopt
typedef s2explst = $S2E.s2explst
//
(* ****** ****** *)
//
typedef s2txt = $S2E.s2txt
typedef s2txtopt = $S2E.s2txtopt
//
(* ****** ****** *)
//
vtypedef
  s2cstlst_vt = $S2E.s2cstlst_vt
vtypedef
  s2varlst_vt = $S2E.s2varlst_vt
vtypedef
  s2explst_vt = $S2E.s2explst_vt
//
(* ****** ****** *)
//
vtypedef
  s2cstopt_vt = $S2E.s2cstopt_vt
vtypedef
  s2varopt_vt = $S2E.s2varopt_vt
vtypedef
  s2expopt_vt = $S2E.s2expopt_vt
vtypedef
  s2txtopt_vt = $S2E.s2txtopt_vt
//
(* ****** ****** *)

typedef fmodenv = $S2E.fmodenv

(* ****** ****** *)

typedef d1exp = $D1E.d1exp
typedef d1explst = $D1E.d1explst
typedef d1expopt = $D1E.d1expopt

(* ****** ****** *)

typedef d1ecl = $D1E.d1ecl
typedef d1eclist = $D1E.d1eclist

(* ****** ****** *)

typedef d2exp = $D2E.d2exp
typedef d2explst = $D2E.d2explst
typedef d2expopt = $D2E.d2expopt

(* ****** ****** *)

typedef d2ecl = $D2E.d2ecl
typedef d2eclist = $D2E.d2eclist

(* ****** ****** *)
//
typedef s2itm = $S2E.s2itm
typedef d2itm = $D2E.d2itm
//
typedef s2itmopt = $S2E.s2itmopt
typedef d2itmopt = $D2E.d2itmopt
//
vtypedef s2itmopt_vt = $S2E.s2itmopt_vt
vtypedef d2itmopt_vt = $D2E.d2itmopt_vt
//
(* ****** ****** *)
//
vtypedef s2tmap = symmap(s2txt)
vtypedef s2imap = symmap(s2itm)
vtypedef d2imap = symmap(d2itm)
//
(* ****** ****** *)

fun
fmodenv_make
( fp: fpath
, m0: s2tmap
, m1: s2imap
, m2: d2imap, d2cs: d2eclist
) : fmodenv // fmodenv_make

(* ****** ****** *)
//
(*
HX-2018-11-18:
Not waterproof but seems adequate
*)
fun
fmodenv_get_s2tmap
( menv
: fmodenv
) :
[
  l:addr
]
( s2tmap@l
, minus_v(fmodenv, s2tmap@l) | ptr(l))
fun
fmodenv_get_s2imap
( menv
: fmodenv
) :
[
  l:addr
]
( s2imap@l
, minus_v(fmodenv, s2imap@l) | ptr(l))
fun
fmodenv_get_d2imap
( menv
: fmodenv
) :
[
  l:addr
]
( d2imap@l
, minus_v(fmodenv, d2imap@l) | ptr(l))
//
(* ****** ****** *)
//
fun
fmodenv_get_d2eclist(fmodenv): d2eclist
//
(* ****** ****** *)
//
fun
the_sortenv_add
(tid: sym_t, s2t: s2txt): void
fun
the_sortenv_find
  (tid: sym_t): s2txtopt_vt
fun
the_sortenv_qfind
  (qua: sym_t, tid: sym_t): s2txtopt_vt
//
(* ****** ****** *)
//
absview sortenv_push_v
//
fun
the_sortenv_pop
  (sortenv_push_v | (*none*)): s2tmap
fun
the_sortenv_popfree
  (sortenv_push_v | (*none*)): (void)
fun
the_sortenv_pushnil
  ((*void*)): (sortenv_push_v | void)
//
fun
the_sortenv_locjoin
(
  pf1: sortenv_push_v
, pf2: sortenv_push_v | (*none*)
) : void // end of [the_sortenv_locjoin]
//
fun // p: pervasive
the_sortenv_pjoinwth0(map: s2tmap): void
fun // p: pervasive
the_sortenv_pjoinwth1(map: !s2tmap): void
//
(* ****** ****** *)
//
fun
the_sortenv_fprint(FILEref): void
fun
the_sortenv_println((*void*)): void
//
(* ****** ****** *)
//
fun
the_sexpenv_add
(tid: sym_t, s2i: s2itm): void
fun
the_sexpenv_add_cst(s2c: s2cst): void
fun
the_sexpenv_add_var(s2v: s2var): void
fun
the_sexpenv_add_varlst(s2vs: s2varlst): void
//
fun
the_sexpenv_find
  (tid: sym_t): s2itmopt_vt
fun
the_sexpenv_qfind
  (qua: sym_t, tid: sym_t): s2itmopt_vt
//
(* ****** ****** *)

absview sexpenv_push_v

(* ****** ****** *)
//
fun
the_sexpenv_pop
  (sexpenv_push_v | (*none*)): s2imap
fun
the_sexpenv_popfree
  (sexpenv_push_v | (*none*)): (void)
fun
the_sexpenv_pushnil
  ((*void*)): (sexpenv_push_v | void)
//
(* ****** ****** *)
//
fun
the_sexpenv_fprint(FILEref): void
fun
the_sexpenv_println((*void*)): void
//
(* ****** ****** *)
//
fun
s2cst_select_bin
( s2cs
: s2cstlst
, arg1: sort2
, arg2: sort2): Option_vt(s2cst)
//
fun
s2cst_select_list
( s2cs: s2cstlst
, s2es: s2explst): Option_vt(s2cst)
//
(* ****** ****** *)
//
fun
s1exp_get_s2cstlst(s1exp): s2cstlst
//
(* ****** ****** *)
//
fun
trans12_sort: sort1 -> sort2 
fun
trans12_sortopt: sort1opt -> sort2opt
fun
trans12_sortlst: sort1lst -> sort2lst
//
(*
overload trans12 with trans12_sort
overload trans12 with trans12_sortopt
overload trans12 with trans12_sortlst
*)
//
(* ****** ****** *)
//
fun
trans12_sarg: s1arg -> s2var
fun
trans12_smarg: s1marg -> s2varlst
//
fun
trans12_sarglst: s1arglst -> s2varlst
//
(* ****** ****** *)
//
fun
trans12_stxt: sort1 -> s2txt
//
(* ****** ****** *)
//
fun
trans12_squalst
( s1qs: s1qualst
, s2vs: &s2varlst_vt >> _
, s2ps: &s2explst_vt >> _): void
//
(* ****** ****** *)
//
fun
trans12_sexp: s1exp -> s2exp 
fun
trans12_sexpopt: s1expopt -> s2expopt
fun
trans12_sexplst: s1explst -> s2explst
//
(*
overload trans12 with trans12_sexp
overload trans12 with trans12_sexpopt
overload trans12 with trans12_sexplst
*)
//
(* ****** ****** *)
//
fun
trans12_sexp_ck
  (s1e0: s1exp, s2t0: sort2): s2exp
fun
trans12_sexplst_ck
  (s1es: s1explst, s2t0: sort2): s2explst
fun
trans12_sexplst_cks
  (s1es: s1explst, s2ts: sort2lst): s2explst
//
(* ****** ****** *)
//
fun
trans12_dexp: d1exp -> d2exp 
fun
trans12_dexpopt: d1expopt -> d2expopt
fun
trans12_dexplst: d1explst -> d2explst
//
(*
overload trans12 with trans12_dexp
overload trans12 with trans12_dexpopt
overload trans12 with trans12_dexplst
*)
//
(* ****** ****** *)

fun
trans12_decl: d1ecl -> d2ecl
fun
trans12_declist: d1eclist -> d2eclist
//
(*
overload trans12 with trans12_decl
overload trans12 with trans12_declopt
*)
//
(* ****** ****** *)

(* end of [xats_trans12.sats] *)
