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

val test9b_1 = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b_2 = count_wild_and_variable_lengths tuple_p2 = 5
val test9b_3 = count_wild_and_variable_lengths constructor_p2 = 5
val test9b_4 = count_wild_and_variable_lengths tuple_p1 = 2
val test9b_5 = count_wild_and_variable_lengths (ConstructorP ("sss", TupleP [tuple_p1, constructor_p2])) = 7

val test9c_1 = count_some_var ("x", Variable("x")) = 1
val test9c_2 = count_some_var ("x", tuple_p1) = 0
val test9c_3 = count_some_var ("hi", constructor_p1) = 0
val test9c_4 = count_some_var ("hello", tuple_p2) = 1
val test9c_5 = count_some_var ("hello", ConstructorP ("hello", TupleP [constructor_p2, Variable "hello"])) = 2

val test10_1 = check_pat (Variable("x")) = true
val test10_2 = check_pat constructor_p1 = true
val test10_3 = check_pat (TupleP [constructor_p2]) = true
val test10_4 = check_pat (TupleP [constructor_p2, Variable "hello"]) = false
val test10_5 = check_pat (TupleP [Variable "x", Variable "y", Variable "z", Variable "x", Variable "1"]) = false

val test11_1 = match (Unit, UnitP) = SOME []
val test11_2 = match (Const 1, UnitP) = NONE
val test11_3 = match (Const 1, Wildcard) = SOME []
val test11_4 = match (Const 1, Variable "x") = SOME [("x", Const 1)]
val test11_5 = match (Unit, Variable "y") = SOME [("y", Unit)]
val test11_6 = match (Const 17, ConstP 17) = SOME []
val test11_7 = match (Const 1, ConstP 17) = NONE
val test11_8 = match (Tuple [Const 17, Unit, Unit, Const 5], TupleP [ConstP 17, Wildcard, UnitP, Variable "z"]) = SOME [("z", Const 5)]
val test11_9 = match (Tuple [], TupleP [UnitP]) = NONE
val test11_10 = match (Tuple [Const 1, Const 2, Const 3, Const 4], TupleP [ConstP 1, ConstP 2, ConstP 3, ConstP 5]) = NONE
val test11_11 = match (Constructor ("s", Const 10), ConstructorP ("s", ConstP 10)) = SOME []
val test11_12 = match (Constructor ("a", Const 10), ConstructorP ("b", ConstP 19)) = NONE
val test11_13 = match (Constructor ("a", Const 10), ConstructorP ("a", ConstP 11)) = NONE
val test11_14 = match (Constructor ("tuples", Tuple [Const 1, Const 2, Const 3, Unit]), ConstructorP ("tuples", TupleP [Variable "s1", ConstP 2, Wildcard, Variable "s2"])) = SOME [("s1", Const 1), ("s2", Unit)]


val test12_1 = first_match Unit [ConstP 10, UnitP] = SOME []
val test12_2 = first_match Unit [ConstP 10, TupleP [ConstP 0]] = NONE
val test12_3 = first_match (Const 17) [TupleP [Wildcard], Variable "aaa"] = SOME [("aaa", Const 17)]
