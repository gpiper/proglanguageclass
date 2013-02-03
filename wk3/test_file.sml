(* Problem 1 Tests *)
val a1 = only_capitals(["Test", "test"]) = ["Test"]
val b1 = only_capitals([]) = []
val c1 = only_capitals(["test", "one", "two", "three"]) = []
val d1 = only_capitals(["Test", "One", "Two", "Three"]) = ["Test", "One", "Two", "Three"]