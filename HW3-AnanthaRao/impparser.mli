
(* The type of tokens. *)

type token = 
  | WHILE
  | THEN
  | STRING of (string)
  | SKIP
  | SEQ
  | RPAREN
  | PLUS
  | OUTPUT
  | OR
  | NOT
  | MINUS
  | LT
  | LPAREN
  | LEQ
  | INT of (int)
  | IF
  | EQ
  | EOF
  | ELSE
  | DONE
  | DO
  | BOOL of (bool)
  | ASSGN
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog2: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Imp.cmd option)

val prog1: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Imp.bexp option)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Imp.aexp option)
