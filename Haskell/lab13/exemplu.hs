{-
    1. Sa se implementeze o varianta proprie de takeWhile
    folosind (exercitiu pe list)
-}
takeWhile' pred (x:xs) 
    | pred x = x : takeWhile' pred xs
    | otherwise = []

takeWhile'' pred xn = doTake pred xn []
    where 
        doTake prd (x:xs) acc
            | prd x = doTake prd xs (acc ++ [x])
            | otherwise = acc

{-
    2. Sa se implementeze o functie map pentru arbori
    exercitiu cu tipuri:
-}
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Eq, Show)



makeNode el = Node el EmptyTree EmptyTree

mapTree fun EmptyTree = EmptyTree
mapTree fun (Node el l r) = Node (fun el) (mapTree fun l) (mapTree fun r)

insertTree el EmptyTree = makeNode el
insertTree el (Node value left right) 
    | el == value = Node value left right
    | el < value = Node value (insertTree el left) right
    | el > value = Node value left (insertTree el right)
{-
    3. Scrieti o functie ce filtreaza numerele pare si aplica functia (x^2 + 1) 
    pe rezultatele filtrate

-}
simplu lista = map (\x->x^2+1) (filter even lista)
composition lista = map ((+1) . (^2)) (filter even lista)
{-
######################################
20. 
    a)  Creati un tip (data) nou: Matrix. 
        Acest tip are un tip de date:  Matrice2D 
            1.  Matrice2D  are urmatoarele campuri: x11::Float, x12::Float, x21::Float, x22::Float
    b)  Creati o clasa noua: Algebra. Aceasta clasa are urmatoarele metode:
        plus::a->a->a 
        det::a->Float
        Implementati acesta clasa pentru tipul Matrix

    c)  Implementati clasa Eq si Ord pentru tipul Matrix.
        Doua obiecte Matrix sunt egala daca au aceeasi det
-}
data Matrix = Matrix2D {x11::Float, x12::Float, x21::Float, x22::Float} deriving (Show)

class Algebra a where
    pluss :: a->a->a
    det :: a->Float

instance Algebra Matrix where
    det (Matrix2D a b c d) = a * d - b * c
    pluss (Matrix2D a b c d) (Matrix2D x y w z)  = Matrix2D (a+x) (b+y) (c+w) (d+z)

instance Eq Matrix where
    m1 == m2 = (det m1) == (det m2)

instance Ord Matrix where
    m1 < m2 = (det m1) < (det m2)
    m1 <= m2 = (det m1) <= (det m2)

-- Problema 5 ii surpriza
    
    
    




