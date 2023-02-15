
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | THEN
    | STRING of (
# 22 "impparser.mly"
       (string)
# 17 "impparser.ml"
  )
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
    | INT of (
# 21 "impparser.mly"
       (int)
# 33 "impparser.ml"
  )
    | IF
    | EQ
    | EOF
    | ELSE
    | DONE
    | DO
    | BOOL of (
# 23 "impparser.mly"
       (bool)
# 44 "impparser.ml"
  )
    | ASSGN
    | AND
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState02 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 02.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState08 : (('s, 'r) _menhir_cell1_expr, 'r) _menhir_state
    (** State 08.
        Stack shape : expr.
        Start symbol: <undetermined>. *)

  | MenhirState10 : (('s, 'r) _menhir_cell1_expr, 'r) _menhir_state
    (** State 10.
        Stack shape : expr.
        Start symbol: <undetermined>. *)

  | MenhirState16 : ('s, _menhir_box_prog1) _menhir_state
    (** State 16.
        Stack shape : .
        Start symbol: prog1. *)

  | MenhirState17 : (('s, 'r) _menhir_cell1_NOT, 'r) _menhir_state
    (** State 17.
        Stack shape : NOT.
        Start symbol: <undetermined>. *)

  | MenhirState20 : (('s, 'r) _menhir_cell1_expr3, 'r) _menhir_state
    (** State 20.
        Stack shape : expr3.
        Start symbol: <undetermined>. *)

  | MenhirState22 : (('s, 'r) _menhir_cell1_expr3, 'r) _menhir_state
    (** State 22.
        Stack shape : expr3.
        Start symbol: <undetermined>. *)

  | MenhirState25 : (('s, 'r) _menhir_cell1_expr, 'r) _menhir_state
    (** State 25.
        Stack shape : expr.
        Start symbol: <undetermined>. *)

  | MenhirState27 : (('s, 'r) _menhir_cell1_expr, 'r) _menhir_state
    (** State 27.
        Stack shape : expr.
        Start symbol: <undetermined>. *)

  | MenhirState29 : (('s, 'r) _menhir_cell1_expr, 'r) _menhir_state
    (** State 29.
        Stack shape : expr.
        Start symbol: <undetermined>. *)

  | MenhirState35 : ('s, _menhir_box_prog2) _menhir_state
    (** State 35.
        Stack shape : .
        Start symbol: prog2. *)

  | MenhirState37 : (('s, _menhir_box_prog2) _menhir_cell1_WHILE, _menhir_box_prog2) _menhir_state
    (** State 37.
        Stack shape : WHILE.
        Start symbol: prog2. *)

  | MenhirState40 : ((('s, _menhir_box_prog2) _menhir_cell1_WHILE, _menhir_box_prog2) _menhir_cell1_expr3, _menhir_box_prog2) _menhir_state
    (** State 40.
        Stack shape : WHILE expr3.
        Start symbol: prog2. *)

  | MenhirState42 : (('s, _menhir_box_prog2) _menhir_cell1_STRING, _menhir_box_prog2) _menhir_state
    (** State 42.
        Stack shape : STRING.
        Start symbol: prog2. *)

  | MenhirState46 : (('s, _menhir_box_prog2) _menhir_cell1_OUTPUT, _menhir_box_prog2) _menhir_state
    (** State 46.
        Stack shape : OUTPUT.
        Start symbol: prog2. *)

  | MenhirState49 : (('s, _menhir_box_prog2) _menhir_cell1_IF, _menhir_box_prog2) _menhir_state
    (** State 49.
        Stack shape : IF.
        Start symbol: prog2. *)

  | MenhirState52 : ((('s, _menhir_box_prog2) _menhir_cell1_IF, _menhir_box_prog2) _menhir_cell1_expr3, _menhir_box_prog2) _menhir_state
    (** State 52.
        Stack shape : IF expr3.
        Start symbol: prog2. *)

  | MenhirState54 : (('s, _menhir_box_prog2) _menhir_cell1_expr4, _menhir_box_prog2) _menhir_state
    (** State 54.
        Stack shape : expr4.
        Start symbol: prog2. *)

  | MenhirState56 : (((('s, _menhir_box_prog2) _menhir_cell1_IF, _menhir_box_prog2) _menhir_cell1_expr3, _menhir_box_prog2) _menhir_cell1_expr4, _menhir_box_prog2) _menhir_state
    (** State 56.
        Stack shape : IF expr3 expr4.
        Start symbol: prog2. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Imp.aexp)

and ('s, 'r) _menhir_cell1_expr3 = 
  | MenhirCell1_expr3 of 's * ('s, 'r) _menhir_state * (Imp.bexp)

and ('s, 'r) _menhir_cell1_expr4 = 
  | MenhirCell1_expr4 of 's * ('s, 'r) _menhir_state * (Imp.cmd)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_OUTPUT = 
  | MenhirCell1_OUTPUT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_STRING = 
  | MenhirCell1_STRING of 's * ('s, 'r) _menhir_state * (
# 22 "impparser.mly"
       (string)
# 180 "impparser.ml"
)

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_prog2 = 
  | MenhirBox_prog2 of (Imp.cmd option) [@@unboxed]

and _menhir_box_prog1 = 
  | MenhirBox_prog1 of (Imp.bexp option) [@@unboxed]

and _menhir_box_prog = 
  | MenhirBox_prog of (Imp.aexp option) [@@unboxed]

let _menhir_action_03 =
  fun s ->
    (
# 40 "impparser.mly"
               ( Var s )
# 200 "impparser.ml"
     : (Imp.aexp))

let _menhir_action_04 =
  fun e ->
    (
# 41 "impparser.mly"
              ( e )
# 208 "impparser.ml"
     : (Imp.aexp))

let _menhir_action_05 =
  fun e1 e2 ->
    (
# 45 "impparser.mly"
                                ( Plus(e1, e2) )
# 216 "impparser.ml"
     : (Imp.aexp))

let _menhir_action_06 =
  fun e1 e2 ->
    (
# 46 "impparser.mly"
                                 ( Minus(e1, e2 ) )
# 224 "impparser.ml"
     : (Imp.aexp))

let _menhir_action_07 =
  fun e ->
    (
# 47 "impparser.mly"
              ( e )
# 232 "impparser.ml"
     : (Imp.aexp))

let _menhir_action_08 =
  fun s ->
    (
# 51 "impparser.mly"
            ( Int s )
# 240 "impparser.ml"
     : (Imp.aexp))

let _menhir_action_09 =
  fun e ->
    (
# 52 "impparser.mly"
                             ( e )
# 248 "impparser.ml"
     : (Imp.aexp))

let _menhir_action_10 =
  fun b ->
    (
# 60 "impparser.mly"
             ( Bool b )
# 256 "impparser.ml"
     : (Imp.bexp))

let _menhir_action_11 =
  fun e1 e2 ->
    (
# 61 "impparser.mly"
                                ( And(e1, e2) )
# 264 "impparser.ml"
     : (Imp.bexp))

let _menhir_action_12 =
  fun e1 e2 ->
    (
# 62 "impparser.mly"
                               ( Or(e1, e2) )
# 272 "impparser.ml"
     : (Imp.bexp))

let _menhir_action_13 =
  fun e1 ->
    (
# 63 "impparser.mly"
                    ( Not(e1) )
# 280 "impparser.ml"
     : (Imp.bexp))

let _menhir_action_14 =
  fun e1 e2 ->
    (
# 64 "impparser.mly"
                             ( Lt(e1, e2) )
# 288 "impparser.ml"
     : (Imp.bexp))

let _menhir_action_15 =
  fun e1 e2 ->
    (
# 65 "impparser.mly"
                              ( Leq(e1, e2) )
# 296 "impparser.ml"
     : (Imp.bexp))

let _menhir_action_16 =
  fun e1 e2 ->
    (
# 66 "impparser.mly"
                             ( Eq(e1, e2) )
# 304 "impparser.ml"
     : (Imp.bexp))

let _menhir_action_17 =
  fun e1 ->
    (
# 75 "impparser.mly"
                      ( Output(e1) )
# 312 "impparser.ml"
     : (Imp.cmd))

let _menhir_action_18 =
  fun e1 e2 ->
    (
# 76 "impparser.mly"
                                   ( Asgn(e1, e2) )
# 320 "impparser.ml"
     : (Imp.cmd))

let _menhir_action_19 =
  fun () ->
    (
# 77 "impparser.mly"
         ( Skip )
# 328 "impparser.ml"
     : (Imp.cmd))

let _menhir_action_20 =
  fun e1 e2 ->
    (
# 78 "impparser.mly"
                                ( Seq(e1,e2) )
# 336 "impparser.ml"
     : (Imp.cmd))

let _menhir_action_21 =
  fun e1 e2 e3 ->
    (
# 79 "impparser.mly"
                                                                       ( IfElse(e1, e2, e3) )
# 344 "impparser.ml"
     : (Imp.cmd))

let _menhir_action_22 =
  fun e1 e2 ->
    (
# 80 "impparser.mly"
                                                            (While(e1, e2))
# 352 "impparser.ml"
     : (Imp.cmd))

let _menhir_action_23 =
  fun () ->
    (
# 35 "impparser.mly"
        ( None )
# 360 "impparser.ml"
     : (Imp.aexp option))

let _menhir_action_24 =
  fun e ->
    (
# 36 "impparser.mly"
                  ( Some e )
# 368 "impparser.ml"
     : (Imp.aexp option))

let _menhir_action_25 =
  fun () ->
    (
# 56 "impparser.mly"
        (None)
# 376 "impparser.ml"
     : (Imp.bexp option))

let _menhir_action_26 =
  fun e ->
    (
# 57 "impparser.mly"
                   ( Some e )
# 384 "impparser.ml"
     : (Imp.bexp option))

let _menhir_action_27 =
  fun () ->
    (
# 70 "impparser.mly"
        ( None )
# 392 "impparser.ml"
     : (Imp.cmd option))

let _menhir_action_28 =
  fun e ->
    (
# 71 "impparser.mly"
                   ( Some e )
# 400 "impparser.ml"
     : (Imp.cmd option))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | ASSGN ->
        "ASSGN"
    | BOOL _ ->
        "BOOL"
    | DO ->
        "DO"
    | DONE ->
        "DONE"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | IF ->
        "IF"
    | INT _ ->
        "INT"
    | LEQ ->
        "LEQ"
    | LPAREN ->
        "LPAREN"
    | LT ->
        "LT"
    | MINUS ->
        "MINUS"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | OUTPUT ->
        "OUTPUT"
    | PLUS ->
        "PLUS"
    | RPAREN ->
        "RPAREN"
    | SEQ ->
        "SEQ"
    | SKIP ->
        "SKIP"
    | STRING _ ->
        "STRING"
    | THEN ->
        "THEN"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let e = _v in
          let _v = _menhir_action_24 e in
          MenhirBox_prog _v
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_03 s in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_04_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_09 e in
          _menhir_goto_expr2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr2 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState10 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState08 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState37 ->
          _menhir_run_04_spec_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState49 ->
          _menhir_run_04_spec_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState46 ->
          _menhir_run_04_spec_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState42 ->
          _menhir_run_04_spec_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState16 ->
          _menhir_run_04_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_04_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState20 ->
          _menhir_run_04_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState29 ->
          _menhir_run_04_spec_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState27 ->
          _menhir_run_04_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState25 ->
          _menhir_run_04_spec_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_04_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_04_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState02 ->
          _menhir_run_04_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_11 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_06 e1 e2 in
      _menhir_goto_expr1 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr1 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState42 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState37 ->
          _menhir_run_05_spec_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState49 ->
          _menhir_run_05_spec_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState46 ->
          _menhir_run_05_spec_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState16 ->
          _menhir_run_05_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_05_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState20 ->
          _menhir_run_05_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState29 ->
          _menhir_run_05_spec_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState27 ->
          _menhir_run_05_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState25 ->
          _menhir_run_05_spec_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_05_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_05_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState02 ->
          _menhir_run_05_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_43 : type  ttv_stack. ((ttv_stack, _menhir_box_prog2) _menhir_cell1_STRING as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS | PLUS ->
          let e = _v in
          let _v = _menhir_action_04 e in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | DONE | ELSE | EOF | SEQ ->
          let MenhirCell1_STRING (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_18 e1 e2 in
          _menhir_goto_expr4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState42 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState29 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState37 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState49 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_prog2) _menhir_cell1_OUTPUT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DONE | ELSE | EOF | SEQ ->
          let MenhirCell1_OUTPUT (_menhir_stack, _menhir_s) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_17 e1 in
          _menhir_goto_expr4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr4 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState35 ->
          _menhir_run_62 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState40 ->
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState56 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState54 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState52 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_62 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEQ ->
          let _menhir_stack = MenhirCell1_expr4 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let e = _v in
          let _v = _menhir_action_28 e in
          MenhirBox_prog2 _v
      | _ ->
          _eRR ()
  
  and _menhir_run_54 : type  ttv_stack. (ttv_stack, _menhir_box_prog2) _menhir_cell1_expr4 -> _ -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
      | STRING _v ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54
      | SKIP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_19 () in
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
      | OUTPUT ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
      | IF ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog2) _menhir_state -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v in
              let _v = _menhir_action_03 s in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
          | NOT ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | LPAREN ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | INT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v in
              let _v = _menhir_action_08 s in
              _menhir_run_04_spec_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | BOOL _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let b = _v in
              let _v = _menhir_action_10 b in
              _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_0 in
              let _v = _menhir_action_03 s in
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
          | LPAREN ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
          | INT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_2 in
              let _v = _menhir_action_08 s in
              _menhir_run_04_spec_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | LEQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_4 in
              let _v = _menhir_action_03 s in
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
          | LPAREN ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | INT _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_6 in
              let _v = _menhir_action_08 s in
              _menhir_run_04_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | EQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_8 in
              let _v = _menhir_action_03 s in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState29 _tok
          | LPAREN ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | INT _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_10 in
              let _v = _menhir_action_08 s in
              _menhir_run_04_spec_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | EOF | LPAREN | OR | RPAREN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_14 e1 e2 in
          _menhir_goto_expr3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr3 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState49 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState37 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_50 : type  ttv_stack. ((ttv_stack, _menhir_box_prog2) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OR ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | THEN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | WHILE ->
                  _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
              | STRING _v_0 ->
                  _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState52
              | SKIP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_19 () in
                  _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState52 _tok
              | OUTPUT ->
                  _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
              | IF ->
                  _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr3 -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_03 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | NOT ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_04_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_10 b in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_03 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | NOT ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_04_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_10 b in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04_spec_17 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_05_spec_17 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
  
  and _menhir_run_19 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_NOT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | LPAREN | RPAREN ->
          let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_13 e1 in
          _menhir_goto_expr3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr3 -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_03 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | NOT ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_04_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_10 b in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04_spec_22 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr3 -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_05_spec_22 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr3 -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
  
  and _menhir_run_23 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_expr3 as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | LPAREN | RPAREN ->
          let MenhirCell1_expr3 (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_11 e1 e2 in
          _menhir_goto_expr3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04_spec_20 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr3 -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_05_spec_20 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr3 -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
  
  and _menhir_run_21 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_expr3 as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | LPAREN | RPAREN ->
          let MenhirCell1_expr3 (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_12 e1 e2 in
          _menhir_goto_expr3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_41 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog2) _menhir_state -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_STRING (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_0 in
              let _v = _menhir_action_03 s in
              _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
          | LPAREN ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | INT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_2 in
              let _v = _menhir_action_08 s in
              _menhir_run_04_spec_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. ((ttv_stack, _menhir_box_prog2) _menhir_cell1_STRING as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_04_spec_42 : type  ttv_stack. (ttv_stack, _menhir_box_prog2) _menhir_cell1_STRING -> _ -> _ -> _ -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
  
  and _menhir_run_53 : type  ttv_stack. (((ttv_stack, _menhir_box_prog2) _menhir_cell1_IF, _menhir_box_prog2) _menhir_cell1_expr3 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr4 (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEQ ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | STRING _v_0 ->
              _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState56
          | SKIP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_19 () in
              _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState56 _tok
          | OUTPUT ->
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | IF ->
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_57 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog2) _menhir_cell1_IF, _menhir_box_prog2) _menhir_cell1_expr3, _menhir_box_prog2) _menhir_cell1_expr4 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEQ ->
          let _menhir_stack = MenhirCell1_expr4 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DONE | ELSE | EOF ->
          let MenhirCell1_expr4 (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_expr3 (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_21 e1 e2 e3 in
          _menhir_goto_expr4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog2) _menhir_state -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_OUTPUT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_03 s in
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_04_spec_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04_spec_46 : type  ttv_stack. (ttv_stack, _menhir_box_prog2) _menhir_cell1_OUTPUT -> _ -> _ -> _ -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_05_spec_46 : type  ttv_stack. (ttv_stack, _menhir_box_prog2) _menhir_cell1_OUTPUT -> _ -> _ -> _ -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
  
  and _menhir_run_48 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog2) _menhir_state -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v in
              let _v = _menhir_action_03 s in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | NOT ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | LPAREN ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | INT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v in
              let _v = _menhir_action_08 s in
              _menhir_run_04_spec_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | BOOL _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let b = _v in
              let _v = _menhir_action_10 b in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_04_spec_49 : type  ttv_stack. (ttv_stack, _menhir_box_prog2) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_05_spec_49 : type  ttv_stack. (ttv_stack, _menhir_box_prog2) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
  
  and _menhir_run_38 : type  ttv_stack. ((ttv_stack, _menhir_box_prog2) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | DO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | WHILE ->
                  _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
              | STRING _v_0 ->
                  _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState40
              | SKIP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_19 () in
                  _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
              | OUTPUT ->
                  _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
              | IF ->
                  _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | OR ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_58 : type  ttv_stack. (((ttv_stack, _menhir_box_prog2) _menhir_cell1_WHILE, _menhir_box_prog2) _menhir_cell1_expr3 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEQ ->
          let _menhir_stack = MenhirCell1_expr4 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DONE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_expr3 (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_22 e1 e2 in
          _menhir_goto_expr4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog1) _menhir_state -> _ -> _menhir_box_prog1 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let e = _v in
          let _v = _menhir_action_26 e in
          MenhirBox_prog1 _v
      | AND ->
          let _menhir_stack = MenhirCell1_expr3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_04_spec_25 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_05_spec_25 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
  
  and _menhir_run_28 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | EOF | LPAREN | OR | RPAREN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_15 e1 e2 in
          _menhir_goto_expr3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04_spec_27 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_05_spec_27 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
  
  and _menhir_run_30 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | EOF | LPAREN | OR | RPAREN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_16 e1 e2 in
          _menhir_goto_expr3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04_spec_29 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_05_spec_29 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState29 _tok
  
  and _menhir_run_04_spec_37 : type  ttv_stack. (ttv_stack, _menhir_box_prog2) _menhir_cell1_WHILE -> _ -> _ -> _ -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_05_spec_37 : type  ttv_stack. (ttv_stack, _menhir_box_prog2) _menhir_cell1_WHILE -> _ -> _ -> _ -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
  
  and _menhir_run_55 : type  ttv_stack. ((ttv_stack, _menhir_box_prog2) _menhir_cell1_expr4 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog2) _menhir_state -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEQ ->
          let _menhir_stack = MenhirCell1_expr4 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DONE | ELSE | EOF ->
          let MenhirCell1_expr4 (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_20 e1 e2 in
          _menhir_goto_expr4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_05_spec_16 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_prog1 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
  
  and _menhir_run_05_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_05_spec_02 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
  
  and _menhir_run_09 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_05 e1 e2 in
      _menhir_goto_expr1 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_04_spec_16 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_prog1 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_04_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_04_spec_02 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_run_05_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_03 s in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_04_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF ->
          let _v = _menhir_action_23 () in
          MenhirBox_prog _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog1 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_03 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | NOT ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_04_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF ->
          let _v = _menhir_action_25 () in
          MenhirBox_prog1 _v
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_10 b in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_35 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog2 =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
      | STRING _v ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState35
      | SKIP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_19 () in
          _menhir_run_62 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState35 _tok
      | OUTPUT ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
      | IF ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
      | EOF ->
          let _v = _menhir_action_27 () in
          MenhirBox_prog2 _v
      | _ ->
          _eRR ()
  
end

let prog2 =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog2 v = _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let prog1 =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog1 v = _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
