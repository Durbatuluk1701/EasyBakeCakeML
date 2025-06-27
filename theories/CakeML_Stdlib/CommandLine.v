From EasyBakeCakeML Require Export EasyBakeCakeML ExtrCakeMLNativeString.
From EasyBakeCakeML.CakeML_Stdlib Require Import TextIO.
From Stdlib Require Import String List Bool.
Import ListNotations.

Local Open Scope string_scope.

Module CommandLine.
  Definition name (u : unit) : string. Admitted.
  Extract Inlined Constant name => "CommandLine.name".

  Definition arguments (u : unit) : list string. Admitted.
  Extract Inlined Constant arguments => "CommandLine.arguments".

End CommandLine.
