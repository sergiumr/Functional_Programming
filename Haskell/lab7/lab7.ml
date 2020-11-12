(*
    Higher order functions
    fun applyItTwice foo x = foo (foo x);

*)
(*
    lambda functions (fn <va_name> => <body>)
    functii anonime
*)
(*
    map - foarte cunoscuta
    fun mult x = x * 2;
    map mult [1,2,3];
    mapeaza x * 2 pe fiecare element din lista;
*)
(*
    foldl - la fel ca si in haskell 
    foldl f acc [1, 2, 3] -> f(f(f acc 1) 2) 3

    foldr - la fel ca si in haskell 
    foldr f acc [1, 2, 3] -> f(1 (f 2 (f 3 acc)))
    fun flatten xn = foldl (op @) nil xn;
*)
(*
    filter predicat lista
    List.filter predicat lista;
    List.filter (fn x => x > 10) [10, 11, 20, 2];
*)
(*
    function composition: la fel fa si in haskell
    f o g x = f (g x)
    val oddSq = List.filter (fn x=> (x mod 2 = 1)) o map (fn x=>x*x)
*)
