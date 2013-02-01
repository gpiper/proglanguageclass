
(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
(* Problem 1 A *)
fun all_except_option(str, str_list) =
	let
		fun build_list(temp) = 							(* Build list function*)
			case temp of
				[] => []								(* Empty list return empty list*)
			|	x::xs' =>	if same_string(x, str)		(* does our string match? *)
							then build_list(xs')		(* Yes it does we are building the list from tail *)
							else x::build_list(xs')		(* no it didnt append the first on to the back *)
		val li = build_list(str_list)					(* our list built from build list*)
	in
		if length li = length str_list					(* do our list lengths match? *)
		then NONE										(* yes they do so string not found *)
		else SOME(li)									(* nope they dont we have found the value *)
	end

(* Problem 1 B *)
fun get_substitutions1(str_list, str) =
	case str_list of
		[] => []													(* Empty list return empty list*)
	|	x::xs => 	case all_except_option(str, x) of 	
						NONE => get_substitutions1(xs, str)			(* We returned None call recursive with rest *)
					|	SOME(x) => x @ get_substitutions1(xs, str)	(* append two lists together*)

(* Problem 1 C *)
fun get_substitutions2(str_list, str) =
	let
		fun compile_list(sl, acc) =									(* Helper function with tail recursion *)
			case sl of
				[] => acc											(* Empty return the current accumulator *)
			| 	x::xs' => case all_except_option(str, x) of  		
							NONE => compile_list(xs', acc)			(* None complete with rest of list *)
						|	SOME(x) => compile_list(xs', acc @ x)	(* Add what was found to acc and call recurively *)
	in
		compile_list(str_list, [])
	end

(* Problem 1 D *)
fun similar_names(sl, name_record) =
	let
		val {first = f, middle = m, last = l} = name_record			(* split name with pattern match *)
		val sub = get_substitutions1(sl,f)							(* get our subsitutions *)
		fun return_record(nl) =
			case nl of
				[] => []											(* empty return empty *)
			|  x::xs' => {first = x, middle = m, last = l} :: return_record(xs') (* generate our list and recusive with rest*)

	in
		name_record :: return_record(sub) (* attach first and then get subs *)
	end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

(* Problem 2 A *)
fun card_color((s, r)) =		(* pattern match to card type*)
	case s of 					(* only need to match on suit type *)
		Spades => Black
	|	Clubs => Black
	|	Hearts => Red
	|	Diamonds => Red

(* Problem 2 B *)
fun card_value((s, r)) =		(* pattern match to card type *)
	case r of 					(* only need to match on rank *)
		Ace => 11				(* ace 11 *)
	|	Num(i) => i 			(* number gets whatever is stored in it *)
	|	_ => 10					(* all other cards are 10 *)

(* Problem 2 C *)
fun remove_card(cs, c, e) =
	let
		fun create_list(cl) =
			case cl of
				[] => []
			|	x::xs' => 	if x = c
							then xs'
							else x :: remove_card(xs', c, e)

		val updated = create_list(cs)
	in
		if cs = updated
		then raise e
		else updated
	end

(* Problem 2 D *)
fun all_same_color(cs) =
	case cs of
		[] => true				(* empty list are all the same color *)
	|	x::[] => true			(* one element list are all the same color*)
	|	x::y::xs' => case (card_color(x), card_color(y)) of 				(* pattern match on a two + element list to make tuple*)
							(Black, Black) => true andalso all_same_color(y::xs') 	(* Black cards are same color *)
						|	(Red, Red) => true andalso all_same_color(y::xs')		(* Red cards are same color *)
						|	_ => false												(* one card of each color *)

(* Problem 2 E *)
fun sum_cards(cs) =
	let
		fun add(cl, total) =
			case cl of
				[] => total			(* tail recursive empty list return what our acculumator value is *)
			| x::xs' => add(xs', total + card_value(x))	(* call add with the tail of the list and adding the card value to acc *)
	in
		add(cs, 0)
	end

(* Problem 2 F *)
fun score(cl, goal) =
	let
		val sum = sum_cards(cl)					(* sum our current cards *)
		val suited = all_same_color(cl)			(* are all cards same color... yes name is off *)
		val preliminary = if sum > goal then 3 * (sum - goal) else goal - sum  (* build prelim score *)
	in
		if suited				 	(* are cards same color? *)
		then preliminary div 2		(* yes we divide by 2 *)
		else preliminary			(* no return preliminary score *)
	end

fun officiate(cl, ml , goal) =
	let
		fun game_status(held_cards, card_list, move_list) =
			case move_list of
				[] => score(held_cards, goal)
			|	x::xs' => case x of
							Discard(c) => game_status(remove_card(held_cards, c, IllegalMove), card_list, xs')
						|	Draw =>  case card_list of
										[] => score(held_cards, goal)
									|	y::ys' =>  	if sum_cards(y::held_cards) > goal
													then score(y::held_cards, goal)
													else game_status(y::held_cards, ys', xs')
	in
		game_status([], cl, ml)
	end
	

