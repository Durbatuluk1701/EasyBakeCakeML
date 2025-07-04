(************************************************************************)
(*         *   The Coq Proof Assistant / The Coq Development Team       *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (see version control and CREDITS file for authors & dates) *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

From Stdlib Require Import Bool List.
From EasyBakeCakeML Require Export EasyBakeCakeML.

(** Extraction to CakeML : use the basic CakeML types *)

Extract Inductive bool => bool [ "True" "False" ].
Extract Inductive option => option [ Some None ].
Extract Inductive unit => unit [ "()" ].
Extract Inductive list => list [ "[]" "( :: )" ].
Extract Inlined Constant List.length => "List.length".
Extract Inlined Constant List.app => "List.@".

(** Extracting nat to int is not always nicer, but it helps
    when realizing stuff like [lt_eq_lt_dec] *)
Extract Inductive prod => "( * )" [ "" ].

(** NB: The "" above is a hack, but produce nicer code than "(,)" *)

(** Mapping sumbool to bool and sumor to option is not always nicer,
    but it helps when realizing stuff like [lt_eq_lt_dec] *)

Extract Inductive sumbool => bool [ "True" "False" ].
Extract Inductive sumor => option [ Some None ].

(** Restore laziness of andb, orb.
    NB: without these Extract Constant, andb/orb would be inlined
    by extraction in order to have laziness, producing inelegant
    (if ... then ... else false) and (if ... then true else ...).
*)

Extract Inlined Constant andb => "(fn x => fn y => x andalso y)".
Extract Inlined Constant orb => "(fn x => fn y => x orelse y)".