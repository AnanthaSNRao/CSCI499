%token ASSGN
%token RPAREN
%token PLUS
%token MINUS
%token LPAREN
%token LT
%token LEQ 
%token EQ 
%token AND 
%token OR 
%token NOT
%token WHILE
%token IF
%token ELSE 
%token THEN
%token SEQ
%token SKIP
%token OUTPUT
%token DO
%token DONE
%token <int> INT
%token <string> STRING
%token <bool> BOOL

%token EOF

%start <Imp.aexp option> prog
%start <Imp.bexp option> prog1
%start <Imp.cmd option> prog2


%%

prog:
  | EOF { None }
  | e = expr; EOF { Some e }
  ;

expr:
  | s = STRING { Var s }
  | e = expr1 { e }
  ; 

expr1:
  | e1 = expr; PLUS; e2 = expr2 { Plus(e1, e2) }
  | e1 = expr; MINUS; e2 = expr2 { Minus(e1, e2 ) }
  | e = expr2 { e }
  ; 

expr2:
  | s = INT { Int s }
  | LPAREN; e = expr; RPAREN { e }
  ;

prog1:
  | EOF {None}
  | e = expr3; EOF { Some e }
  ;
expr3:
  | b = BOOL { Bool b } 
  | e1 = expr3; AND; e2 = expr3 { And(e1, e2) }
  | e1 = expr3; OR; e2 = expr3 { Or(e1, e2) }
  | NOT; e1 = expr3 { Not(e1) }
  | e1 = expr; LT; e2 = expr { Lt(e1, e2) }
  | e1 = expr; LEQ; e2 = expr { Leq(e1, e2) }
  | e1 = expr; EQ; e2 = expr { Eq(e1, e2) }
  ;

prog2:
  | EOF { None }
  | e = expr4; EOF { Some e }
  ;

expr4:
  | OUTPUT; e1 = expr { Output(e1) }
  | e1 = STRING; ASSGN; e2 = expr1 { Asgn(e1, e2) }
  | SKIP { Skip }
  | e1 = expr4; SEQ; e2 = expr4 { Seq(e1,e2) }
  | IF; LPAREN; e1 = expr3; LPAREN; THEN; e2 = expr4; ELSE; e3 = expr4 { IfElse(e1, e2, e3) } 
  | WHILE; LPAREN; e1 = expr3; RPAREN; DO; e2 = expr4; DONE {While(e1, e2)}
  ;