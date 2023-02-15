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
  | e = expr; EOF { Some e }
  ;

expr:
  | s = INT { Expr.Int s }
  | e1 = expr; PLUS; e2 = expr { Expr.Plus(e1, e2) }
  | e1 = expr; MINUS; e2 = expr { Expr.Minus(e1, e2) }
  | LPAREN; e = expr; RPAREN { e }
  ;