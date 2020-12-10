fun partition nil _ _ = ([], [])
    | partition (x::xs) a c = 
        let val (ls, gt) = partition xs a c
        in case (c x a) of
                LESS => ((x::ls), gt)
                | _ => (ls, (x::gt)) end;

val lenStr = length o String.explode;
fun ltstr str1 str2 = if (lenStr str1) < (lenStr str2)
                        then LESS
                        else if (lenStr str1) = (lenStr str2)
                                then String.compare(str1, str2)
                                else GREATER;

fun qsort nil _ = []
    | qsort (x::xs) c = 
        let val (less, greater) = partition xs x c
        in  (qsort less c) @ [x] @ (qsort greater c) end;
