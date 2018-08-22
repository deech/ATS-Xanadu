(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
SYM = "./../SATS/symbol.sats"
#staload
MAP = "./../SATS/symmap.sats"
//
typedef sym_t = $SYM.sym_t
vtypedef
symmap(itm:type) = $MAP.symmap(itm)
//
(* ****** ****** *)
//
vtypedef
symmaplst
(
  itm:type, n:int
) = list_vt(symmap(itm), n)
vtypedef
symmaplst
(itm:type) = [n:int] symmaplst(itm, n)
//
(* ****** ****** *)
//
fun
symmaplst_free
{itm:type}{n:nat} .<n>.
(xs: symmaplst(itm, n)): void =
(
  case+ xs of
  | ~list_vt_nil() => ()
  | ~list_vt_cons(x, xs) =>
     ($MAP.symmap_free(x); symmaplst_free(xs))
) // end of [symmaplst_free]
//
(* ****** ****** *)
//
fun
symmaplst_search
{itm:type}{n:nat} .<n>.
(
ms: !symmaplst(itm, n), k0: sym_t
) : Option_vt(itm) =
(
case+ ms of
| list_vt_nil
    () => None_vt()
  // list_vt_nil
| list_vt_cons
    (m1, ms2) => let
    val ans =
      $MAP.symmap_search(m1, k0)
    // end of [val]
  in
    case+ ans of
    | @Some_vt _ => ans where
      {
        prval () = fold@(ans)
      }
    | ~None_vt() => symmaplst_search(ms2, k0)
  end (* end of [list_vt_cons] *)
) (* end of [symmaplst_search] *)
//
(* ****** ****** *)

(* end of [xats_symenv.dats] *)