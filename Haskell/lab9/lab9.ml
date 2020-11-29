(*
--------------------------------------------------------------
-- Ex1
*)
fun sum lista = foldl (op +) 0 lista;
fun  generate i n = if (n - i) < 0 
                    then []
                    else 
                        if (n - i) = 0
                        then [n] 
                        else i::generate (i+1) n;
fun divisors n = 1 :: List.filter 
                                (fn x => n mod x = 0) 
                                (generate 2 (n div 2)) @ [n]
fun friends n m =
    let val sumDiv = sum o divisors
        val nSum = sumDiv n * m
        val mSum = sumDiv m * n
    in nSum = mSum end;
(*
--------------------------------------------------------------
-- Ex3
*)
fun all _ nil = true
    |all func (x::xn) = if not (func x) 
                        then false 
                        else all func xn;
fun isPrime n = all (fn x => n mod x <> 0) (generate 2 (n div 2));
fun isDivizor n x = n mod x = 0;
fun listPrimes n = List.filter 
                            (fn x => n mod x = 0 andalso isPrime x) 
                            (generate 2 (n div 2));

(*
--------------------------------------------------------------
-- Ex4
*)
fun rests nil = [[]] 
    | rests xn = xn::rests (tl xn);

