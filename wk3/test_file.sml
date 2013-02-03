(* Problem 1 Tests *)
val a1 = only_capitals(["Test", "test"]) = ["Test"]
val b1 = only_capitals([]) = []
val c1 = only_capitals(["test", "one", "two", "three"]) = []
val d1 = only_capitals(["Test", "One", "Two", "Three"]) = ["Test", "One", "Two", "Three"]

(* Problem 2 Tests *)
val a2 = longest_string1([], "") = ""
val b2 = longest_string1(["Test", "Geoffrey", "Titleist"], "") = "Titleist"
val c2 = longest_string1(["One Two Three Four", "One", "Two", "Three", "Five"], "") = "One Two Three Four"
