#!/usr/bin/env bash

set -e

ocamlc -i expr.ml > expr.mli
ocamlc expr.mli
ocamlc expr.ml

menhir --infer myparser.mly
ocamlc myparser.mli
ocamlc myparser.ml

ocamllex mylexer.mll
ocamlc mylexer.ml

ocamlc expr.cmo myparser.cmo mylexer.cmo main.ml

# $ utop
# > #load "myparser.cmo";;
# > #load "mylexer.cmo";;
# > let str = "32   - (432\t+93  )";;
# > let lexbuf = Lexing.from_string str;;
# > read lexbuf;;
# > let lexFullStr str =
#     let rec lexFullBuf lexbuf =
#       let t1 = read lexbuf in
#       let ts = if (lexbuf.lex_curr_pos < lexbuf.lex_buffer_len)
#                then lexFullBuf lexbuf
#                else [] in
#       t1 :: ts in
#     lexFullBuf (Lexing.from_string str);;
# > lexFullStr str;;
