(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option (to_remove, strings) = 
    let fun all_except (to_remove, strings) =
        case strings of
            [] => []
          | hd::tl => if same_string (to_remove, hd) then tl else hd::all_except(to_remove, tl)
        val result = all_except (to_remove, strings)
    in if result = strings then NONE else SOME result end

fun get_substitutions1 (substitutions, s) =
    case substitutions of
        [] => []
        | hd::tl => case all_except_option (s, hd) of
            NONE => get_substitutions1 (tl, s)
            | SOME ss => ss @ get_substitutions1 (tl, s)

(* TODO get_substitutions2  *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)