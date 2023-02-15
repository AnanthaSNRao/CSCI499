(*******************************************************************************
Homework 3
==========
CSCI 499, Fall 2022: An Introduction to Functional Programming
Mukund Raghothaman
Due: 10pm PT on 11 November, 2022
*******************************************************************************)

(*******************************************************************************
- Your name: Anantha Sree Skanda Seegvalu Narayana Rao
- Your partner's name (if any): Jaylen Jackson
*******************************************************************************)

(*******************************************************************************
Instructions
------------
1. Please setup your programming environment by following the steps outlined in
   the cheatsheet and on the course website.

2. Please feel free to collaborate with a partner, but make sure to write your
   submission independently.

3. This assignment consists of five files: main.ml (this file), imp.ml
   (describing the abstract syntax of the Imp language), cipher.ods (which you
   can open either using Microsoft Excel or Libreoffice Calc), and two build
   scripts: build.sh and clean.sh.

4. Please execute build.sh to be able to load this file into the toplevel:

     $ ./build.sh

5. IMPORTANT: Make sure that I can cleanly import this file into the Ocaml
   toplevel when I call #use "main.ml". Comment out any questions you were
   unable to solve / have left unanswered.

6. As part of your submission, you will create two additional files,
   implexer.mll and impparser.mly. Place all seven files in a directory with
   your name, zip the directory, and submit the resulting archive using
   Blackboard.
*******************************************************************************)

#load "imp.cmo";;

(* Uncomment the following lines once you have finished creating implexer.mll
   and impparser.mly and build.sh does not produce any errors: *)

#load "impparser.cmo";;
#load "implexer.cmo";;

open Imp

exception NotImplemented

(** Distribution of points: 10 + 20 + 15 + 15 + 15 + 15 = 90 points *)

(******************************************************************************)
(* Question 1: Interpreting an Imperative Language, Part 1 (3 + 3 + 4 points)

   In this question and the next, we will build an end-to-end interpreter for a
   toy imperative language, sometimes called Imp. Here is an example program in
   Imp:

     x = 5;
     while (0 < x) do
       output x;
       x = x - 1
     done

   Executing this program results in the list of integers [5; 4; 3; 2; 1].

   In this question, we will write the core of the interpreter, which starts
   from the AST of the program and does the actual evaluation. In the next
   question, we will write the parser which takes a string representation of the
   program and produces the AST. Chaining the two together will give us the
   end-to-end interpreter.

   Constructs in Imp belong to one of three syntactic categories, arithmetic
   expressions, Boolean expressions and commands, and we will represent these
   using the types Imp.aexp, Imp.bexp and Imp.cmd respectively. See their
   definitions in the supplementary file imp.ml.

   Recall your solution to Question 7b from Homework 1. To evaluate an
   arithmetic expression, such as "x + 5", it is necessary to know the value of
   the variable "x". We will record the current value of each variable in a map
   which associates their names with their values. This map, which we will call
   the "evaluation environment", will be of type: *)

type env_t = (string, int) Pmap.t

(* The empty environment is given by Pmap.empty, and variables may be set and
   queried using the Pmap.add and Pmap.find functions respectively. To simplify
   matters, all variables which are not explicitly defined in the environment
   have the initial value 0.

   Fill in the functions aeval, beval, and ceval. We have included some
   assertions in comments which you may use to test your solutions. *)
let value p = match p with
  | Some c -> c
  | None -> 0

let rec aeval (env : env_t) (a : aexp) : int =
  match a with
  | Var c -> (Pmap.find c env) |> value 
  | Int c -> c
  | Plus(a, b) -> aeval env a + (aeval env b)
  | Minus(a, b) -> aeval env a - ( aeval env b)

let _ =
  let env0 = Pmap.empty in
  let env1 = Pmap.add "x" 5 env0 in

  let a1 = Int 3 in
  let a2 = Var "x" in
  let a3 = Plus(a1, a1) in
  let a4 = Minus(a2, a1) in

  let _ = assert ((aeval env0 a1) = 3) in
  let _ = assert ((aeval env0 a2) = 0) in
  let _ = assert ((aeval env1 a2) = 5) in
  let _ = assert ((aeval env0 a3) = 6) in
  let _ = assert ((aeval env1 a4) = 2) in
  ()

let rec beval (env : env_t) (b : bexp) : bool =
  match b with
  | Bool bl -> bl
  | Lt(a, b) -> aeval env a < (aeval env b)
  | Leq(a,b) -> aeval env a <= (aeval env b)
  | Eq(a,b) -> aeval env a = (aeval env b)
  | And(a,b) -> beval env a && (beval env b)
  | Or(a,b) -> beval env a || (beval env b)
  | Not a -> not (beval env a)

let _ =
  let env0 = Pmap.empty in
  let env1 = Pmap.add "x" 3 env0 in
  let env2 = Pmap.add "y" 5 env1 in

  let ax = Var "x" in
  let ay = Var "y" in

  let b1 = Bool false in
  let b2 = Lt(ax, ay) in
  let b3 = Leq(ax, Plus(ax, ay)) in
  let b4 = Eq(Plus(ax, ay), Plus(ay, ax)) in
  let b5 = And(b2, b3) in
  let b6 = Or(b1, b3) in
  let b7 = Not(b1) in

  let _ = assert (not (beval env2 b1)) in
  let _ = assert (beval env2 b2) in
  let _ = assert (beval env2 b3) in
  let _ = assert (beval env2 b4) in
  let _ = assert (beval env2 b5) in
  let _ = assert (beval env2 b6) in
  let _ = assert (beval env2 b7) in
  ()

let ceval (c : cmd) : int list = 
  
  let cenv = Pmap.empty in 
  let getenv map = 
    let env1 = Pmap.empty in
    let new_map_list map = List.filter (fun x -> List.length (snd x) == 1) (Pmap.to_alist map) in
    let rec lis_map lis env = match lis with
    | hd::tl -> lis_map tl (Pmap.add (fst hd) (List.hd (snd hd)) env)
    | [] -> env in
    lis_map (new_map_list map) env1 in

  let value m = match m with
    | Some v -> v
    | None -> [] in

  let filter map =
     List.rev (value (Pmap.find "Output" map)) in

  let rec cv c  cenv= 
    match c with
  | Asgn(a,b) -> Pmap.add a ([aeval (getenv cenv) b]) cenv
  | Seq(c1, c2) ->  cv c2 (cv c1 cenv)
  | Output(a) -> Pmap.add "Output" ((aeval (getenv cenv) a)::value(Pmap.find "Output" cenv)) cenv
  | Skip -> Pmap.add "" [0] cenv
  | IfElse(a,b,c1) -> if (beval (getenv cenv) a) then (cv b cenv) else (cv c1 cenv)
  | While(a,b) -> if (beval (getenv cenv) a) then cv (While(a,b)) (cv b cenv) else (Pmap.add "" [0] cenv) in 
  filter (cv c cenv)


let _ =
  let ax = Var "x" in
  let ay = Var "y" in
  let a0 = Int 0 in
  let a1 = Int 1 in
  let a5 = Int 5 in
  let c = Seq(Asgn("x", a5),
              While(Lt(a0, ax),
                    Seq(Output(ax),
                    Seq(Asgn("x", Minus(ax, a1)),
                    Seq(Output(ay), Asgn("y", Plus(ay, a1))))))) in
  assert (ceval c = [5; 0; 4; 1; 3; 2; 2; 3; 1; 4])

(******************************************************************************)
(* Question 2: Interpreting an Imperative Language, Part 2 (10 + 10 points)

   We will now write the front-end of the interpreter. Construct a lexical
   analyzer using Ocamllex in a file named "implexer.mll", and construct a
   parser using Menhir in a file named "impparser.mly".

   Here is the grammar describing the syntax of Imp:

     Commands,
     cmd ::= output aexp
           | var-name "=" aexp
           | "skip"
           | cmd ";" cmd (* Execute the first command, followed by the second
                            command *)
           | "if" bexp "then" cmd "else" cmd "fi"
           | "while" bexp "do" cmd "done"
           | "(" cmd ")"

     Arithmetic expressions,
     aexp ::= integer-literal (* Any non-empty sequence of digits from '0' to
                                 '9', possibly prefixed with a '-' *)
            | variable-name   (* Variable names begin with an alphabet or an
                                 underscore character, and are followed by zero
                                 or more alphabets, digits, or underscore
                                 characters. *)
            | aexp "+" aexp   (* Both "+" and "-" are left-associative, so that
                                 "a - b + c" is parsed as "(a - b) + c". *)
            | aexp "-" aexp
            | "(" aexp ")"

     Boolean expressions,
     bexp ::= "true"
            | "false"
            | aexp "<" aexp
            | aexp "<=" aexp
            | aexp "==" aexp
            | bexp "&&" bexp
            | bexp "||" bexp
            | "!" bexp
            | "(" bexp ")"

   For full credit:
   1. Make sure that to resolve precedence correctly with the Boolean operators.
      The negation operator, "!" binds the tightest of them all, and the
      disjunction operator "||" is the loosest. In particular, "true || false &&
      true" should be parsed as "true || (false && true)", "true && false ||
      true" should be parsed as "(true && false) || true", and "!false && true"
      should be parsed as "(!false) && true" respectively.
   2. Ensure that both "implexer.mll" nor "impparser.mly" produce no warnings
      when compiled using the respective tools.

   Define the following function parse : string -> int list which takes the
   textual representation of an Imp program as input, and produces its list of
   integers as output. *)
let value_cmd c = match c with
  | Some c -> c 
  | None -> Skip
let parse (str : string) : cmd =
  value_cmd (Impparser.prog2  Implexer.read (Lexing.from_string(str)))

let eval (str : string) : int list = str |> parse |> ceval

(* At this point, I will test your implementation with: *)

(* let _ =
  let cs = "x = 5;
            while (0 < x) do
              output x;
              x = x - 1;
              output y;
              y = y + 1
            done" in
  assert (eval cs = [5; 0; 4; 1; 3; 2; 2; 3; 1; 4]) *)

(* M-NOTE: Your implementation has s/r conflicts and also fails to parse the following program: *)

let cs = "x = 5;
          while (-10 < x) do
            output x;
            x = x - 1 -3;
            output y;
            y = y + 1
          done"

(******************************************************************************)
(* Question 3: Matching Regular Expressions in Linear Time (5 + 5 + 5 points)

   In class, we outlined a single pass linear time regular expression matching
   algorithm. While it is an educational experience to implement this algorithm
   in its full generality, it would be overwhelming for a homework question. We
   will instead implement fast matching algorithms for some selected regular
   expressions.

   For full credit, your program must be tail recursive, run in linear time, and
   make a single left-to-right pass over the input string.

   You may find the following function useful: *)

let string_to_list (str: string) : char list =
  str |> String.to_seq |> List.of_seq

(* - Write a program that determines whether a given string matches the pattern
     "Hi"*: *)

let matchesHiStar (str: string) : bool =
  let lis = string_to_list str in
  let rec matchHi l prev = 
    match  l with
      | [] -> if prev = 'H' then false else true
      | 'H' :: tl -> if prev = ' ' then matchHi tl 'H' else false
      | 'i' :: tl -> if prev = 'H' then (matchHi tl ' ') else false 
      | _::tl -> false in
    matchHi lis ' '

(* - Write a program that determines whether a given string matches the pattern
     ("Hi" | "Hello")*: *)

let rec matchHiOrHello (l: char list) (prev : string) : bool = 
    match  l with
      | [] -> if prev = "i" || prev = "o" then true else false
      | 'H' :: tl -> if prev = "i" || prev = "o" then matchHiOrHello tl "h" else false
      | 'i' :: tl -> if prev = "h" then (matchHiOrHello tl "i") else false
      | 'e' :: tl -> if prev = "h" then (matchHiOrHello tl "e") else false
      | 'l' :: tl -> if prev = "e" then (matchHiOrHello tl "l1") else if prev = "l1" then (matchHiOrHello tl "l2") else false
      | 'o' :: tl -> if prev = "l2" then (matchHiOrHello tl "o") else false
      | _ :: tl -> false

let (* rec? *) matchesHiOrHelloStar (str : string) : bool =
  let lis = string_to_list str in
    matchHiOrHello lis "i"

(* - Write a program that determines whether a given string matches the pattern
     ("Hi" | "Hello")* . "Okay"*: *)

let (* rec? *) matchesHiOrHelloStarThenOkayStar (str : string) : bool =
  let lis = string_to_list str in
  let rec matchOkay l prev = 
    match  l with
      | [] -> if prev = 'y' then true else false
      | 'O' :: tl -> if prev = 'y' then matchOkay tl 'O' else false
      | 'k' :: tl -> if prev = 'O' then (matchOkay tl 'k') else false 
      | 'a' :: tl -> if prev = 'k' then (matchOkay tl 'a') else false 
      | 'y' :: tl -> if prev = 'a' then (matchOkay tl 'y') else false 
      | _::tl -> false in
    let rec findPivot l pre= match  l with
    | [] -> if pre = [] then false else matchHiOrHello pre "i"
    | '.' :: tl  -> matchHiOrHello pre "i" && matchOkay tl 'y'
    | c :: tl -> findPivot tl (pre @ [c]) in
    findPivot lis []

(* M-NOTE: matchesHiOrHelloStarThenOkayStar "HelloHiHelloOkayOkay" = false? *)

(******************************************************************************)
(* Question 4: A Simple Type Checker (15 points)

   We define here the abstract syntax of a simple expression language. Observe
   that we have eliminated the distinction between arithmetic and Boolean
   expressions, and variables may hold values of either type: *)

type expr =
  | Var of string                    (* Variables *)
  | IntLit of int                    (* Integer literals *)
  | Plus of expr * expr              (* Integer addition *)
  | Minus of expr * expr             (* Integer subtraction *)
  | BoolLit of bool                  (* Boolean literals *)
  | And of expr * expr               (* Boolean conjunctions *)
  | Or of expr * expr                (* Boolean disjunctions *)
  | Not of expr                      (* Boolean negations *)
  | Leq of expr * expr               (* Arithmetic inequality *)
  | IfThenElse of expr * expr * expr (* Conditional expressions *)

(* As usual, the eval function evaluates the expression in an environment that
   maps variable names to their corresponding values. The main difference is
   that expressions may evaluate to either integers or to Boolean values, or may
   be undefined, depending on the environment in which they are evaluated. We
   create a uniform way to represent the two types of values, and are careful
   while defining the evaluation function: *)

type value =
  | IntVal of int
  | BoolVal of bool

let rec eval (env : (string, value) Pmap.t) (e : expr) : value option =
  let opt_apply f o1 o2 =
    match (o1, o2) with
    | (Some c1, Some c2) -> f c1 c2
    | _ -> None in

  let zz_opt_apply f o1 o2 =
    let f' c1 c2 =
      match (c1, c2) with
      | (IntVal v1, IntVal v2) -> Some (f v1 v2)
      | _ -> None in
    opt_apply f' o1 o2 in

  let bb_opt_apply f o1 o2 =
    let f' c1 c2 =
      match (c1, c2) with
      | (BoolVal v1, BoolVal v2) -> Some (f v1 v2)
      | _ -> None in
    opt_apply f' o1 o2 in

  let z_inject ov = Option.map (fun v -> IntVal v) ov in
  let b_inject ov = Option.map (fun v -> BoolVal v) ov in

  match e with
  | Var v -> Pmap.find v env
  | IntLit c -> Some (IntVal c)
  | Plus(e1, e2) -> z_inject (zz_opt_apply (+) (eval env e1) (eval env e2))
  | Minus(e1, e2) -> z_inject (zz_opt_apply (-) (eval env e1) (eval env e2))
  | BoolLit c -> Some (BoolVal c)
  | And(e1, e2) -> b_inject (bb_opt_apply (&&) (eval env e1) (eval env e2))
  | Or(e1, e2) -> b_inject (bb_opt_apply (||) (eval env e1) (eval env e2))
  | Not e1 ->
      (match eval env e1 with
       | Some (BoolVal v1) -> Some (BoolVal (not v1))
       | _ -> None)
  | Leq(e1, e2) -> b_inject (zz_opt_apply (<=) (eval env e1) (eval env e2))
  | IfThenElse(e1, e2, e3) ->
      (match eval env e1 with
       | Some (BoolVal v1) -> if v1 then eval env e2 else eval env e3
       | _ -> None)

(* Let's perform some sanity checks: *)

let _ =
  let env0 = Pmap.empty in
  let env1 = Pmap.add "x" (IntVal 5) env0 in
  let env2 = Pmap.add "y" (BoolVal true) env1 in

  let e1 = IntLit 3 in
  let e2 = Var "x" in
  let e3 = Var "y" in
  let e4 = Plus(e2, e2) in
  let e5 = Plus(e2, e3) in
  let e6 = And(e3, e3) in
  let e7 = And(e3, e2) in

  let _ = assert (eval env0 e1 = Some (IntVal 3)) in
  let _ = assert (eval env0 e2 = None) in
  let _ = assert (eval env2 e2 = Some (IntVal 5)) in
  let _ = assert (eval env2 e3 = Some (BoolVal true)) in
  let _ = assert (eval env2 e4 = Some (IntVal 10)) in
  let _ = assert (eval env2 e5 = None) in
  let _ = assert (eval env2 e6 = Some (BoolVal true)) in
  let _ = assert (eval env2 e7 = None) in
  ()

(* Notice that whether an expression results in an output depends on the environment
   being provided. For example, the expression e2 can be successfully evaluated in the
   environment e1, but fails to produce an output in environment e2. *)

let _ =
  let env0 = Pmap.empty in
  let env1 = Pmap.add "x" (IntVal 5) env0 in
  let env2 = Pmap.add "x" (BoolVal true) env1 in

  let e1 = Var "x" in
  let e2 = Plus(e1, e1) in

  let _ = assert (eval env1 e2 = Some (IntVal 10)) in
  let _ = assert (eval env2 e2 = None) in
  ()

(* Two determine whether an expression can be successfully evaluated in an
   environment, we create a simple type system for the language, consisting of
   two types: *)

type expr_type = IntType | BoolType

(* An environment type is a mapping from variable names to their corresponding
   types. One can regard this as a guarantee from the user that each variable is
   of the type being asserted. Alternatively, think of this as the symbol table
   maintained by a compiler. *)

type env_type = (string, expr_type) Pmap.t

(* Write a function get_type which takes an environment type and an expression,
   and determines whether the expression can be successfully evaluated or not.
   In particular, if your function evaluates to (Some IntType), then the
   expression should always evaluate to a result of the form (IntVal _) in
   conforming environments, and if it returns (Some BoolType), then evaluating
   the expression should always result in a value of type (BoolVal _). *)

let get_type (gamma : env_type) (e : expr) : expr_type option = 
  let ev ex= match eval Pmap.empty ex with
    | Some IntVal b -> Some IntType
    | Some BoolVal b -> Some BoolType
    | None-> None in 
  match e with
    | Var v -> Pmap.find v gamma
    | IntLit c -> Some (IntType)
    | BoolLit b -> Some (BoolType)
    | p -> ev p

(* If your solution is correct, then the following assertions will hold for all
   expressions e and environments env: *)

let get_type_test (env : (string, value) Pmap.t) (e : expr) =
  let val_type (v : value) : expr_type =
    match v with
    | IntVal _ -> IntType
    | BoolVal _ -> BoolType in

  let gamma = Pmap.map val_type env in

  match (get_type gamma e, eval env e) with
  | (Some IntType, Some (IntVal _)) -> assert true
  | (Some IntType, _) -> assert false
  | (Some BoolType, Some (BoolVal _)) -> assert true
  | (Some BoolType, _) -> assert false
  | _ -> assert true

(* Disclaimer: The above tests are not exhaustive! Some of you may notice that
   defining:

   let get_type env_type e = None

   will pass the test cases, and also passes the requirements in a technical
   sense. However they do not perform any interesting analysis on the
   expressions in question. *)

(* M-NOTE: Your solution seems to think that e2 is ill-typed in the following
   test: *)

let _ =
  let e1 = Var "x" in
  let e2 = Plus(e1, e1) in
  let gamma = Pmap.empty |> Pmap.add "x" IntType in
  get_type gamma e2

(******************************************************************************)
(* Question 5: Incremental Evaluation in Spreadsheets (8 + 7 = 15 points)

   One important feature of spreadsheet applications is their ability to
   automatically recompute cells when the user changes the data. Engineers have
   to be careful while implementing this feature, since it can make the program
   unresponsive when the spreadsheet is large. Efficiently recomputing the
   results when the input data changes is an important problem in many practical
   applications. One common optimization is to use the dependence relation
   between the cells to only recompute those cells which might have changed.

   In this question, we will study this optimization.

   We start by defining "cells". A cell has an address, which we represent as a
   pair of integers: the indices of the row and column in which it appears. This
   is somewhat different from the traditional alphanumeric addressing (e.g.
   "G5"), but converting from one representation to the other is trivial. *)

type cell_address = int * int

(* For the purposes of this question, we are unconcerned with the formulas
   inside the cells, we only worry about their mutual dependencies. We will
   represent these dependencies as a list of pairs,

     deps : (cell_addrress * cell_address) list

   Each element (c1, c2) of deps indicates that the value of c2 is dependent on
   the value of c1. Recall that for the spreadsheet to be well-formed, these
   dependencies must form a DAG. Write a function to determine whether this is
   the case. *)

let successors n e = 
List.map (fun (_, v) -> v) (List.filter (fun (u, _) -> n = u) e)
  
let dfs graph start l =
    let rec rdfs visited node =
      if not (List.mem node visited) then
        begin
          let s = successors node graph in
          List.fold_left rdfs (node::visited) s
        end
      else visited @ [l]
    in rdfs [] start
 
let rec get_nodes deps nodes f = match deps with
  | n::tl -> if List.mem (f n) nodes then (get_nodes tl nodes f) else get_nodes tl ((f n)::nodes) f
  | [] -> nodes

let is_dag (deps : (cell_address * cell_address) list) : bool =

  let nodes = get_nodes deps [] fst in

  let rec dfs_nodes dps nodes l = match nodes with
  | [] -> true
  | hd :: tl -> List.mem l (dfs dps hd l)  && dfs_nodes dps tl l in 

  not (dfs_nodes deps nodes (-100000,-1000000))

(* M-NOTE: Your solution appears to pass the tests, but the large arbitrary
   constant -100000 looks somewhat fishy, no? How does your solution work? *)

(* If your implementation is correct, then it will pass the following tests:

let _ =
  let c1 = (1, 1) in
  let c2 = (1, 2) in
  let c3 = (2, 1) in
  let c4 = (2, 2) in

  let _ = assert (is_dag [(c1, c2); (c2, c3); (c3, c4) ]) in
  let _ = assert (not (is_dag [(c1, c2); (c2, c3); (c2, c1)])) in
  let _ = assert (not (is_dag [(c1, c1)])) in
  () *)

(* Now write a function that accepts the list of dependencies that describes a
   spreadsheet, and the address of the cell initially changed by the user, and
   determine the cells which need recomputation, and the order in which they
   need to be recomputed. For this function, you may assume that (is_dag deps)
   evaluates to true. *)
let rev_dependencies deps = List.map (fun (x,y)-> (y,x)) deps
let check lis1 lis2 = List.fold_left (&&) true (List.map (fun x-> List.mem x lis2) lis1)

  let _dfs graph start=
    let rec rdfs visited node =
      if not (List.mem node visited) then
        begin
          let s = successors node graph in
          let rgraph = rev_dependencies graph in 
          let rdeps = List.filter (fun x-> x<> node && x <> (-10000,-10000))(dfs rgraph node (-10000,-10000)) in 
          if check rdeps visited then 
          List.fold_left rdfs (node::visited) s
          else 
            visited
        end
      else visited
    in rdfs [] start

let plan_reeval (deps : (cell_address * cell_address) list)
                (init : cell_address) : cell_address list =

                List.rev (List.filter (fun x-> x<>init) (_dfs deps init))
       


(* For example, if:
   1. c1 = (1, 1), c2 = (1, 2), c3 = (2, 1), and c4 = (2, 2),
   2. deps = [(c2, c4); (c1, c2); (c3, c4); (c1, c3)], and
   3. init = c1,
   then (plan_reeval deps init) can evaluate either to [c2; c3; c4], or to
   [c3; c2; c4].

   On the other hand, it should never evaluate to [c2; c4; c3], since the cell
   c4 depends on the cell c3. *)

(******************************************************************************)
(* Question 6: Implementing Substitution Ciphers in a Spreadsheet (15 points)

   In this question, we will construct a simple substitution cipher using a
   spreadsheet. The cipher we implement is called the Vigenere cipher. We begin
   with a plaintext message, such as "CLASSFROMTHREETHIRTYTOFIVETHIRTY", and a
   key, such as "CSCI". It repeats the key as many times as needed to cover the
   plaintext:

     CLASSFROMTHREETHIRTYTOFIVETHIRTY
     CSCICSCICSCICSCICSCICSCICSCICSCI

   It then shifts each letter in the plaintext message by the corresponding
   number of characters to obtain the ciphertext. For example, shifting the
   plaintext character C by the key character C results in the character C + C =
   C + 2 = E. Similarly, shifting the plaintext character L by the key character
   S results in the ciphertext character L + S = L + 18 = D. Taken together,
   this would result in the ciphertext:

     CLASSFROMTHREETHIRTYTOFIVETHIRTY
     CSCICSCICSCICSCICSCICSCICSCICSCI
     --------------------------------
     EDCAUXTWOLJZGWVPKJVGVGHQXWVPKJVG

   Look at the spreadsheet cipher.ods, which you may open using the Calc
   spreadsheet program. The cell B1 contains the length of the key, and the
   cells B2:E2 contains the key chosen. The cells B4:AG4 contain the plaintext
   message.

   Complete this spreadsheet so that the desired ciphertext message
   "EDCAUXTWOLJZGWVPKJVGVGHQXWVPKJVG" appears in the ciphertext cells, B5:AG5.
   Assume that all characters are in uppercase letters between 'A' and 'Z'. You
   may use any other part of the spreadsheet for any purpose.

   You may use the tool available on the website
   https://www.dcode.fr/vigenere-cipher to test your implementation and to
   confirm encodings and decodings. *)

   (* = CHAR(MOD(CODE(B4)-65+ CODE(INDIRECT(ADDRESS(2,MOD((COLUMN(B5)- COLUMN($B$5)), $B$1)+2)))-65, 26)+ 65) *)