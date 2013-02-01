
(* cards *)
(* spades *)
val ace_spades = (Spades, Ace)
val king_spades = (Spades, King)
val queen_spades = (Spades, Queen)
val jack_spades = (Spades, Jack)
val ten_spades = (Spades, Num(10))
val nine_spades = (Spades, Num(9))
val eight_spades = (Spades, Num(8))
val seven_spades = (Spades, Num(7))
val six_spades = (Spades, Num(6))
val five_spades = (Spades, Num(5))
val four_spades = (Spades, Num(4))
val three_spades = (Spades, Num(3))
val two_spades = (Spades, Num(2))

(* Hearts *)
val ace_hearts = (Hearts, Ace)
val king_hearts = (Hearts, King)
val queen_hearts = (Hearts, Queen)
val jack_hearts = (Hearts, Jack)
val ten_hearts = (Hearts, Num(10))
val nine_hearts = (Hearts, Num(9))
val eight_hearts = (Hearts, Num(8))
val seven_hearts = (Hearts, Num(7))
val six_hearts = (Hearts, Num(6))
val five_hearts = (Hearts, Num(5))
val four_hearts = (Hearts, Num(4))
val three_hearts = (Hearts, Num(3))
val two_hearts = (Hearts, Num(2))

(* Clubs *)
val ace_clubs = (Clubs, Ace)
val king_clubs = (Clubs, King)
val queen_clubs = (Clubs, Queen)
val jack_clubs = (Clubs, Jack)
val ten_clubs = (Clubs, Num(10))
val nine_clubs = (Clubs, Num(9))
val eight_clubs = (Clubs, Num(8))
val seven_clubs = (Clubs, Num(7))
val six_clubs = (Clubs, Num(6))
val five_clubs = (Clubs, Num(5))
val four_clubs = (Clubs, Num(4))
val three_clubs = (Clubs, Num(3))
val two_clubs = (Clubs, Num(2))

(* Diamonds*)
val ace_diamonds = (Diamonds, Ace)
val king_diamonds = (Diamonds, King)
val queen_diamonds = (Diamonds, Queen)
val jack_diamonds = (Diamonds, Jack)
val ten_diamonds = (Diamonds, Num(10))
val nine_diamonds = (Diamonds, Num(9))
val eight_diamonds = (Diamonds, Num(8))
val seven_diamonds = (Diamonds, Num(7))
val six_diamonds = (Diamonds, Num(6))
val five_diamonds = (Diamonds, Num(5))
val four_diamonds = (Diamonds, Num(4))
val three_diamonds = (Diamonds, Num(3))
val two_diamonds = (Diamonds, Num(2))


(* Problem 1 *)

(* Tests for problem 1A *)
val a1a = all_except_option("a", ["b", "c", "d"]) = NONE
val a1b = all_except_option("a", ["a", "b", "c"]) = SOME(["b", "c"])
val a1c = all_except_option("a", []) = NONE
val a1d = all_except_option("test", ["test", "one", "two", "three", "four"]) = SOME(["one", "two", "three", "four"])

(* Test for problem 1B *)
val b1a = get_substitutions1([["Fred", "Fredrick"], ["Betty", "Elizabeth"], ["Freddie", "Fred", "F"]], "Fred") = ["Fredrick", "Freddie", "F"]
val b1b = get_substitutions1([], "Betty") = []
val b1c = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]

(* Test for problem 1C *)
val c1a = get_substitutions2([["Fred", "Fredrick"], ["Betty", "Elizabeth"], ["Freddie", "Fred", "F"]], "Fred") = ["Fredrick", "Freddie", "F"]
val c1b = get_substitutions2([], "Betty") = []
val c1c = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]

(* Test for problem 1D *)
val d1a = similar_names([["Fred", "Fredrick"], ["Betty", "Elizabeth"], ["Freddie", "Fred", "F"]], {first = "Fred", middle = "W", last = "Smith"}) = 
[{first = "Fred", middle = "W", last = "Smith"}, {first="Fredrick",last="Smith",middle="W"}, {first="Freddie",last="Smith",middle="W"}, {first="F",last="Smith",middle="W"}]
val d1b = similar_names([["Fred","Fredrick"],["Geoff","Jeff","Jeffrey"]], {first = "Geoff", middle = "B", last = "Test"}) = 
[ {first = "Geoff", middle = "B", last = "Test"}, {first = "Jeff", middle = "B", last = "Test"}, {first = "Jeffrey", middle = "B", last = "Test"}]
val d1c = similar_names([],  {first = "Geoff", middle = "B", last = "Test"}) = {first = "Geoff", middle = "B", last = "Test"}

(* Problem 2 *)

(* Test for problem 2a *)
val a2a = card_color(jack_spades) = Black
val a2b = card_color(ace_clubs) = Black
val a2c = card_color(ten_hearts) = Red
val a2d = card_color(queen_diamonds) = Red

(* Test for problem 2b *)
val b2a = card_value(jack_spades) = 10
val b2b = card_value(ace_clubs) = 11
val b2c = card_value(seven_hearts) = 7
val b2d = card_value(queen_diamonds) = 10
val b2e = card_value(king_spades) = 10
val b2f = card_value(two_hearts) = 2
val b2g = card_value(three_hearts) = 3
val b2h = card_value(four_hearts) = 4
val b2i = card_value(five_hearts) = 5
val b2j = card_value(six_hearts) = 6
val b2k = card_value(eight_hearts) = 8
val b2l = card_value(nine_hearts) = 9
val b2m = card_value(ten_hearts) = 10

(* Test for problem 2c *)
val c2a = remove_card([ace_diamonds], ace_diamonds, IllegalMove) = []
val c2b = remove_card([ace_diamonds, ace_clubs, ace_hearts, ace_spades], ace_hearts, IllegalMove) = [ace_diamonds, ace_clubs, ace_spades]
(* val c2c = remove_card([ace_diamonds, ace_clubs, ace_hearts, ace_spades], seven_hearts, IllegalMove) handle IllegalMove => true = true *)


(* Test for problem 2d *)
val d2a = all_same_color([jack_spades, ace_clubs, queen_diamonds]) = false
val d2b = all_same_color([jack_spades, ace_clubs]) = true
val d2c = all_same_color([queen_spades, two_clubs, five_clubs, ten_spades]) = true

(* Test for problem 2e *)
val e2a = sum_cards([jack_spades, ace_clubs]) = 21
val e2b = sum_cards([]) = 0
val e2c = sum_cards([king_spades, two_hearts, four_hearts]) = 16

(* Test for problem 2f *)
val f2a = score([jack_spades, ace_clubs], 5) = 24 (* (3 * (21 - 5) / 2) = 24*)
val f2b = score([jack_spades, two_hearts], 24) = 12
val f2c = score([queen_spades, queen_hearts], 100) = 80

(* Tests for problem 2g *)
val g2a = officiate([(Clubs,Jack),(Hearts,Num(8))], [Draw, Draw, Draw], 12) = (3 * (18 - 12))
val g2b = officiate([ace_hearts, ace_clubs, ace_spades], [Draw, Discard(ace_hearts), Draw], 14) = ((14 - 11)) div 2	
