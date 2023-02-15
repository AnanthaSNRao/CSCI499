(*******************************************************************************
Homework 1
==========
CSCI 499, Fall 2022: An Introduction to Functional Programming
Mukund Raghothaman
Due: 10pm PT on 16 September, 2022
*******************************************************************************)

(*******************************************************************************
- Your name: Anantha Sree Skanda Seegvalu Narayana Rao
- Your partner's name (if any): N/A
*******************************************************************************)

(*******************************************************************************
Instructions
------------
1. Please setup your programming environment by following the steps outlined in
   the cheatsheet and on the course website.
2. Please feel free to collaborate with a partner, but make sure to write your
   submission individually.
3. Rename this file to HW1-yourname.ml, where yourname is your name, before
   submitting it on Blackboard.
4. Make sure that I can cleanly import this file into the OCaml toplevel when I
   call #use "HW1-yourname.ml". Comment out any questions you were unable to
   solve / have left unanswered.
*******************************************************************************)

(* exception NotImplemented *)

(** Distribution of points: 5 + 6 + 6 + 13 + 10 + 10 + 10 + 10 = 75 *)

(******************************************************************************)
(* Question 1: Starting Off (5 points)
   State the types and the results of evaluating the following expressions. *)

let _ = 5 + 3 - 2
(* - : int = 6 *)
let _ = 2. ** 0.5
(* - : float = __________ *)
let _ = [1; 2; 3] @ [4; 5; 6]
(* - : int list = [1; 2; 3; 4; 5; 6] *)
let _ = ("abc" ^ "def").[3]
(* - : char = 'd' *)
let _ = fun x -> x + 1
(* - : int -> int = <fun> *)

(******************************************************************************)
(* Question 2: Simple Expressions (2 + 4 points) *)

(* 2a. Recall the formula for the solutions of a quadratic equation
       a * x ** 2 + b * x + c = 0: (-b +/- sqrt(b ** 2 - 4 * a * c)) / (2 * a).
       The roots are real-valued iff the discriminant b ** 2 - 4 * a * c is
       non-negative.

       Write a function solveQuad a b c : (float * float) option which returns
       the real-valued roots of a quadratic equation, if they exist.

       In the following declaration, replace the call to raise with your
       implementation. *)

let solveQuad (a : float) (b : float) (c : float) : (float * float) option =
   if b *. b >= 4.0 *. a *. c then Some (b +. sqrt ( b *. b -. (4.0 *. a *. c)), b -. sqrt ( b *. b -. (4.0 *. a *. c))) else None;;

(* 2b. For a given initial positive integer value n1, the Collatz sequence
       n1, n2, n3, ... is defined as follows:
       n{i + 1} = ni / 2, if ni is even, and
                  3 * ni + 1, otherwise.
       For example, for n1 = 3, the sequence is 3, 10, 5, 16, 8, 4, 2, 1, 4, 2,
                                                1, 4, 2, 1, ..., and
                    for n1 = 12, the sequence is 12, 6, 3, 10, 5, 16, 8, 4, 2,
                                                 1, ...

       The famous Collatz conjecture states that regardless of the initial value
       n1, the sequence always reaches 1.

       Write a function collatzLen : int -> int such that collatzLen n1 is the
       number of elements in the Collatz sequence before attaining the value 1.
       For example, collatzLen 3 = 7, collatzLen 12 = 9, and collatzLen 1 = 0.
       For full credit, make sure that your implementation is tail-recursive.
       Explain how your solution works. *)

let rec collatzLen (n : int) : int = match n with
| 1 -> 0 
| n -> if n mod 2 = 0 then collatzLen(n/2)+1 else collatzLen(3*n + 1)+1
(* if n matchs with 1 then the value id zero, or else if n%2 ==0  we call collatzLen(n/2)+1 else  collatzLen(3*n + 1)+1 recursivly *)


(******************************************************************************)
(* Question 3: Evaluation Sequences (2 + 4 points)

   Recall the evaluation sequence for the factorial function, *)

let rec factorial n = if n = 0 then 1 else n * factorial (n - 1)

(* factorial 4 ==> if 4 = 0 then 1 else 4 * factorial (4 - 1)
               ==> if false then 1 else 4 * factorial (4 - 1)
               ==> 4 * factorial (4 - 1)
               ==> 4 * factorial 3
               ==> 4 * (if 3 = 0 then 1 else 3 * factorial (3 - 1))
               ==> 4 * (if false then 1 else 3 * factorial (3 - 1))
               ==> 4 * (3 * factorial (3 - 1))
               ==> 4 * (3 * factorial 2)
               ==> ...
               ==> 4 * (3 * (2 * (1 * 1)))
               ==> 4 * (3 * (2 * 1))
               ==> 4 * (3 * 2)
               ==> 4 * 6
               ==> 24

   Define the naive function to compute Fibonacci numbers as follows: *)

let rec fib n =
  if n = 0 then 0
  else if n = 1 then 1
  else fib (n - 1) + fib (n - 2)

(* 3a. State the evaluation sequence of fib 3.
         - : int = 2
         
   3b. If a function is tail recursive, then the size the intermediate
       expressions in the evaluation sequence is bounded by a constant. Write an
       alternative tail-recursive function fib2 : int -> int to compute
       Fibonacci numbers. Explain how your implementation works. *)

let rec fib2 n a b = 
   if n = 0 then a 
   else if  n = 1 then b 
   else fib2 (n-1) b (a+b)
(* I am using a and b as accumulator which intinitally will be 0 1 repectively. we call this fuction as fib2 5 0 1 for 5th element in fibonacci series 
we Accumulate a+b for every n which is as same as adding two previous numers of fibonacci series.
*)
(******************************************************************************)
(* Question 4: Types (5 + 8 points)

   4a. Provide examples of expressions with the following types:*)
      let a = 3
       (*- int*)

       let b = [1;2;4;]
       (*- int list*)

      let len = List.length
       (*- int list -> int*)
      
       let try_it x f = f x
       (*- 'a -> ('a -> 'b) -> 'b*)

       let rec try_it2 f  = try_it2 (fun x-> f x) 
       (*- 'a -> ('b -> 'a) -> 'b *)
       (* Pending  ------- ----- ------ *)

   (* 4b. Provide examples of expressions e so that the following expressions are
       well-typed:*)
       let e = let e = 3 in 3 + e

       let e = let e = int_of_float in 3 + (e 3.2)

       let e = let e = List.length  in (e [1; 2; 3]) + 2

       let e = let e = fun x-> x+1 in (fun x -> x 0) e

(******************************************************************************)
(* Question 5: Higher-Order Functions (4 + 6 points)

   5a. The integral of a function f between two points a and b is defined as
       (f a + f (a + epsilon) + f (a + 2 * epsilon) + ... + f (a + k * epsilon))
       * epsilon, where epsilon > 0 is a small real number, and k is the largest
       integer such that a + k * epsilon <= b.

       Write an expression (integral f a b epsilon) which computes the integral
       of f between a and b with interval size epsilon. State its type. Explain
       how your implementation works. *)

let rec getList a b epsilon = if b = 0 then [] else (a + (b*epsilon)) :: getList a (b-1) epsilon;;


let rec applyFuc f = function
  | [] -> 0
  | h::t -> f h + (applyFuc f t)

let integral f a b epsilon = 
   let lis = getList a b epsilon in 
   applyFuc f lis
   (* 
   I have created a getList function which  a + (a + epsilon),  (a + 2 * epsilon), ... , (a + k * epsilon)).
   Then applyFun function will apply any given function f on the list got by getList function giving
   (f a + f (a + epsilon) + f (a + 2 * epsilon) + ... + f (a + k * epsilon)). Both combined together is the integral what we need.
   *)

(* 5b. Consider the following expressions doTwo, doThree, doFour, etc. which
       take a function f and apply it two, three, four, etc. times to the input
       argument x: *)

let doTwo f x = f (f x)
let doThree f x = f (f (f x))
let doFour f x = f (f (f (f x)))

(*  - Write a function doN such that (doN n) : ('a -> 'a) -> 'a -> 'a is the
      corresponding function which does something n times. Explain how your
      implementation works. *)

let rec doN f x (n : int) = if n = 1 then f x else doN f(f x) (n-1)
(*    To test your solution, you might find the following function useful: *)
(* doN funtion is recursive function which takes function f and applies f times n-1 on f(x) recursively  *)

let explain n = n Int.succ 0
(*  working with explain declared above like
explain doN 3 
explain doN 5  *)

(*    The function Int.succ : int -> int returns the successor of its input
      argument. For example, Int.succ 3 evaluates to 4, and Int.succ 5 evaluates
      to 6. You will notice that (explain doTwo) evaluates to 2,
      (explain doThree) evaluates to 3, and so on. If your submission is
      correct, (explain (doN n)) will evaluate to n, for all integer values n.

    - Explain, in English, how the function named explain works.

    - Write a function add which adds two numbers represented in this manner. In
      particular, for all machine integers m and n, ensure that
      explain (add (doN m) (doN n)) evaluates to (m + n). *)

let add m n = m + n 
(* add; explain doN 4; (explain doN 3);; *)

(*    Bonus: The expression (doN n) can alternatively be viewed as the
      definition of the number n itself. These form the basis of a fascinating
      logical construction called the Church numerals. Solve Exercise 2.6 of the
      SICP textbook.

      Regardless of the mathematical machinery, the underlying idea is
      essentially that of the visitor pattern from object-oriented
      programming. *)

(******************************************************************************)
(* Question 6: One Nontrivial Algorithm (10 points)

   A binary search tree is defined as follows: *)

type tree = Leaf
          | Node of int * tree * tree
          [@@deriving show]

(* with the invariant that all numbers in the left subtree are strictly less
   than the value at the root, and all numbers in the right subtree are strictly
   greater than the value at the root: *)

let is_bst t =
  let rec bounds l t h = match t with
                         | Leaf -> true
                         | Node(n, t1, t2) -> (l < n) &&
                                              bounds l t1 n && bounds n t2 h &&
                                              (n < h)
  in bounds min_int t max_int

(* Write a function merge : tree -> tree -> tree which merges two binary search
   trees into a single tree containing all numbers in either of the input trees.
   Explain how your solution works. *)

let merge (t1 : tree) (t2 : tree) : tree = 
   let rec inorder (t: tree): int list= 
         match t with
         | Leaf -> []
         | Node(c, tl, tr) -> inorder(tl) @( c :: inorder tr) in

   let l1 = inorder t1 in 
   let l2 = inorder t2 in

   let rec mergeList l1 l2 = 
      match l1, l2 with
      | [], _ -> l2
      | _, [] -> l1
      | hd1::tl1, hd2::tl2 -> if hd1< hd2 
                        then hd1 :: mergeList tl1 l2 
                        else hd2 :: mergeList l1 tl2 in
      let l = mergeList l1 l2 in

      let rec buildTree l=
               match l with
               | [] -> Leaf
               | hd:: tl -> Node(hd, Leaf, buildTree tl) in
      
      buildTree l

(* 
Firstly we are creating inorder travesal in list from the trees and mergeList is merging both the lists so that it creates a non decreasing ordered list. 
This is done by comparing the head of both the lists and recursively calling the mergList function.
Then we build a tree from the so formed list by the mergeList so that each left subtree is None.
*)

(******************************************************************************)
(* Question 7: Expression Evaluator (4 + 6 points)

   In this question, we will implement our first interpreters for an extremely
   simple language of arithmetic expressions. Consider the type expr1 of
   arithmetic expressions defined as follows: *)

type expr1 = Int1 of int
           | Plus1 of expr1 * expr1
           | Minus1 of expr1 * expr1
           | Mult1 of expr1 * expr1
           [@@deriving show]

(* For example, the value Plus1(Int1 3, Int1 8) represents the expression
   (3 + 8) which, when evaluated, produces the result 11. The base constructor
   Int1 constructs an expression out of an integer value, while the Plus1,
   Minus1 and Mult1 constructors encode the addition, subtraction and
   multiplication operations respectively.

   7a. Write a function eval1 : expr1 -> int which produces the result of
       evaluating an expression. *)

let rec eval1 (e : expr1) : int = match e with
       | Int1 a -> a
       | Plus1(Int1 a, Int1 b)-> a+b
       | Minus1(Int1 a, Int1 b) -> a-b
       | Mult1(Int1 a, Int1 b) -> a*b
       | Plus1(e1, e2) -> eval1 e1 + (eval1 e2)
       | Minus1(e1, e2) -> eval1 e1 - (eval1 e2)
       | Mult1(e1, e2) -> eval1 e1 * (eval1 e2);;


(*     Next, we extend the type expr1 of expressions with constructors that
       encode variables and let expressions. The following type expr2 is just
       like expr1, except that the expression
       (Let2 "x" (Int2 3) (Plus2(Var2 "x", Var2 "x"))) stands for the OCaml
       expression (let x = 3 in x + x). As in OCaml, variables are statically
       scoped. *)

type expr2 = Int2 of int
           | Plus2 of expr2 * expr2
           | Minus2 of expr2 * expr2
           | Mult2 of expr2 * expr2
           | Var2 of string
           | Let2 of string * expr2 * expr2
           [@@deriving show]

(* 7b. Write a function (eval2 : expr2 -> int option) which returns the result
       of evaluating an expression, if it is defined.

       You will find it useful to maintain a map from variable names to bound
       values. Recall how maps work from our discussion in class on Aug 31. We
       invoke the following magic incantation to start you off: *)

module StringMap = Map.Make(String)
let empty_map = StringMap.empty

(*     To bind a key k to a value v, write (StringMap.add k v m). For
       example: *)

let m1 = StringMap.add "x" 3 empty_map

(*     To check if a map m contains a key k, write (StringMap.find_opt k m). For
       example, (StringMap.find_opt "x" m1) evaluates to Some 3, and
       (StringMap.find_opt "y" m1) evaluates to None.

       Note that maps are immutable objects: the result of evaluating
       StringMap.add is a new map with the desired key-value association; the
       original map is unaltered. For example,
       (StringMap.find_opt "x" empty_map) still evaluates to None. *)
let rem a= match a with
       | Some x -> x
       | None -> 0;;


let rec eval2 (e : expr2) : int option = match e with
                                 | Int2 a-> Some a
                                 | Plus2(Int2 a, Int2 b)-> Some (a+b)
                                 | Minus2(Int2 a, Int2 b) -> Some (a-b)
                                 | Mult2(Int2 a, Int2 b) -> Some (a*b)
                                 | Plus2(e1, e2) -> Some(rem (eval2 e1) + rem (eval2 e2))
                                 | Minus2(e1, e2) -> Some(rem (eval2 e1) - rem (eval2 e2))
                                 | Mult2(e1, e2) -> Some(rem (eval2 e1) * rem (eval2 e2))
                                 | Var2 a -> StringMap.find_opt a m1
                                 | Let2(k, e1, e2) -> Some(rem(StringMap.find_opt k m1) * rem(eval2 e1) * rem(eval2 e2));;

(******************************************************************************)
(* Question 8: Tail Recursive In-Order Traversals (Challenge Problem, 15 points)

   Recall the traditional approach to perform an in-order traversal of a tree
   t: *)

let rec inorder (t : tree) : int list =
  match t with
  | Leaf -> []
  | Node(a, tl, tr) -> (inorder tl) @ [ a ] @ (inorder tr)

(* Observe that inorder is not tail-recursive because it makes two recursive
   calls to itself. Implement an equivalent tail-recursive version
   inorder2 : tree -> int list. Explain how your solution works.

   This question is significantly harder than Questions 2b and 3b, but captures
   the essence of why _any_ computation can be expressed using tail recursive
   calls. *)
let identity x = x

let inorder2 t =
   let rec loop t inorderList =
         match t with
            | Leaf -> inorderList []
            | Node (v, l, r) ->
               loop r (fun right ->
               loop l (fun left ->
                  inorderList (List.append left (v :: right))))
   in
   loop t identity

(* loop is a function which takes tree and inorderList(an emptyList used as accumulator). This fuction travers the emelemts of the tree and adds it's int value to
inorderList. loop fuction matches with tree and if it is a leaf it inorderList and [] (to append to the inorderList )
else is the node Node(v,l,r) is present we call loop function to r (right subtree) and a fun which in-turn calls loop l which in-turn returns 
inorderList and we append left list (v:: right).
*)
  
(* HINT: How would you implement in-order traversal in your favorite imperative
   language, without recursion? *)
   
