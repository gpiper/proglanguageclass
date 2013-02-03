(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* Problem 1 *)
fun only_capitals(ls) =
	List.filter (fn x => Char.isUpper(String.sub(x, 0))) ls

(* Problem 2 *)
fun longest_string1(ls, return_string) = 
	List.foldl (fn (s1, s2) => if String.size s1 > String.size s2 then s1 else s2) return_string ls
	(* Call fold with anonymous function that checks if the first strings size is larger than the second
		then return the larger of the two strings. This will return s1 if equal *)

(* Problem 3 *)
fun longest_string2(ls, return_string) =
	List.foldl (fn (s1, s2) => if String.size s2 > String.size s1 then s2 else s1) return_string ls
	(* Call fold with anonymous function that checks if the first strings size is larger than the second
		then return the larger of the two strings. This will return s2 if equal *)
