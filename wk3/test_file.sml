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

