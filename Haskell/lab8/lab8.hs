module Lab8
    ( Shape(..)
    , Vector(..)
    , raza
    ) where
-- Haskell este static type
-- Haskell are type inference
-- ==============================
-- Types = Int (Bounded), Integer (Big Integer), Bool, Float, Double
-- ==============================
-- Type variables
-- head :: [a] -> a, variable ce poate sa primeasca un tip: Functiile ce primesc
-- type varialbe se nume functii polimorfice
-- ==============================
-- Typeclasses
-- Un fel de interfete, dicteaza comportamentul tipurilor
-- Tipeclass Eq - == si /=, tipurile trebuie sa sumporte egalitatea
-- Tipullass Ord - >,<,<=,>= trebuie sa suporte ordonarea
-- Tipullass Show -> tipurile pot fi reprezentate ca si stringuri
-- Tipullass Read -> tipurile pot fi transformate din strungri in alte tipuri
-- Bounded -- reprezinta tipurile ce ai limite
-- minBound :: Int
-- minBound :: Char
{-
    read "8.2" + 6.2 -> 14.4
    read "8.2" -> eroare, nu stie cum sa faca inferenta, mai inainte a facut
    inferenta pe baza operatorului "+"
    read "8.2" :: Float
-}
-- Enum -- tipuri ce pot fi enumerate [1..10, ['a'..'z'], [LT .. GT]
-- Num -- Clasa numerelor
-- Integral -- Clasa numerelor intregi
-- Floating -- Clasa numerelor reale, fromIntegral - transforma un numar intreg
-- intr-un numar real
-- ==============================
-- =============================
-- Create Tipurilor
-- se foloseste data <numele_tipului> = <numele_constructor> <parametrii> | ...
{-
    Circle este un constructor, o functie. restul sunt parametrii
    putem declara functii pe aceste tipuri, averloading/overriding
-}
data Shape = Circle Float Float Float
           | Rectangle Float Float Float Float
           deriving (Show, Eq)


raza (Circle _ _ r) = r
raza (Rectangle _ _ h w) = (h + w) / 2.0

center (Circle x y r) = (x, y)

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)
{-
    nu poate sa fie afisat, interpretorul nu stie inca
    trebuie sa adaugam deriving Show
    data Shape = Circle Float Float Float
    | Rectangle Float Float Float Float deriving (Show)
-}
{-
    syntaxa record
    ii cam urat sa creezi obiecte folosind o sintaxa similara ca si pentru shape

-}
data Person = Person { nume::String
                     , prenume::String
                     , varsta::Int
                     } deriving (Show, Eq)

data Car = Car { numeCar :: String
               } deriving (Show, Eq)
-- Pattern matching la constructor, de ce nu merge?
-- exemplu
mg = Person {nume="person", prenume="altcineva", varsta=54}
age = varsta mg
-- ==============================
-- ==============================
-- Tipuri cu type parameters
-- Ex: head::[a]->a, a este un type parameter
data Vector a = Vect2 a a
              | Vect3 a a a
              deriving (Show)

vPlus :: (Num t) => Vector t -> Vector t -> Vector t
(Vect3 i j k) `vPlus` (Vect3 x y z) = Vect3 (i + x) (y + j) (k + z)
(Vect2 i j) `vPlus` (Vect2 x y) = Vect2 (i + x) (y + j)
(Vect3 i j k) `vPlus` (Vect2 x y) = Vect3 (i + x) (y + j) k
-- Type synonyms
-- type String = [Char]
type IntVector = Vector Int
-- ==============================
-- ==============================
-- Crearea  typeclass
-- TypeClass ii un fel de interfata
-- declararea se face folosind class
-- Ex
class Eqq a where
     egal :: a -> a -> Bool
     nuEgal :: a -> a -> Bool
     egal x y = not (nuEgal x y)
     nuEgal x y = not (egal x y)

data Semafor =  Green | Yellow | Red

instance Eqq Semafor where
     egal Red Red = True
     egal Yellow Yellow = True
     egal Green Green = True
     egal _ _ = False

-- ==============================
-- ==============================
commonFactors n m  = [x | x <- [1..(div (min m n) 2)], n `mod` x == 0, m `mod` x == 0]

data Tree a = EmptyTree
            | Node a (Tree a) (Tree a)
            deriving (Eq)


instance (Show a) => Show (Tree a) where
    show = ppShow 0 where
        printSpace n = [' '| _ <- [1..n]]
        ppShow n EmptyTree = printSpace n ++ "empty\n"
        ppShow n (Node v l r) = printSpace n
                                ++ (show v)
                                ++ "\n"
                                ++ (ppShow (n+4) l)
                                ++ (ppShow (n+4) r)

makeNode el = Node el EmptyTree EmptyTree

insertTree el EmptyTree = makeNode el
insertTree el (Node value left right)
    | el == value = Node value left right
    | el < value = Node value (insertTree el left) right
    | el > value = Node value left (insertTree el right)

-- foldl (\ acc x -> acc + x)
-- foldr (\ x acc -> acc + x)

splitPre el = split el []
    where
        split el acc [] = (acc, [])
        split el acc (x:xn)
          | el < x = (acc, (x:xn))
          | otherwise = split el (acc ++ [x]) xn

list2Tree [] = EmptyTree
list2Tree [el] = Node el EmptyTree EmptyTree
list2Tree (x:xn)
  | (not (null less)) && (not (null greater)) = Node x (list2Tree less) (list2Tree greater)
  | (not (null less)) = Node x (list2Tree less) EmptyTree
  | otherwise = Node x  EmptyTree (list2Tree greater)
    where
        (less, greater) = splitPre x xn


extractMax (Node v _ EmptyTree) = v
extractMax (Node v l r) = extractMax r


deleteNode value EmptyTree = EmptyTree
deleteNode value (Node v l r)
  | value < v = Node v (deleteNode value l) r
  | value > v = Node v l (deleteNode value r)
  | l == EmptyTree = r
  | r == EmptyTree = l
  | otherwise = Node maxx (deleteNode maxx l) r
    where
        maxx = extractMax l

zipTree :: Tree a -> Tree a -> Tree [a]
zipTree EmptyTree  EmptyTree = EmptyTree
zipTree (Node el l r) EmptyTree  = Node [el] (zipTree l EmptyTree) (zipTree r EmptyTree)
zipTree EmptyTree (Node el l r) = Node [el] (zipTree EmptyTree l) (zipTree EmptyTree r)
zipTree  (Node el1 l1 r1) (Node el2 l2 r2) = Node [el1, el2] (zipTree l1 l2) (zipTree r1 r2)

