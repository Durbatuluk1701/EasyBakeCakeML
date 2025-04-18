From Coq Require extraction.Extraction.
From EasyBakeCakeML Require Export EasyBakeCakeML.

Extract Inductive nat => "int" 
[ 
  "(* If this appears, you're using Nat internals. Please don't *)
  0" 

  "(* If this appears, you're using Nat internals. Please don't *)
  (fn n => n + 1)" 
]
"(* If this appears, you're using Nat internals. Please don't *)
  (fn f0 => fn f1 => fn n =>
    let 
      fun h n =
        if n = 0
        then f0 0
        else f1 (n - 1)
    in 
      h n 
    end)
"
.

Extract Inlined Constant Nat.add => "Int.+".
Extract Inlined Constant Nat.sub => "(fn n => fn m => if n < m then 0 else n - m)".
Extract Inlined Constant Nat.mul => "Int.*" .
Extract Inlined Constant Nat.div => "(fn n => fn m => if m = 0 then 0 else n div m)".
Extract Inlined Constant Nat.modulo => "(fn n => fn m => if m = 0 then 0 else n mod m)".
Extract Inlined Constant Nat.eqb => "(op=)".
Extract Inlined Constant Nat.compare => "(fn n => fn m => 
  if n < m 
  then Lt 
  else if n > m
  then Gt 
  else Eq)".