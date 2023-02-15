type expr = Int of int
           | Plus of expr * expr
           | Minus of expr * expr

let rec eval (e : expr) : int =
  match e with
  | Int c -> c
  | Plus(e1, e2) -> (eval e1) + (eval e2)
  | Minus(e1, e2) -> (eval e1) - (eval e2)