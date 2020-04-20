datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp

(* for Add and Multiply we compute max_constant several times *)
fun max_constant_ugly e = 
    case e of
       Constant i => i
     | Negate e2 => max_constant_ugly e2
     | Add (e1, e2) => if max_constant_ugly e1 > max_constant_ugly e2
                       then max_constant_ugly e1
                       else max_constant_ugly e2
     | Multiply (e1, e2) => if max_constant_ugly e1 > max_constant_ugly e2
                            then max_constant_ugly e1
                            else max_constant_ugly e2

(* still use the same code twice *)
fun max_constant_bad e = 
    case e of
       Constant i => i
     | Negate e2 => max_constant_bad e2
     | Add (e1, e2) => let val m1 = max_constant_bad e1
                           val m2 = max_constant_bad e2
                       in if m1 > m2 then m1 else m2 end
     | Multiply (e1, e2) => let val m1 = max_constant_bad e1
                                val m2 = max_constant_bad e2
                            in if m1 > m2 then m1 else m2 end

fun max_constant e = 
    let fun max_of_two(e1, e2) = 
        let val m1 = max_constant e1
            val m2 = max_constant e2
        in if m1 > m2 then m1 else m2 end
    in
    case e of
       Constant i => i
     | Negate e2 => max_constant e2
     | Add(e1, e2) => max_of_two(e1, e2)
     | Multiply(e1, e2) => max_of_two(e1, e2)
    end

fun max_constant_built_in e =
    case e of
       Constant i => i
     | Negate e2 => max_constant_built_in e2
     | Add(e1, e2) => Int.max(max_constant_built_in e1, max_constant_built_in e2)
     | Multiply(e1, e2) => Int.max(max_constant_built_in e1, max_constant_built_in e2)