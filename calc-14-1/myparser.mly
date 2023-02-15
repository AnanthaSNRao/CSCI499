%token RPAREN
%token PLUS
%token MINUS
%token LPAREN
%token <int> INT
%token EOF

%start <Expr.expr option> prog

%%

prog:
  | EOF { None }
  | e = expr1; EOF { Some e }
  ;

expr1:
  | e1 = expr1; PLUS; e2 = expr2 { Expr.Plus(e1, e2) }
  | e1 = expr1; MINUS; e2 = expr2 { Expr.Minus(e1, e2) }
  | e = expr2 { e }
  ;

expr2:
  | s = INT { Expr.Int s }
  | LPAREN; e = expr1; RPAREN { e }
  ;