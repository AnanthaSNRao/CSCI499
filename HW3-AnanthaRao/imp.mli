type aexp =
    Int of int
  | Var of string
  | Plus of aexp * aexp
  | Minus of aexp * aexp
type bexp =
    Bool of bool
  | Lt of aexp * aexp
  | Leq of aexp * aexp
  | Eq of aexp * aexp
  | And of bexp * bexp
  | Or of bexp * bexp
  | Not of bexp
type cmd =
    Output of aexp
  | Asgn of string * aexp
  | Skip
  | Seq of cmd * cmd
  | IfElse of bexp * cmd * cmd
  | While of bexp * cmd
val string_of_aexp : aexp -> string
val string_of_bexp : bexp -> string
val string_of_cmd : cmd -> string
module Pmap :
  sig
    type ('a, 'b) t = ('a, 'b) Base.Map.Poly.t
    val empty : ('a, 'b) t
    val is_empty : ('a, 'b) t -> bool
    val add : 'a -> 'b -> ('a, 'b) t -> ('a, 'b) t
    val find : 'a -> ('a, 'b) t -> 'b option
    val of_alist_multi : ('a * 'b) list -> ('a, 'b list) t
    val to_alist : ('a, 'b) t -> ('a * 'b) list
    val map : ('b -> 'c) -> ('a, 'b) t -> ('a, 'c) t
  end
module Pset :
  sig
    type 'a t = 'a Base.Set.Poly.t
    val empty : 'a t
    val contains : 'a t -> 'a -> bool
    val add : 'a t -> 'a -> 'a t
  end
