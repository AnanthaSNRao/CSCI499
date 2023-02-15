type expr = Int of int | Plus of expr * expr | Minus of expr * expr
val eval : expr -> int
