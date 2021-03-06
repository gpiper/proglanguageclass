(* Problem 1 Tests *)
val a1 = only_capitals(["Test", "test"]) = ["Test"]
val b1 = only_capitals([]) = []
val c1 = only_capitals(["test", "one", "two", "three"]) = []
val d1 = only_capitals(["Test", "One", "Two", "Three"]) = ["Test", "One", "Two", "Three"]

(* Problem 2 Tests *)
val a2 = longest_string1([]) = ""
val b2 = longest_string1(["Test", "Geoffrey", "Titleist123"]) = "Titleist123"
val c2 = longest_string1(["One Two Three Four", "One", "Two", "Three", "Five"]) = "One Two Three Four"
val d2 = longest_string1(["One", "Two", "A"]) ="One"

(* Problem 3 Tests *)
val a3 = longest_string2([]) = ""
val b3 = longest_string2(["Test", "Geoffrey", "Titleist123"]) = "Titleist123"
val c3 = longest_string2(["One Two Three Four", "One", "Two", "Three", "Five"]) = "One Two Three Four"
val d3 = longest_string2(["One", "Two", "A"]) = "Two"

(* Problem 4 Tests *)
(* longest string 3 *)
val a4 = (longest_string3 ["One", "Two", "A"]) = "One"
val b4 = (longest_string3 ["Test", "Geoffrey", "Titleist123"]) = "Titleist123"
val c4 = (longest_string3 []) = ""
(* longest string 4 *)
val d4 = (longest_string4 ["One", "Two", "A"]) = "Two"
val e4 = (longest_string4 ["Test", "Geoffrey", "Titleist123"]) = "Titleist123"
val f4 = (longest_string4 []) = ""

(* Problem 5 tests *)
val a5 = longest_capitalized ["One", "Two", "A"] = "Two"
val b5 = longest_capitalized ["one", "two", "a"] = ""
val c5 = longest_capitalized ["Test", "Geoffrey", "Titleist123"] = "Titleist123"
val d5 = longest_capitalized ["A", "onetwothreefour"] = "A"
val e5 = longest_capitalized ["A"] = "A"

(* Problem 6 tests *)
val a6 = rev_string "test" = "tset"
val b6 = rev_string "Geoffrey" = "yerffoeG"
val c6 = rev_string "Hello, World" = "dlroW ,olleH"
val d6 = rev_string "" = ""

(* Problem 7 *)
val a7 = first_answer (fn x => if (x mod 2 = 0) then SOME(x) else NONE) [1,2,3] = 2
(*val b2 = (first_answer (fn x => if x > 10 then SOME(x) else NONE) [1,2,3]) handle NoAnswer => print "Caught exception"*)
val c7 = first_answer (fn x => if (x mod 2 <> 0) then SOME(x) else NONE) [1,2,3] = 1

(* Problem 8 *)
val a8 = all_answers (fn x => if (x mod 2 = 0) then SOME [x] else NONE) [1,2,3] = NONE
val b8 = all_answers (fn x => if (x mod 2 = 0) then SOME [x] else NONE) [2,4,6] = SOME [2,4,6]
val c8 = all_answers (fn x => if x = "test" then SOME[x] else NONE) ["test"] = SOME ["test"]
val d8 = all_answers (fn x => if x = "test" then SOME[x] else NONE) ["test", "none"] = NONE

(* Problem 9a *)
val a9a = count_wildcards Wildcard = 1
val b9a = count_wildcards (Variable "test") = 0
val c9a = count_wildcards (TupleP [Wildcard, Variable "test", Wildcard, TupleP[Wildcard]]) = 3

(* Problem 9b *)
val a9b = count_wild_and_variable_lengths Wildcard = 1
val b9b = count_wild_and_variable_lengths (Variable "test") = 4
val c9b = count_wild_and_variable_lengths (TupleP [Wildcard, Variable "test", Wildcard, TupleP [Wildcard]]) = 7
val d9b = count_wild_and_variable_lengths (ConstructorP("test", Wildcard)) = 1

(* Problem 9c *)
val a9c = count_some_vars ("test", (Variable "test")) = 1
val b9c = count_some_vars ("test", (TupleP [Variable "test", Variable "test", Wildcard, TupleP [Variable "test"]])) = 3
val c9c = count_some_vars ("test", Wildcard) = 0

(* Problem 10 *)
val a10 = check_pat (TupleP[ ConstructorP ("geoff",(Variable "test")),ConstructorP ("test",(ConstP 4))]) = false
val b10 = check_pat (TupleP[ ConstructorP ("egg",(Variable "salad")),ConstructorP ("sandwhich",(ConstP 4))]) = true

(* Problem 11 *)
val a11 = match( Tuple[Const 49, Const 6, Unit, Const 8], 
           TupleP[ConstP 49, Variable "Geoff", Wildcard, ConstP 8] ) = SOME [("Geoff",Const 6)];
val b11 = match(Unit, UnitP) = SOME []
val c11 = match (Const 57, ConstP 57) = SOME[]
val d11 = match (Unit, Wildcard) = SOME []
val e11 = match (Unit, Variable "test") = SOME [("test", Unit)]
val f11 = match (Constructor("test", Unit) , ConstructorP("test", Wildcard)) = SOME []


(* Problem 12 *)
val a12 = first_match Unit [UnitP] = SOME []
val b12 = first_match (Const 57) [ConstP 79] = NONE
val c12 = first_match (Tuple [Const 49, Const 6, Unit, Const 8]) ([TupleP [ConstP 49, (Variable "Geoff"), Wildcard, ConstP 8]]) = SOME [("Geoff",Const 6)]


