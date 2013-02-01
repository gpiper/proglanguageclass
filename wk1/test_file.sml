(* Problem 1*)
val t1 = is_older((2013, 4, 10), (2013, 1, 10)) = false (* valid date where d1 is after d2 should be false*)
val t2 = is_older((2012, 1, 1), (2012, 4, 4)) = true (* valid date where d1 is before d2 should be true*)
val t3 = is_older((2012, 1, 1), (2012, 1, 1)) = true (* Matching dates should be false*)
val f1 = is_older((98, 1, 2), (83, 1, 17)) = true

(* Probelm 2*)
val t4 = number_in_month([(2013, 4, 4), (2012, 4, 4), (2013, 1, 1)], 4) = 2
val t5 = number_in_month([], 4) = 0
val t6 = number_in_month([(2013, 4, 4), (2012, 4, 4), (2013, 1, 1)], 6) = 0

(* Problem 3 *)
val t7 = number_in_months([], []) = 0
val t8 = number_in_months([(2013, 4, 4), (2012, 4, 4), (2013, 1, 1)], [1,2,3,4]) = 3
val t9 = number_in_months([(2013, 5, 4), (2012, 5, 4), (2013, 5, 1)], [1,2,3,4]) = 0

(* Problem 4 *)
val t10 = dates_in_month([(2013, 4, 4), (2012, 4, 4), (2013, 1, 1)], 1) = [(2013, 1, 1)]
val t11 = dates_in_month([(2013, 4, 4), (2012, 4, 4), (2013, 1, 1)], 4) = [(2013, 4, 4), (2012, 4, 4)]
val t12 = dates_in_month([], 4) = []

(* Problem 5*)
val t13 = dates_in_months([(2013, 4, 4), (2012, 4, 4), (2013, 1, 1)], [12, 2, 1]) = [(2013, 1, 1)]
val t14 = dates_in_months([(2013, 4, 4), (2012, 4, 4), (2013, 1, 1)], [4, 5, 6]) = [(2013, 4, 4), (2012, 4, 4)]
val t15 = dates_in_months([(2013, 4, 4), (2012, 4, 4), (2013, 1, 1)], [1,3,4]) = [(2013, 1, 1), (2013, 4, 4), (2012, 4, 4)]

(* Problem 6 *)
val t16 = get_nth([], 3) = ""
val t17 = get_nth(["one", "two", "three"], 3) = "three"
val t18 = get_nth(["one", "two"], 12) = ""

(* Problem 7 *)
val t19 = date_to_string((2013, 4, 4)) = "April 4, 2013"
val t20 = date_to_string((2012, 5, 4)) = "May 4, 2012"
val t21 = date_to_string((1999, 10, 10)) = "October 10, 1999"

(* Problem 8 *)
val t22 = number_before_reaching_sum(10, [1,2,3,4,5])  = 3
val t23 = number_before_reaching_sum(100, [19, 29, 84, 71]) = 2
val t24 = number_before_reaching_sum(16, [1, 2, 3, 4, 5, 6]) = 5

(* Problem 9 *)
val t25 = what_month(31) = 1
val t26 = what_month(365) = 12
val t27 = what_month(274) = 10

(* Problem 10 *)
val t28 = month_range(31, 32) = [1, 2]
val t29 = month_range(360, 365) = [12, 12, 12, 12, 12, 12]
val t30 = month_range(365, 1) = []

(* Problem 11 *)
val t31 = oldest([(2013, 4, 4)]) =  SOME((2013, 4, 4))
val t32 = oldest([(2001, 4, 4), (2012, 4, 4), (2013, 1, 1)]) = SOME(2013, 1, 1)
val t33 = oldest([]) = NONE
