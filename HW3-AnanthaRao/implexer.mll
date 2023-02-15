{
  open Lexing
  open Impparser

  exception SyntaxError of string

  let next_line lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_bol = lexbuf.lex_curr_pos;
                 pos_lnum = pos.pos_lnum + 1 }
}

let int = '-'? ['0'-'9']+
let string = ['a' - 'z']+
let bool = "true" | "false"

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read =
  parse
  | white   { read lexbuf }
  | newline { next_line lexbuf; read lexbuf }
  | int     { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | bool    { BOOL (bool_of_string (Lexing.lexeme lexbuf))}
  | '+'     { PLUS }
  | '-'     { MINUS }
  | '('     { LPAREN }
  | ')'     { RPAREN }
  | '<'     { LT }
  | "<="    { LEQ }
  | '='     { ASSGN }
  | '&'     { AND }
  | '|'     { OR }
  | '!'     { NOT }
  | "while" { WHILE }
  | "output" { OUTPUT }
  | "if"    { IF }
  | "else"  { ELSE }
  | "then"  { THEN }
  | ";"     { SEQ }
  | "do"    { DO }
  | "done"  { DONE }
  | string  { STRING (Lexing.lexeme lexbuf) }
  | _       { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
  | eof     { EOF }