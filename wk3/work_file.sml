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
fun longest_string1(ls) = 
	List.foldl (fn (s1, s2) => if String.size s1 > String.size s2 then s1 else s2) "" ls
	(* Call fold with anonymous function that checks if the first strings size is larger than the second
		then return the larger of the two strings. This will return s1 if equal *)

(* Problem 3 *)
fun longest_string2(ls) =
	List.foldl (fn (s1, s2) => if String.size s2 > String.size s1 then s2 else s1) "" ls
	(* Call fold with anonymous function that checks if the first strings size is larger than the second
		then return the larger of the two strings. This will return s2 if equal *)

(* Problem 4 *)
(* longest string helper *)
fun longest_string_helper function_supplied ls =
	List.foldl (fn (s1, s2) => if function_supplied(String.size s1, String.size s2) then s1 else s2) "" ls

val longest_string3 = longest_string_helper (fn (s1, s2) => if  s1 > s2 then true else false)
val longest_string4 = longest_string_helper (fn (s1, s2) => if s1 >= s2 then true else false)

(* Problem 5*)
val longest_capitalized = longest_string2 o only_capitals

(* Problem 6 *)
val rev_string  =
	String.implode o List.rev o String.explode

(* Problem 7 *)
fun first_answer function_supplied al = 
	case al of 
		[] => raise NoAnswer
	| 	x::xs' => case function_supplied x of
						NONE => first_answer function_supplied xs'
					| 	SOME(y) => y 

(* Problem 8 *)
fun all_answer function_supplied al = 
	let
		fun helper(ls ,acc) =
			case ls of
				[] => SOME acc
			|	x::xs' => case function_supplied x of
							NONE => NONE
						|	SOME(y) => helper(xs', acc @ y)
	in
		helper(al, [])
		
	end

(* Problem 9a *)
val count_wildcards = g (fn () => 1) (fn x => 0)

(* Problem 9b *)
val count_wild_and_variable_lengths = g (fn () => 1) (fn x => String.size x)

(* Problem 9c *)
fun count_some_vars (s, p) = g (fn () => 0) (fn x => if x = s then 1 else 0) p


