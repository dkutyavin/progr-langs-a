(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1_1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test1_2 = only_capitals ["a", "b", "c"] = []
val test1_3 = only_capitals ["A", "b", "C"] = ["A", "C"]
val test1_4 = only_capitals ["Upper", "Case", "And", "This one", "but not this", "one"] = ["Upper", "Case", "And", "This one"]


val test2_1 = longest_string1 ["A","bc","C"] = "bc"
val test2_2 = longest_string1 [] = ""
val test2_3 = longest_string1 ["A", "BC", "CD", "E"] = "BC"
val test2_4 = longest_string1 ["this", "is", "my", "strings", ".", "Which", "is", "longest", "one", "?"] = "strings"

val test3_1 = longest_string2 ["A","bc","C"] = "bc"
val test3_2 = longest_string2 [] = ""
val test3_3 = longest_string2 ["A", "BC", "CD", "E"] = "CD"
val test3_4 = longest_string2 ["this", "is", "my", "strings", ".", "Which", "is", "longest", "one", "?"] = "longest"

val test4a_1 = longest_string3 ["A","bc","C"] = "bc"
val test4a_2 = longest_string3 [] = ""
val test4a_3 = longest_string3 ["A", "BC", "CD", "E"] = "BC"
val test4a_4 = longest_string3 ["this", "is", "my", "strings", ".", "Which", "is", "longest", "one", "?"] = "strings"

val test4b_1 = longest_string4 ["A","B","C"] = "C"
val test4b_2 = longest_string4 [] = ""
val test4b_3 = longest_string4 ["A", "BC", "CD", "E"] = "CD"
val test4b_4 = longest_string4 ["this", "is", "my", "strings", ".", "Which", "is", "longest", "one", "?"] = "longest"

val test5_1 = longest_capitalized ["A","bc","C"] = "A"
val test5_2 = longest_capitalized ["Upper", "Case", "And", "This one", "but not this", "one"] = "This one"
val test5_3 = longest_capitalized [] = ""
val test5_4 = longest_capitalized ["this", "is", "my", "strings", ".", "Which", "is", "longest", "one", "?"] = "Which"
val test5_5 = longest_capitalized ["this", "is", "my", "strings", ".", "which", "is", "longest", "one", "?"] = ""


val test6_1 = rev_string "abc" = "cba"
val test6_2 = rev_string "" = ""
val test6_3 = rev_string "Hello, friends!" = "!sdneirf ,olleH"

val test7_1 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test7_2 = first_answer (fn x => if x < 3 then SOME x else NONE) [1,2,3,4,5] = 1
val test7_3 = first_answer (fn x => if Char.isUpper (String.sub (x, 0)) then SOME x else NONE) ["a", "b", "C", "d"] = "C"
val test7_4 = ((first_answer (fn x => SOME x) []) handle NoAnswer => true) 

val test8_1 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8_2 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [2,3,4,5,6,7]

val tuple_p1 = TupleP [Wildcard, UnitP, ConstP 10, TupleP [Wildcard]]
val tuple_p2 = TupleP [UnitP, ConstP 42, Variable("hello")]
val constructor_p1 = ConstructorP ("hi", tuple_p1)
val constructor_p2 = ConstructorP ("Good morning", tuple_p2)

val test9a_1 = count_wildcards Wildcard = 1
val test9a_2 = count_wildcards UnitP = 0
val test9a_3 = count_wildcards (ConstP 10) = 0
val test9a_4 = count_wildcards tuple_p1 = 2
val test9a_5 = count_wildcards (TupleP [UnitP]) = 0
val test9a_6 = count_wildcards constructor_p1 = 2
val test9a_7 = count_wildcards (ConstructorP ("Good afternoon", ConstP 42)) = 0
val test9a_8 = count_wildcards constructor_p2 = 0

(*val test9b = count_wild_and_variable_lengths (Variable("a")) = 1

val test9c = count_some_var ("x", Variable("x")) = 1

val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME [] *)
