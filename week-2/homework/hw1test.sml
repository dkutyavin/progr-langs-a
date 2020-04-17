(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


val test1_1 = is_older ((1,2,3),(2,3,4)) = true
val test1_2 = is_older ((2,3,4),(1,2,3)) = false
val test1_3 = is_older ((~10, 1, 1), (1, 1, 1)) = true
val test1_4 = is_older ((2000, 1, 1), (1999, 12, 31)) = false
val test1_5 = is_older ((1999, 1, 1), (2000, 1, 1)) = true
val test1_6 = is_older ((1999, 1, 1), (1999, 2, 1)) = true
val test1_7 = is_older ((1999, 1, 1), (1999, 1, 2)) = true

val test2_1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test2_2 = number_in_month ([(2012,2,28),(2013,12,1), (1999, 2, 1), (2020, 4, 17), (2010, 1, 4)],2) = 2
val test2_3 = number_in_month ([(2019, 9, 9), (2019, 5, 4), (2019, 4, 4)], 1) = 0
val test2_4 = number_in_month ([], 10) = 0

val test3_1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_2 = number_in_months ([(2012,2,28),(2013,12,1)], [2]) = 1
val test3_3 = number_in_months ([(2012,2,28),(2013,12,1)], []) = 0
val test3_4 = number_in_months ([(2012, 1, 10), (2010, 1, 2), (2000, 5, 13), (1995, 5, 2), (1999, 2, 2)], [5, 1, 2]) = 5

val test4_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4_2 = dates_in_month ([(2012,2,28),(2013,12,1), (1999, 2, 1), (2020, 4, 17), (2010, 1, 4)], 2) = [(2012,2,28), (1999, 2, 1)]
val test4_3 = dates_in_month ([(2019, 9, 9), (2019, 5, 4), (2019, 4, 4)], 1) = []
val test5_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5_2 = dates_in_months ([(2012,2,28),(2013,12,1)], [2]) = [(2012,2,28)]
val test5_3 = dates_in_months ([(2012,2,28),(2013,12,1)], []) = []
val test5_4 = dates_in_months ([(2012, 1, 10), (2010, 1, 2), (2000, 5, 13), (1995, 5, 2), (1999, 2, 2)], [5, 1, 2]) = [(2000, 5, 13), (1995, 5, 2), (2012, 1, 10), (2010, 1, 2), (1999, 2, 2)]


val test6_1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test6_2 = get_nth (["hello", "world"], 1) = "hello"
val test6_3 = get_nth (["how", "was", "your", "day", "?"], 5) = "?"

val test7_1 = date_to_string (2013, 6, 1)  = "June 1, 2013"
val test7_2 = date_to_string (1994, 4, 15) = "April 15, 1994"
val test7_3 = date_to_string (2000, 1, 1)  = "January 1, 2000"
val test7_4 = date_to_string (2007, 12, 31) = "December 31, 2007"

val test8_1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test8_2 = number_before_reaching_sum (10, [9, 2, 3, 4, 5]) = 1
val test8_3 = number_before_reaching_sum (20, [10, 5, 4, 1, 2]) = 3
val test8_4 = number_before_reaching_sum (10, [1, 0, 0, 0, 0, 0, 9]) = 6

val test9_1 = what_month 70 = 3
val test9_2 = what_month 1 = 1
val test9_3 = what_month 31 = 1
val test9_4 = what_month 32 = 2
val test9_5 = what_month 365 = 12

val test10_1 = month_range (31, 34) = [1,2,2,2]
val test10_2 = month_range (1, 5) = [1, 1, 1, 1, 1]
val test10_3 = month_range (5, 1) = []
val test10_4 = month_range (334, 335) = [11, 12]

val test11_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11_2 = oldest([]) = NONE
val test11_3 = oldest([(2020, 1, 1), (2019, 1, 1), (2018, 1, 1), (2017, 1, 1), (2016, 1, 1), (2015, 1, 1), (2014, 1, 1), (2013, 1, 1), (2012, 1, 1)]) = SOME (2012, 1, 1)