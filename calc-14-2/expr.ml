type expr = Int of int
           | Plus of expr * expr
           | Mult of expr * expr

let rec eval (e : expr) : int =
  match e with
  | Int c -> c
  | Plus(e1, e2) -> (eval e1) + (eval e2)
  | Mult(e1, e2) -> (eval e1) * (eval e2)