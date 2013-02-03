(* Problem 1 Tests *)
val a1 = only_capitals(["Test", "test"]) = ["Test"]
val b1 = only_capitals([]) = []
val c1 = only_capitals(["test", "one", "two", "three"]) = []
val d1 = only_capitals(["Test", "One", "Two", "Three"]) = ["Test", "One", "Two", "Three"]

(* Problem 2 Tests *)
val a2 = longest_string1([], "") = ""
val b2 = longest_string1(["Test", "Geoffrey", "Titleist123"], "") = "Titleist123"
val c2 = longest_string1(["One Two Three Four", "One", "Two", "Three", "Five"], "") = "One Two Three Four"
val d2 = longest_string1(["One", "Two", "A"], "") ="One"

(* Problem 3 Tests *)
val a3 = longest_string2([], "") = ""
val b3 = longest_string2(["Test", "Geoffrey", "Titleist123"], "") = "Titleist123"
val c3 = longest_string2(["One Two Three Four", "One", "Two", "Three", "Five"], "") = "One Two Three Four"
val d3 = longest_string2(["One", "Two", "A"], "") = "Two"