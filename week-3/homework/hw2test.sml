(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1_1 = all_except_option ("string", ["string"]) = SOME []
val test1_2 = all_except_option ("string", []) = NONE
val test1_3 = all_except_option ("this one", ["not this", "and not this", "and", "not", "this", "but", "this one"]) = SOME ["not this", "and not this", "and", "not", "this", "but"]
val test1_4 = all_except_option ("empty", ["there", "is", "no", "such", "string"]) = NONE

val test2_1 = get_substitutions1 ([["foo"],["there"]], "foo") = []
val test2_2 = get_substitutions1 ([["Fred", "Fredrick"], ["Elizabeth", "Bethy"], ["Freddie", "Fred", "F"]], "Fred") = ["Fredrick", "Freddie", "F"]
val test2_3 = get_substitutions1 ([["Fred", "Fredrick"], ["Elizabeth", "Bethy"], ["Freddie", "Fred", "F"]], "Elizabeth") = ["Bethy"]
val test2_4 = get_substitutions1 ([["Fred", "Fredrick"], ["Elizabeth", "Bethy"], ["Freddie", "Fred", "F"]], "Robert") = []
val test2_5 = get_substitutions1 ([["Fred"," Fredrick"], ["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]], "Jeff") = ["Jeffrey", "Geoff", "Jeffrey"]

val test3_1 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val test3_2 = get_substitutions2 ([["Fred", "Fredrick"], ["Elizabeth", "Bethy"], ["Freddie", "Fred", "F"]], "Fred") = ["Fredrick", "Freddie", "F"]
val test3_3 = get_substitutions2 ([["Fred", "Fredrick"], ["Elizabeth", "Bethy"], ["Freddie", "Fred", "F"]], "Elizabeth") = ["Bethy"]
val test3_4 = get_substitutions2 ([["Fred", "Fredrick"], ["Elizabeth", "Bethy"], ["Freddie", "Fred", "F"]], "Robert") = []
val test3_5 = get_substitutions2 ([["Fred"," Fredrick"], ["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]], "Jeff") = ["Jeffrey", "Geoff", "Jeffrey"]


val test4_1 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val test4_2 = similar_names ([], {first="Fred", middle="W", last="Smith"}) = [{first="Fred", middle="W", last="Smith"}]

val test5_1 = card_color (Clubs, Num 2) = Black
val test5_2 = card_color (Diamonds, Jack) = Red
val test5_3 = card_color (Hearts, Queen) = Red
val test5_4 = card_color (Spades, Ace) = Black

val test6_1 = card_value (Clubs, Num 2) = 2
val test6_2 = card_value (Clubs, Num 10) = 10
val test6_3 = card_value (Spades, Ace) = 11
val test6_4 = card_value (Hearts, Queen) = 10
val test6_5 = card_value (Hearts, Jack) = 10
val test6_6 = card_value (Hearts, King) = 10


(*val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true

val test9 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4

val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true) *)