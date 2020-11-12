-- Higher order functions
-- applyTwice f x = f (f x)
-- applyTwice (++ " ceva ") "alt"
-- applyTwice (" ceva " ++) "alt"
-- ############################## 
{-
    functii ce primesc functii ca si parametru sau returneaza functii
    de data trecuta: map - foarte folosita
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
    \ x -> <body>
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

-}
{-
    scanl f 0 [1,2,3] -> [0, (f 0 1), (f(f 1 0) 2), (f(f(f 1 0) 2) 3)]
    scanr - comportament similar
-}
{-
    $ - ii cam ciudat (sensul bun)
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


flatten::[[a]] -> [a]
flatten = foldl (++) []

palindromeL xn = palindromeS str
    where str=flatten xn
        
palindromeS [] = True
palindromeS (x:[]) = True
palindromeS (x:y:xn)  
    | x == ' ' = palindromeS (y:xn)
    | last xn == ' ' = palindromeS (x:y:(init xn))
    | otherwise = if (x == last xn) then  palindromeS (y:(init xn)) else False

palindromeL'::[[Char]] -> Bool
palindromeL'= palindromeS . flatten


decimate::[a]->Int->[a]
decimate (x:xn) 1 = xn
decimate (x:xn) n = x:decimate xn (n-1)

enumerate:: (Eq t, Num t) => [a] -> [(a, t)]
enumerate xn = enum xn 1
    where enum [] _ = []
          enum (x:xn) n = (x, n):enum xn (n + 1)

decimate':: (Eq t, Num t) => t -> [b] -> [b]
decimate' n = map (\(x,y)->x) . filter (\(x,y)->y/=n) . enumerate

decimate'' n xn = [x|(x,y)<-(enumerate xn), y/=n]



exp'::[Double]->[Double]
exp' = map (exp) 


softmax::[Double]->[Double]
softmax xn = [x/exsposSum|x<-expos] 
    where
        expos = exp' xn
        exsposSum = sum expos


softmax' xn = map ((/ exsposSum) . exp)  xn
    where exsposSum = sum (map (exp) xn)

softex'' acc (x:[])  = [(expx / accuf, accuf)]
    where 
        expx = exp x
        accuf = acc + expx

softex'' acc (x:xn)  =  (expx / accum, accum):yl
    where
        expx = exp x
        yl@((y, accum):yn) = softex'' (acc + expx) xn 

softmax'' = map (\(x,y)->x) . softex'' 0

dag=[('a', 'b'),
    ('a', 'c'),
    ('a', 'd'),
    ('b', 'e'),
    ('c', 'f'),
    ('d', 'e'),
    ('e', 'f'),
    ('e', 'g')]

bf [] _ vis = vis
bf (x:xn) dag vis
    | x `elem` vis = bf xn dag vis
    | otherwise = bf (xn++[y|(z,y)<-dag,z==x]) dag (vis++[x])

df [] _ vis = vis
df (x:xn) dag vis
    | x `elem` vis = df xn dag vis
    | otherwise = df ([y|(z,y)<-dag,z==x]++xn) dag (vis++[x])

