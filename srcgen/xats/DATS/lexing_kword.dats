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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload"./../SATS/basics.sats"
#staload"./../SATS/symbol.sats"
#staload"./../SATS/lexing.sats"
//
(* ****** ****** *)
//
macdef
T_CASE_ = T_CASE(0)
(*
macdef
T_CASEP_ = T_CASE( 1)
macdef
T_CASEN_ = T_CASE(~1)
*)
//
(* ****** ****** *)
//
macdef
T_FN_ = T_FUN(FNKfn0)
macdef
T_FN0_ = T_FUN(FNKfn0)
macdef
T_FNX_ = T_FUN(FNKfnx)
macdef
T_FN1_ = T_FUN(FNKfn1)
macdef
T_FUN_ = T_FUN(FNKfn1)
//
macdef
T_PRFN_ = T_FUN(FNKprfn0)
macdef
T_PRFN0_ = T_FUN(FNKprfn0)
macdef
T_PRFN1_ = T_FUN(FNKprfn1)
macdef
T_PRFUN_ = T_FUN(FNKprfn1)
macdef
T_PRAXI_ = T_FUN(FNKpraxi)
//
macdef
T_CASTFN_ = T_FUN(FNKcastfn)
//
(* ****** ****** *)
//
macdef
T_VAL_ = T_VAL(VLKval)
//
macdef
T_VALP_ = T_VAL(VLKvalp)
macdef
T_VALN_ = T_VAL(VLKvaln)
//
macdef
T_PRVAL_ = T_VAL(VLKprval)
//
(* ****** ****** *)
//
macdef
T_IMPLMNT_ = T_IMPLMNT(IMPval)
macdef
T_PRIMPLMNT_ = T_IMPLMNT(IMPprf)
//
(* ****** ****** *)
//
macdef
T_SEXPDEF_ = T_SEXPDEF(0)
macdef
T_PROPDEF_ = T_SEXPDEF(PROPSORT)
macdef
T_VIEWDEF_ = T_SEXPDEF(VIEWSORT)
macdef
T_TYPEDEF_ = T_SEXPDEF(TYPESORT)
macdef
T_VTYPEDEF_ = T_SEXPDEF(VTYPESORT)
//
macdef
T_ABSTYPE_ = T_ABSTYPE(TYPESORT)
//
(*
macdef
T_ABSPROP_ = T_ABSTYPE(PROPSORT)
macdef
T_ABSVIEW_ = T_ABSTYPE(VIEWSORT)
*)
(*
macdef
T_ABSTBOX_ = T_ABSTYPE(TBOXSORT)
macdef
T_ABSTFLT_ = T_ABSTYPE(TFLATSORT)
macdef
T_ABSTFLAT_ = T_ABSTYPE(TFLATSORT)
*)
//
(*
macdef
T_ABSVTYPE_ = T_ABSTYPE(VTYPESORT)
macdef
T_ABSVTBOX_ = T_ABSTYPE(VTBOXSORT)
macdef
T_ABSVTFLT_ = T_ABSTYPE(VTFLATSORT)
macdef
T_ABSVTFLAT_ = T_ABSTYPE(VTFLATSORT)
*)
//
(* ****** ****** *)
//
macdef
T_DATAPROP_ = T_DATATYPE(PROPSORT)
macdef
T_DATAVIEW_ = T_DATATYPE(VIEWSORT)
//
macdef
T_DATATYPE_ = T_DATATYPE(TYPESORT)
macdef
T_DATAVTYPE_ = T_DATATYPE(VTYPESORT)
//
(* ****** ****** *)
//
macdef
T_WITHPROP_ = T_WITHTYPE(PROPSORT)
macdef
T_WITHVIEW_ = T_WITHTYPE(VIEWSORT)
macdef
T_WITHTYPE_ = T_WITHTYPE(TYPESORT)
macdef
T_WITHVTYPE_ = T_WITHTYPE(VTYPESORT)
//
(* ****** ****** *)

macdef
T_TUPLE2_ = T_TUPLE(2)
macdef
T_TUPLE3_ = T_TUPLE(3)
macdef
T_TUPLE4_ = T_TUPLE(4)

macdef
T_RECORD2_ = T_RECORD(2)
macdef
T_RECORD3_ = T_RECORD(3)
macdef
T_RECORD4_ = T_RECORD(4)

(* ****** ****** *)
//
macdef
T_INFIX_ = T_SRP_FIXITY(INFIX)
macdef
T_INFIXL_ = T_SRP_FIXITY(INFIXL)
macdef
T_INFIXR_ = T_SRP_FIXITY(INFIXR)
//
macdef
T_PREFIX_ = T_SRP_FIXITY(PREFIX)
macdef
T_POSTFIX_ = T_SRP_FIXITY(POSTFIX)
//
(* ****** ****** *)

val () =
kword_initize
  ((*void*)) where
{
//
macdef
myins = tnode_insert
//
fun
kword_initize(): void =
{
//
val () = myins("@", T_AT)
//
val () = myins("=", T_EQ)
val () = myins("<", T_LT)
val () = myins(">", T_GT)
//
val () = myins("|", T_BAR)
val () = myins(":", T_CLN)
val () = myins(".", T_DOT)
//
val () = myins("$", T_DLR)
val () = myins("#", T_SRP)
//
val () = myins("=<", T_EQLT)
val () = myins("=>", T_EQGT)
//
val () = myins("<>", T_LTGT)
val () = myins("><", T_GTLT)
//
val () = myins("-<", T_MSLT)
(*
val () = myins("->", T_MSGT)
val () = myins("-<>", T_MSLTGT)
*)
//
(*
val () = myins(".<", T_DOTLT)
*)
val () = myins(">.", T_GTDOT)
//
(*
val () = myins(":<", T_COLONLT)
*)
//
val () = myins("as", T_AS)
//
val () = myins("of", T_OF)
val () = myins("op", T_OP)
//
val () = myins("in", T_IN)
//
val () = myins("and", T_AND)
//
val () = myins("end", T_END)
//
val () = myins("if", T_IF)
val () = myins("sif", T_SIF)
val () = myins("then", T_THEN)
val () = myins("else", T_ELSE)
//
val () = myins("when", T_WHEN)
val () = myins("with", T_WITH)
//
val () = myins("case", T_CASE_)
val () = myins("scase", T_SCASE)
//
(*
val () = myins("ifcase", T_IFCASE)
*)
//
val () = myins("endif", T_ENDIF)
val () = myins("endsif", T_ENDSIF)
val () = myins("endcase", T_ENDCASE)
//
val () = myins("lam", T_LAM(0))
val () = myins("fix", T_FIX(0))
//
val () = myins("let", T_LET)
val () = myins("where", T_WHERE)
val () = myins("local", T_LOCAL)
//
val () = myins("endlam", T_ENDLAM)
val () = myins("endlet", T_ENDLET)
val () = myins("endwhere", T_ENDWHERE)
val () = myins("endlocal", T_ENDLOCAL)
//
val () = myins("fn", T_FN_)
val () = myins("fn0", T_FN0_)
val () = myins("fnx", T_FNX_)
val () = myins("fn1", T_FN1_)
val () = myins("fun", T_FUN_)
//
val () = myins("prfn", T_PRFN_)
val () = myins("prfn0", T_PRFN0_)
val () = myins("prfn1", T_PRFN1_)
val () = myins("prfun", T_PRFUN_)
val () = myins("praxi", T_PRAXI_)
//
val () = myins("castfn", T_CASTFN_)
//
val () = myins("val", T_VAL_)
val () = myins("prval", T_PRVAL_)
//
val () = myins("var", T_VAR())
//
val () = myins("implmnt", T_IMPLMNT_)
val () = myins("implement", T_IMPLMNT_)
val () = myins("primplmnt", T_PRIMPLMNT_)
val () = myins("primplement", T_PRIMPLMNT_)
//
val () = myins("abssort", T_ABSSORT)
//
val () = myins("sortdef", T_SORTDEF)
//
val () = myins("sexpdef", T_SEXPDEF_)
val () = myins("propdef", T_PROPDEF_)
val () = myins("viewdef", T_VIEWDEF_)
val () = myins("typedef", T_TYPEDEF_)
val () = myins("vtypedef", T_VTYPEDEF_)
//
val () = myins("abstype", T_ABSTYPE_)
//
(*
val () = myins("absprop", T_ABSPROP_)
val () = myins("absview", T_ABSVIEW_)
*)
(*
val () = myins("abstbox", T_ABSTBOX_)
val () = myins("abstflt", T_ABSTFLT_)
val () = myins("abstflat", T_ABSTFLAT_)
*)
(*
val () = myins("absvtype", T_ABSVTYPE_)
val () = myins("absvtbox", T_ABSVTBOX_)
val () = myins("absvtflt", T_ABSVTFLT_)
val () = myins("absvtflat", T_ABSVTFLAT_)
*)
//
val () = myins("absimpl", T_ABSIMPL)
val () = myins("absopen", T_ABSOPEN)
//
val () = myins("datasort", T_DATASORT)
//
val () = myins("dataprop", T_DATAPROP_)
val () = myins("dataview", T_DATAVIEW_)
val () = myins("datatype", T_DATATYPE_)
val () = myins("datavtype", T_DATAVTYPE_)
//
(*
//
val () = myins("macdef")
val () = myins("macrodef")
//
*)
//
(*
//
val () = myins("with")
//
*)
//
val () = myins("withtype", T_WITHTYPE_)
val () = myins("withprop", T_WITHPROP_)
val () = myins("withview", T_WITHVIEW_)
val () = myins("withvtype", T_WITHVTYPE_)
//
val () = myins("$tup"   , T_TUPLE2_)
val () = myins("$tup_t" , T_TUPLE3_)
val () = myins("$tup_vt", T_TUPLE4_)
//
val () = myins("$rec"   , T_RECORD2_)
val () = myins("$rec_t" , T_RECORD3_)
val () = myins("$rec_vt", T_RECORD4_)
//
(*
//
val () = myins("$list")
val () = myins("$list_t")
val () = myins("$list_vt")
//
val () = myins("$raise")
//
val () = myins("$delay")
val () = myins("$delay_t")
val () = myins("$delay_vt")
//
*)
(*
//
val () = myins("#if")
val () = myins("#ifdef")
val () = myins("#ifundef")
//
val () = myins("#define")
//
*)
//
val () = myins("#infix", T_INFIX_)
val () = myins("#infix0", T_INFIX_)
val () = myins("#infixl", T_INFIXL_)
val () = myins("#infixr", T_INFIXR_)
val () = myins("#prefix", T_PREFIX_)
val () = myins("#postfix", T_POSTFIX_)
//
val () = myins("#nonfix", T_SRP_NONFIX)
//
val () = myins("#stacst", T_SRP_STACST)
//
val () = myins("#static", T_SRP_STATIC)
val () = myins("#extern", T_SRP_EXTERN)
//
val () = myins("#define", T_SRP_DEFINE)
val () = myins("#macdef", T_SRP_MACDEF)
//
val () = myins("#include", T_SRP_INCLUDE)
//
val () = myins("#staload", T_SRP_STALOAD)
val () = myins("#dynload", T_SRP_DYNLOAD)
//
val () = myins("#symload", T_SRP_SYMLOAD)
//
} (* end of [kword_initize] *)
//
} (* end of [kword_initize()] *)

(* ****** ****** *)
//
implement T_IDENT_AT = T_IDENT_sym("@")
implement T_IDENT_EQ = T_IDENT_sym("=")
//
implement T_IDENT_LT = T_IDENT_sym("<")
implement T_IDENT_GT = T_IDENT_sym(">")
//
implement T_IDENT_EQGT = T_IDENT_sym("=>")
implement T_IDENT_LTGT = T_IDENT_sym("<>")
implement T_IDENT_MSGT = T_IDENT_sym("->")
//
(* ****** ****** *)

(* end of [xats_lexing_kword.dats] *)
