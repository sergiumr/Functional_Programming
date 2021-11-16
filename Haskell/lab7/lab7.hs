module Lab7
    ( flatten
    , palindromeL
    , palindromeS
    , palindromeL'
    , decimate ,enumerate
    , decimate'
    , decimate''
    , exp'
    , softmax
    , softmax'
    , softmax''
    , bf
    , df
    , softex''
    , graph
    , foldr'
    , foldl'
    ) where

{-
 Higher order functions
 applyTwice f x = f (f x)
 applyTwice (++ " ceva ") "alt"
 applyTwice (" ceva " ++) "alt"
 ##############################
-}
{-
    functii ce primesc functii ca si parametru sau returneaza functii
    de data trecuta: map - foarte folosita

map
filter
reduce
takeWhile
dropWhile
zipWith

foldl
foldr

-}
{-
    zip - alipeste doua liste
    unzip - dezlipeste o lista in doua
    zipWith - aplica o functie pe fiecare alipire
    Ex: zipWith (*) [1,2,3] [4,5,6] ->
    [(*) 1 4, (*) 2 5, (*) 3 6] - >
    [4, 10, 18]
-}
{-
    filter - filtreaza pe baza unui predicat
    filter odd [1, 2, 3, 4] -> [1,3]
-}
{-
    takeWile -> itereaza o lista pana in momentul in care predicatul se eval la False
    takeWhile (<10) [1..]
-}
{-
    lambda functions - anonymous functions
    \x -> <body>
    simbolul "\" seamana cu lambda
    functii ce sunt folosite doar o data
    Ex:
    zipWith (\x y -> x^2 + y^2) [1,2,3] [4,5,6]
    map (\x -> x^2) [1,2,3,4]
-}
{-
    Folds (functii de tipul reduce)
    foldl f acc [1, 2, 3] -> f(f(f acc 1) 2) 3
    foldr f acc [1, 2, 3] -> f(1 (f 2 (f 3 acc)))

    foldl1 f [1, 2, 3] -> f (f 1 2) 3
    foldr1 f [1, 2, 3] -> f 1 (f 2 3)
    foldr (*) 1 [1..3]
    Exemplu asociativitate folds:
    foldr:: (* 1 (* 2 (* 3 1)))
    foldl:: (* (* (* 1 1) 2) 3)
    [1 2 6]
    [6 6 3]

-}

{-
    scanl f 0 [1,2,3] -> [0, (f 0 1), (f(f 1 0) 2), (f(f(f 1 0) 2) 3)]
    scanr - comportament similar
-}
{-
    $
    f $ x = f x
    not wow
-}

{-
    function composition
    f . g = \x -> f (g x)
    Ex:
    exComp xn = filter odd (map ^2 xn)
    exComp' xn = filter odd . map (^2) xn -> erroare
    : (.) cere functii in ambele partii,
    map (^2) este functie,
    dar map (^2) xn nu este
    exComp' xn = (filter odd . map (^2)) xn
    aici ne putem ajuta de $ (aplicatorul de functii)
    exCompFmx' xn = filter odd . map (^2) $ xn (ii un fel de delimitator)
-}
{-
    pointless
    exComp' xn = (filter odd . map (^2)) xn
    exComp'' = filter odd . map (^2)
-}

{-
    alias @
    xnm@(x:xn)=[1,2,3,4,5]
    xnm =[1,2,3,4,5]
    xn=[2,3,4,5]
    x = 1

-}


flatten :: [[a]] -> [a]
flatten = foldl (++) []


palindromeL :: [String] -> Bool
palindromeL xn = palindromeS str
    where str = flatten xn


palindromeS :: String -> Bool
palindromeS [] = True
palindromeS (_:[]) = True
palindromeS (x:y:xn)
    | x == ' ' = palindromeS (y:xn)
    | last xn == ' ' = palindromeS (x:y:(init xn))
    | otherwise = if (x == last xn) then  palindromeS (y:(init xn)) else False


palindromeL' :: [[Char]] -> Bool
palindromeL'= palindromeS . flatten


decimate :: [a] -> Int -> [a]
decimate [] _ = []
decimate (_ : xn) 1 = xn
decimate (x : xn) n = x:decimate xn (n-1)


enumerate:: (Eq t, Num t) => [a] -> [(a, t)]
enumerate xn = enum xn 1
    where enum [] _ = []
          enum (x : xs) n = (x, n) : enum xs (n + 1)


decimate':: (Eq t, Num t) => t -> [b] -> [b]
decimate' n = map (\(x, _) -> x) . filter (\(_, y)->y/=n) . enumerate


decimate'' :: Int -> [a] -> [a]
decimate'' n xn = [x | (x,y)<-(enumerate xn), y/=n]


exp' :: [Double] -> [Double]
exp' = map (exp)


softmax :: [Double] -> [Double]
softmax xn = [x / exsposSum | x<-expos]
    where
        expos = exp' xn
        exsposSum = sum expos


softmax' :: Floating a => [a] -> [a]
softmax' xn = map ((/ exsposSum) . exp)  xn
    where exsposSum = sum (map (exp) xn)


softex'' :: Floating a => a -> [a] -> [(a, a)]
softex'' _ [] = []
softex'' acc (x:[])  = [(expx / accuf, accuf)]
    where
        expx = exp x
        accuf = acc + expx

softex'' acc (x:xn)  =  (expx / accum, accum):yl
    where
        expx = exp x
        yl@((_, accum) : _) = softex'' (acc + expx) xn


softmax'' :: [Double] -> [Double]
softmax'' = map (\(x, _) -> x) . softex'' 0

graph :: [(Char, Char)]
graph=[ ('a', 'b')
      , ('a', 'c')
      , ('a', 'd')
      , ('b', 'e')
      , ('c', 'f')
      , ('d', 'e')
      , ('e', 'f')
      , ('e', 'g')]


bf :: Eq a => [a] -> [(a, a)] -> [a] -> [a]
bf [] _ vis = vis
bf (x:xn) dag vis
    | x `elem` vis = bf xn dag vis
    | otherwise = bf (xn ++ [y | (z, y) <- dag, z == x]) dag (vis ++ [x])


df :: Eq a => [a] -> [(a, a)] -> [a] -> [a]
df [] _ vis = vis
df (x:xn) dag vis
    | x `elem` vis = df xn dag vis
    | otherwise = df ([y | (z,y)<-dag,z==x]++xn) dag (vis++[x])


foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ initial [] = initial
foldr' fun initial (x : xn) = fun x $ foldr fun initial xn


foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ initial [] = initial
foldl' fun initial (x : xn) = foldl fun (fun initial x) xn

