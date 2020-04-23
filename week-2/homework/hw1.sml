fun is_older((y1, m1, d1), (y2, m2, d2)) =
    if y1 <> y2
    then y1 < y2
    else if m1 <> m2
    then m1 < m2
    else d1 < d2

fun number_in_month (dates, month) =
    case dates of
        [] => 0
        | (_, m, _)::tl => let val n_in_tail = number_in_month (tl, month)
                           in if m = month then 1 + n_in_tail else n_in_tail end

fun number_in_months(dates: (int * int * int) list, months: int list) =
    case months of
        [] => 0
        | hd::tl => number_in_month(dates, hd) + number_in_months(dates, tl)

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
    if sum <= hd numbers
    then 0
    else 1 + number_before_reaching_sum(sum - hd numbers, tl numbers)

fun what_month(day_of_year : int) =
    let
        val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        number_before_reaching_sum(day_of_year, months) + 1
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
    