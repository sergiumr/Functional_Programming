-- Ex2
partition :: Ord a => [a] -> a -> (a -> a -> Ordering) -> ([a], [a])
partition [] _ _ = ([], [])
partition (x:xn) a c = 
    case (c x a) of 
        LT  ->  ((x:less), greater)
        otherwise -> (less, (x:greater))
    where
        (less, greater) = partition xn a c

ltstr str1 str2 
    | (length str1) < (length str2) = LT
    | (length str1) == (length str2) = if str1 < str2 then LT else GT
    | otherwise = GT 
qsort :: (Ord a, Show a) => [a] -> (a -> a -> Ordering) -> [a]
qsort [] _ = []
qsort (x:xn) c = (qsort less c) ++ [x] ++ (qsort greater c)
    where
        (less, greater) = partition xn x c

partition' [] _ _ = ([], [])
partition' (x:xn) pv criteria  
    | (criteria x pv) = ((x:less), greater)
    | otherwise = (less, (x:greater))
    where
        (less, greater) = partition' xn pv criteria

ltstr' str1 str2 = (length str1) < (length str2) || (length str1) == (length str2) && str1 < str2 

qsort' [] _ = []
qsort' (x:xn) c = (qsort' less c) ++ [x] ++ (qsort' greater c)
    where
        (less, greater) = partition' xn x c
-- Ex3

leapYears = [x| x<-[1584,1588..], isLeap x]
    where
        isLeap x = if (x `mod` 100 == 0) && (x `mod` 400 /= 0) then False else True 

leapYears' = filter isLeap [1584,1588..] 
    where
        isLeap x = if (x `mod` 100 == 0) && (x `mod` 400 /= 0) then False else True 

leapYears'' = leap 1584
    where
        addLeap x = if (x `mod` 100 == 0) && (x `mod` 400 /= 0) then x + 4 else x 
        leap x = x: leap (addLeap (x + 4))
-- Ex4 
sv (p:ns) = p : sv [ n | n <- ns, n `mod` p > 0]
primes = sv [2..]

-- sv (2:_th1) = 2 : sv _th1@(3:[ n | n <- [4..], n `mod` 2 > 0])
-- sv (3: ns@[ n | n <- [4..], n `mod` 2 > 0]) = 3 : sv (5:[ n | n <- [6..], n `mod` 3 > 0])
-- sv (5: ns@[ n | n <- [6..], n `mod` 3 > 0]) = 5 : sv (7:[ n | n <- [8..], n `mod` 5 > 0])

-- sv = filter (\x = x `mod` 5 > 0) (filter (\x = x `mod` 3 > 0) (filter (\x = x `mod` 2 > 0) [3..])

allFactorials = 1 : fact'
    where
        fact = [2..]
        fact' = 1: fact''
        fact'' = zipWith (*) fact fact'

--  

allFactorials' = 1 : 1 : 2 : zipWith (*) [3..] (tail (tail allFactorials'))

allFactorials'' = 1 : zipWith (*) [1..] allFactorials''
-- 1 : zipWith (*) [1..] allFactorials'' <->  (1: _)
-- 1 : 1 * 1 : zipWith (*) [2..] allFactorials'' <->  (1: _)
-- 1 : 1 * 1 : 2 * 1 : zipWith (*) [3..] allFactorials'' <->  (2 * 1: _)
-- 1 : 1 : 2 * 1 : 3 * 2 : zipWith (*) [4..] allFactorials'' <->  (3 * 2: _)


-- Ex5
sudan :: Int -> Int -> Int -> Int
sudan 0 x y  = x + y
sudan n x 0  = x 
sudan n x y  = sudan (n-1)  (sudan n x (y-1)) (y + (sudan n x (y-1)))

matrixSudan n = [(m, x, y, sudan m x y)|
                m <- [0..n],
                x <- [0..n],
                y <- [0..n]]
firstFloorSudan n = take ((n + 1) * (n + 1)) (matrixSudan n)
secondFloorSudan n = take sq  $ drop  sq (matrixSudan n)
    where
        sq = ((n + 1) * (n + 1))

-- Ex6
std [x] acc n = ((x - mn) ^ 2, mn)
    where
        mn = (acc + x) / (n + 1)
std (x:xs) acc n = (sm + norm, mn)
    where
        (sm, mn) = std xs (acc + x) (n + 1)
        norm = (x - mn) ^ 2
stdDev xs = sqrt $ sm / (fromIntegral (length xs))
    where
        (sm, mn) = std xs 0 0
