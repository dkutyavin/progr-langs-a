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

fun get_substitutions2 (substitutions, s) =
    let fun aux (subs, acc) =
            case subs of
                [] => acc
                | hd::tl => case all_except_option (s, hd) of
                    NONE => aux(tl, acc)
                    | SOME ss => aux(tl, acc @ ss)
    in aux(substitutions, [])
    end

fun similar_names (first_names_subs, {first, last, middle}) =
    let
        val first_names = get_substitutions2(first_names_subs, first)
        fun form_full_names first_names = 
            case first_names of 
            [] => []
            | first_name::tl => {first = first_name, last = last, middle = middle} :: form_full_names tl
    in
        {first = first, last = last, middle = middle}::form_full_names first_names
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
fun card_color (suit, rank) =
    case suit of
        Clubs => Black
        | Spades => Black
        | _ => Red

fun card_value (suit, rank) =
    case rank of 
        Ace => 11
        | Num n => n
        | _ => 10

fun remove_card (cards, card : card, e) = 
    case cards of
        [] => raise e
        | h_card::tl => if h_card = card then tl else h_card::remove_card(tl, card, e)
    
fun all_same_color cards =
    case cards of
        [] => true
        | _::[] => true
        | card1::card2::tl => if card_color card1 = card_color card2
                              then all_same_color (card2::tl)
                              else false