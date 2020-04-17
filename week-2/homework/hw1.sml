fun is_older(d1 : int * int * int, d2 : int * int * int) =
    if #1 d1 <> #1 d2
    then #1 d1 < #1 d2
    else if #2 d1 <> #2 d2
    then #2 d1 < #2 d2
    else #3 d1 < #3 d2

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

fun what_month(day_of_year : int) =
    let
        val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        val number = number_before_reaching_sum(day_of_year, months)
    in
        if day_of_year <= hd months
        then number
        else number + 1
    end

fun month_range(day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month(day1) :: month_range(day1 + 1, day2)

fun oldest(dates: (int * int * int) list) =
    if null dates
    then NONE
    else let
            fun oldest_nonempty (dates : (int * int * int) list) =
                if null (tl dates)
                then hd dates
                else
                    let val tl_ans = oldest_nonempty (tl dates)
                    in
                        if is_older(hd dates, tl_ans)
                        then hd dates
                        else tl_ans
                    end
        in
            SOME (oldest_nonempty dates)
        end
    