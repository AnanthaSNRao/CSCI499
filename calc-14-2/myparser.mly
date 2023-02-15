%token PLUS
%token MULT
%token <int> INT
%token EOF

%start <Expr.expr option> prog

%%

prog:
  | EOF { None }
  | e = expr1; EOF { Some e }
  ;

(* expr:
  | s = INT { Expr.Int s }
  | e1 = expr; PLUS; e2 = expr { Expr.Plus(e1, e2) }
  | e1 = expr; MULT; e2 = expr { Expr.Mult(e1, e2) }
  ; *)

expr1:
  | e1 = expr1; PLUS; e2 = expr2 { Expr.Plus(e1, e2) }
  | e = expr2 { e }
  ;

expr2:
  | e1 = expr2; MULT; e2 = expr3 { Expr.Mult(e1, e2) }
  | e = expr3 { e }
  ;

expr3:
  | s = INT { Expr.Int s }
  ;

(* 5 * 8 * 4 *)



(*   32 * 8 + 29 * 6 * 9 + 32
     (32 * 8) + (29 * 6 * 9) + (32)  *)