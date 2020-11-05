(*
block comment (**)
function definition folosind fun
fun double(x, y) = 2 * (x + y);
minus este ~
instructiunile se termina cu ";"
^ string concat
*)
(*
listele [1,2,3 ...]
*)
val lista1 = [1,2,3,4]
val lista2 = [5,7,9,9]
(*
types 
    list = chestii care au acelasi tip, [1,2,3]: int list
    tuple chestii care au tipuri diferite, (1, "a"): int * string
*)
(*
records, cum extrag elementele
{}
*)
(*

Aceasi chestie: head::tail <=> (car|cdr)
1::[2,3] -> [1,2,3]
[1]@[2,3] -> [1,2,3]
pattern matching
(a, b) = (1, 2)

*)

(*
chestii pe liste
hd - head
tl - tail
rev -reverse
*)
(*
Higher order functions
*)
val lmbda = (fn x => x + 1);
val mappedList = map lmbda [1,2,3];
(*
pattern matching
*)
fun factorial 0 = 1
    | factorial n = n * factorial(n-1);
(*
case 
*)
fun factorialCase x = 
    case x of
        0 => 1
    |   x => x * factorialCase(x - 1)

infix 6 nand;
fun x nand y = not (x andalso y);

infix 6 nxor;
fun x nxor y = not ((not x andalso y) orelse (x andalso not y));
(*
higher order funcitons
map
*)
val someVal = map (fn x => x + 1) lista1;
(*
exercitii
*)
fun sudap (0, x, y) = x + y 
    | sudap (n, x, 0) = x
    | sudap (n, x, y) = sudap(n-1, sudap(n, x, y-1), y + sudap(n, x, y-1));
    


fun sudan (n, x, y) = case n of
                        0 => x + y
                        | n => case y of
                                    0 => x
                                    | y => sudan(n-1, sudan(n, x, y-1), y + sudan(n, x, y-1));
                                    
    
