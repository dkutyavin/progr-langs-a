fun is_older(d1 : int * int * int, d2 : int * int * int) =
    if #1 d1 < #1 d2
    then true
    else if #2 d1 < #2 d2
    then true
    else if #3 d2 < #3 d2
    then true
    else false

fun number_in_month(dates : (int * int * int) list, month: int) =
    if null dates
    then 0
    else let
        val number_in_tail = number_in_month(tl dates, month)
        val is_current_proper = #2 (hd dates) = month
    in
        if is_current_proper
        then 1 + number_in_tail
        else number_in_tail
    end

fun number_in_months(dates: (int * int * int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates: (int * int * int) list, month: int) =
    if null dates
    then []
    else let
        val dates_in_tail = dates_in_month(tl dates, month)
        val is_current_proper = #2 (hd dates) = month
    in
        if is_current_proper
        then hd dates :: dates_in_tail
        else dates_in_tail
    end 

fun dates_in_months(dates: (int * int * int) list, months: int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(strings: string list, n: int) =
    if n = 1
    then hd strings
    else get_nth(tl strings, n - 1)

fun date_to_string(date: int * int * int) =
    let
        val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end

fun number_before_reaching_sum(sum : int, numbers : int list) =
    let
        fun find_index(sum : int, numbers : int list, index : int) = 
            if hd (tl numbers) >= sum - hd numbers
            then index
            else find_index(sum - hd numbers, tl numbers, index + 1)
    in
        find_index(sum, numbers, 1)
    end
    