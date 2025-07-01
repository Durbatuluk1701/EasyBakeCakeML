From EasyBakeCakeML Require Export EasyBakeCakeML ExtrCakeMLNativeString.
From Stdlib Require Import String Ascii.

(* This file defines the CakeML standard TextIO library as shims, then fills in their implementations *)

(* NOTE: This is not complete, but we just provide the most basic of shims and assume that the end-user will re-create higher level functionality on the Rocq side if they so desire *)
Module TextIO.
  Definition instream : Type. Admitted.
  Definition outstream : Type. Admitted.
  Extract Inlined Constant instream => "TextIO.instream".
  Extract Inlined Constant outstream => "TextIO.outstream".

  Definition print (s : string) : unit. Admitted.
  Extract Inlined Constant print => "TextIO.print".

  Definition print_err (s : string) : unit. Admitted.
  Extract Inlined Constant print_err => "TextIO.print_err".

  Definition openIn (s : string) : instream. Admitted.
  Extract Inlined Constant openIn => "TextIO.openIn".

  Definition openOut (s : string) : outstream. Admitted.
  Extract Inlined Constant openOut => "TextIO.openOut".

  Definition closeIn (s : instream) : unit. Admitted.
  Extract Inlined Constant closeIn => "TextIO.closeIn".

  Definition closeOut (s : outstream) : unit. Admitted.
  Extract Inlined Constant closeOut => "TextIO.closeOut".

  Definition inputLine (s : instream) : string. Admitted.
  Extract Inlined Constant inputLine => "TextIO.inputLine".

  Definition inputLines (s : instream) : list string. Admitted.
  Extract Inlined Constant inputLines => "TextIO.inputLines".

  Definition inputAll (s : instream) : string. Admitted.
  Extract Inlined Constant inputAll => "TextIO.inputAll".

  Definition output (s : outstream) (str : string) : unit. Admitted.
  Extract Inlined Constant output => "TextIO.output".

  (* ------------------------------------ *)
  (* Defining higher-level functions *)
  (* ------------------------------------ *)
  Definition readFile (fname : string) : string := 
    let s := openIn fname in
    let content := inputAll s in
    let s' := closeIn s in
    content.
  Global Opaque readFile.

  Definition writeFile (fname : string) (content : string) : unit :=
    let s := openOut fname in
    let s' := output s content in
    closeOut s.
  Global Opaque writeFile.

  Local Open Scope char_scope.
  Definition newline : string := (String "010" EmptyString).
  Local Close Scope char_scope.

  Definition printLn (s : string) : unit := print (String.append s newline).
  Global Opaque printLn.

  Definition printLn_err (s : string) : unit := print_err (String.append s newline).
  Global Opaque printLn_err.

End TextIO.
