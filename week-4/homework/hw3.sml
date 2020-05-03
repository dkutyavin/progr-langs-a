(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)
val only_capitals = List.filter (fn s => Char.isUpper (String.sub (s, 0)))

val longest_string1 = foldl (fn (s, acc) => if String.size s > String.size acc 
                                            then s
                                            else acc)
                      ""

val longest_string2 = foldl (fn (s, acc) => if String.size s >= String.size acc 
                                            then s
                                            else acc)
                      ""

fun longest_string_helper f = foldl (fn (it, acc) => if f(String.size(it), String.size(acc))
                                                     then it
                                                     else acc)
                                    ""

val longest_string3 = longest_string_helper (fn (x, y) => x > y)
val longest_string4 = longest_string_helper (fn (x, y) => x >= y)

val longest_capitalized = longest_string1 o only_capitals

val rev_string = String.implode o List.rev o String.explode

fun first_answer f xs = case xs of
        [] => raise NoAnswer
        | hd::tl => case f hd of
                        SOME x => x
                        | NONE => first_answer f tl

fun all_answers f xs = 
    let fun aux xs acc =
        case xs of
            [] => acc
            | hd::tl => (case f hd of
                SOME l => aux tl (acc @ l)
                | NONE => [])
        val result = aux xs []
    in if result = [] then NONE else SOME result end

val count_wildcards = g (fn _ => 1) (fn _ => 0)

val count_wild_and_variable_lengths = g (fn _ => 1) (fn s => String.size s)

fun count_some_var (x, p) = g (fn _ => 0) (fn s => if s = x then 1 else 0) p