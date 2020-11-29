(*
    type synonim
    la fel ca si in haskell

*)
type vector = real * real;
(*
   definirea tipurilor in ML 
   se foloseste datatype
*)
datatype 'a tree = Empty | Node of 'a * 'a  tree * 'a tree;

fun insertTree value Empty = Node (value, Empty, Empty)
    |insertTree value (Node (v, l, r)) = case Int.compare(value, v) of
                                            EQUAL => Node (v, l, r)
                                            | LESS => Node (v, (insertTree value l), r)
                                            | GREATER => Node (v, l, (insertTree value r))

fun preordine Empty = []
    |preordine (Node (v, l, r)) = (v::(preordine l))@(preordine r)
