datatype suit = Club | Diamond | Heart | Spade

datatype rank = Jack | Queen | King | Ace | Num of int

type card = suit * rank

type name_record = { student_name : int option,
                     first        : string,
                     middle       : string option,
                     last         : string }

fun is_Queen_of_Spades (c : card) =
    #1 c = Spade andalso #2 c = Queen