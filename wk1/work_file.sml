(* Geoff Piper *)
(* date format is (int * int * int) -> (year * month * day) *)
(* do not worry about validating dates. these should work for any reasonable dates *)

(* problem #1 *)
fun is_older(d1: int * int * int, d2: int * int * int) =
	let
		val year = #1 d1 > #1 d2	(* is d1 year > d2 year *)
		val month = #2 d1 > #2 d2	(* is d1 month > d2 month *)
		val day = #3 d1 > #3 d2		(* is d1 day > d2 day *)
	in
		if year		 		(* d1 year is > d2 year*)
		then false
		else if month		(* d1 month is > d2 month*)
		then false
		else if day			(* d1 day is > d1 day*)
		then false
		else true			(* d1 has day month and year that are less than d2 return true*)
	end

(* problem #2 *)
fun number_in_month(xs: (int * int * int) list, month: int) =
	let
		fun in_month(date: (int * int * int)) =
			#2 date = month
	in
		if null xs
		then 0
		else if in_month(hd xs) 
		then 1 + number_in_month(tl xs, month)
		else 0 + number_in_month(tl xs, month)
	end

(* Problem #3 *)
fun number_in_months(xs: (int * int * int) list, months: int list) =
	if null months 		(* no months in the list so we cant do anything but return 0 *)
	then 0
	else number_in_month(xs, hd months) + number_in_months(xs, tl months) 
	(* call number in months with head and recursive months with tail *)

(* Problem #4 *)
fun dates_in_month(xs: (int * int * int) list, month: int) =
	let
		fun is_in_month(date: (int * int * int)) =
			if #2 date = month
			then SOME(date)
			else NONE
	in
		if null xs 
		then []
		else if isSome(is_in_month(hd xs))
		then valOf(is_in_month(hd xs)) :: (dates_in_month(tl xs, month)) 
		else dates_in_month(tl xs, month)
	end

(* Problem #5 *)
fun dates_in_months(xs: (int * int * int) list, months: int list) =
	if null xs
	then []
	else if null months
	then []
	else dates_in_month(xs, hd months) @ dates_in_months(xs, tl months)

(* Problem #6 *)
fun get_nth(xs: string list, nth: int) =
	if null xs
	then ""
	else if nth = 1
	then hd xs
	else get_nth(tl xs, nth - 1)

(* Problem #7 *)
fun date_to_string(date: (int * int * int)) =
	let
		val months = ["January", "February", "March", "April", "May", "June", "July", "August",
			"September", "October", "November", "December"]
	in
		get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
	end

(* Problem #8 *)
fun number_before_reaching_sum(sum: int, numbers: int list) =
	let
		val new_sum = sum - hd numbers 
	in
		if new_sum > 0
		then 1 + number_before_reaching_sum(new_sum, tl numbers)
		else 0
	end

(* Problem #9 *)
fun what_month(day : int) =
	let
		val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	in
		(number_before_reaching_sum(day, days) + 1) 
		(* use get nth function passing in months list and the number that comes back from 
		number before reaching sum plus one since it returns the lower value*)
	end

(* Problem #10 *)
fun month_range(day1: int, day2: int) =
	let
		val difference = day2 - day1
	in
		if difference < 0
		then []
		else what_month(day1) :: month_range((day1 +1), day2)
	end

(* Problem #11 *)
fun oldest(date: (int * int * int) list) =
	if null date
		then NONE
		else if isSome(oldest(tl date))
		then 
			if is_older(hd date, valOf(oldest(tl date)))
			then SOME(hd date)
			else SOME(valOf(oldest(tl date)))	
		else SOME(hd date)

