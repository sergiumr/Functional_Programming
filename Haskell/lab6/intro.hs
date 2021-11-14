-- comment
{-

-}
-- functii
doubleMe x = x + x
-- numere cu minus (-2)
-- operatori prefix
prefixDiv x y = div x y
-- operatori prefix
infixDiv x y =  x `div` y
-- * este infix
infixT x y = x * y
-- (*) este prefix
prefixT x y = (*) x y
-- if statement -- avem nevoie de if si de else, un statement returneaza ceva
deleteSmaller x = if x > 50 then x else 2 * x
-- liste [1, 2, 3....]
lista1 = [1, 2, 3, 4, 5]
lista2 = [1, 2, 3, 4, 5]
-- concatenarea prin ++
listaCon = lista1 ++ lista2
-- listele au head si tail, car si cdr
-- head lista1 --> 1
-- head lista1 --> [2, 3, 4, 5]
--avem si o functie cons
--1:[2, 3, 4, 5] -> [1, 2, 3, 4, 5]
-- : diferite de ++
-- operator at !!
-- lista1 !! 1 -> 2
-- init lista1 -> [1, 2, 3, 4]
-- last lista1 -> 5
-- length lista1 -> 5
-- reverse lista1 -> [5, 4, 3, 2, 1]
-- take
st3 = take 3 lista1
-- drop
from3 = drop 3 lista1
-- sum, product, elem
-- #########################################3
-- Ceva chestii faine
-- Texas ranges
-- [1..5] -> [1, 2, 3, 4, 5]
-- merge si pe caractere
-- ii specifica si cum sa itereze
-- [0,2..10] -> [0, 2, 4, 6, 8, 10]
-- in reverse [5,4..1] -> [5, 4, 3, 2, 1]
-- Haskell ii lazy, putem sa generam ceva infinit
ciclu = cycle [1, 2, 3]
infinit = repeat 2
ones = 1 : ones
fourOnes = take 4 ones
-- #########################################
-- List comprehension
dublu xn = [x * 2 | x <- xn]
-- produs cartezian
cart xn yn = [(x, y) | x <- xn, y <- yn]
-- listele pot contine doar un singur tip
-- tuplelele pot contine tipuri diferite
-- Lista si Tupla
-- Lista poate sa contina doar elemennte de acelasi l
-- [1, "a"] -> eroare
-- (1, "a") -> easy game
-- fst -> first, snd -> second
-- #########################################
-- Higher order functions
-- map
mappedA = map ((+) 1) [1,2,3]
-- #########################################
-- Pattern matching
-- functia este apelata in functie de pattern
fiboRec :: (Integral a) => a -> a
fiboRec 1 = 0
fiboRec 2 = 1
fiboRec n = fiboRec (n - 1) + fiboRec (n - 2)

-- fiboRec 3 = 1 + 0
-- fuvoRec 2 = 1
-- fuvoRec 1 = 0

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:nx) = reverse' (nx) ++ [x]

-- guards
isWow x
    | x + x == 2 = "Is ONE"
    | x + x == 4 = "Is TWO"
    | x + x == 6 = "Is THREE"
    | otherwise  = "Yeah"

isWowWhere x
    | dbl == 2 = "Is ONE"
    | dbl == 4 = "Is TWO"
    | dbl == 6 = "Is THREE"
    | otherwise  = "Yeah"
    where dbl = x + x


--case
isWowCase x = case x of
        1 -> "Is ONE"
        2 -> "Is TWO"
        3 -> "Is THREE"
        otherwise -> "DA"


-- Operatori
infix 6 !&
a !& b = not (a && b)

infix 6 !|
a !| b = not ((not a && b) || (a && not b))
-- lambda expr
lmbda x = \x -> x + 1



sudan :: Int -> Int -> Int -> Int
sudan 0 x y  = x + y
sudan n x 0  = x
sudan n x y  = sudan (n-1)  (sudan n x (y-1)) (y + (sudan n x (y-1)))


sudag :: Int -> Int -> Int -> Int
sudag n x y
    | n == 0 = x + y
    | y == 0 = x
    | otherwise  = sudag (n-1) (sudag n x (y - 1)) (y + (sudag n x (y-1)))

sudac :: Int -> Int -> Int -> Int
sudac n x y = case n of
        0 -> x + y
        otherwise -> case y of
                        0 -> x
                        otherwise -> sudac (n-1) (sudac n x (y-1)) (y + (sudac n x (y-1)))

firstNmone (x:[]) = []
firstNmone (x:xn) = x : firstNmone xn

firstGmone (x:xn)
    | null xn = []
    | otherwise = x : firstGmone xn

firstCmone (x:xn) = case xn of
    [] -> []
    otherwise -> x : firstCmone xn

rev [] = []
rev (x:xn) = rev xn ++ [x]
checkPalin xn = xn == rev xn

palin2 [] = True
palin2 (x:[]) = True
palin2 (x:xn) = (x == last xn) && palin2 (init xn)

-- pali2 [1,2,3,2,1] = (1==1) && palin [2,3,2]
-- pali2 [2,3,2] = (1==1) && palin [3]

palinComp xn = all (==True) [x==y | (x,y) <- zip xn (reverse xn)]
--

