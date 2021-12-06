-- Teorie 
-- ######################################
-- let
-- - folosit pentru scoping
-- - syntaxa - se tine cont de indentare
cylinder :: (Floating a) => a -> a -> a
cylinder r h = 
    let 
        sideArea = 2 * pi * r * h
        circleArea = pi * r ^ 2 
    in  
        sideArea + circleArea


cylinder' :: (Floating a) => a -> a -> a
cylinder' r h = sideArea + circleArea
    where
        sideArea = 2 * pi * r * h
        circleArea = pi * r ^ 2 

dummy x 
    | x == 0 = acc1
    | x == 1 = acc1
    | otherwise = acc1
    where 
        acc1 = x + 1

-- not related cu laboratorul 
-- nu intra la colocviu
-- fisier.py
-- x = [1,2,3] -> 0001
-- x.append(4) -> 0002
-- limbaje de programare interpretate
-- programe -> intrepretare (rulat linie cu linie)
-- limbaje compilate
-- programe -> compilare (tot programul) => bytecode -> executare
        
    
-- ######################################
-- programe in haskell
-- compile folosind >ghc --make <nume_fisier>
-- sau >ghc -o <nume_exe> <nume_fisier>
-- programele incep cu main
-- main = putStrLn "this is a program"
-- Instructiunile IO sunt "impure", nu sunt pf
-- folosim un do pentru a executa instructiunile "impure"
-- do - mai multe instructiuni IO ()
-- <- transforma bufferul (IO object) de la getLine in string 
-- return transforma IO object in obiecte interne haskell
-- ######################################
-- getLine 
-- putStrLn
-- putStr
-- putChar
-- print - printeaza orice -- este folosita pentru afiseara ghci
-- getContents streams data (IO lazy)
-- interact tot pentru stream
-- Fisiere
-- openFile, hClose
-- readFile, writeFile, appendFile




--------------------------------------------------------------
-- Ex1
divisors n = 1:[x | x<-[2..(n `div` 2)], n `mod` x == 0] ++ [n] 
friends n m = m * nSum == n * mSum
    where 
        nSum = sum . divisors $ n
        mSum = sum . divisors $ m

--------------------------------------------------------------
-- Ex2

type Matrice a = [[a]]

getColumn :: Int -> Matrice a -> [a]
getColumn nth matrice = [row !! nth|row<-matrice]
getRow :: Int -> Matrice a -> [a]
getRow nth matrice = matrice !! nth

zipRow ::  [a] -> [[a]] -> [[a]]
zipRow  yn [] = [[y]|y<-yn]
zipRow  [] xn = xn
zipRow  [y] (x:xn) = [(y:x)]
zipRow  (y:yn) (x:xn) = (y:x) : zipRow yn xn

matrix = [[1,2,3], [4,5,6], [7,8,9]]
transpose::Matrice a -> Matrice a
transpose  = foldr zipRow [] 

-- zipRow([1,2,3], (zipRow [4,5,6], (zipRow [7,8,9] [])))
-- [4,5,6] [[7], [8], [9]]
-- (4:[7]):(5:[8]):(6:[9]) = [[4, 7], [5, 8], [6, 9]]
-- [1,2,3]  [[4, 7], [5, 8], [6, 9]] 
-- (1:[4, 7]):(2:[5, 8]):(3:[6, 9]) = [[1, 4, 7],[2, 5, 8],[3, 6, 9]]
transpose' matrice = [getColumn i matrice|i<-[0..((length (matrice !! 0)) - 1)]]

rests'' [] = [[]]
rests'' lista@(hd:tl) = lista : rests'' tl


--------------------------------------------------------------
-- Ex3
isPrime n = all (\ x -> n `mod` x /= 0) [2..(n `div` 2)]
listPrimes n = [x | x<-[2..(n `div` 2)], n `mod` x == 0, isPrime x]
--------------------------------------------------------------
-- Ex4
rests [] = [[]]
rests l =  l : (rests $ tail l)
-- rests [1,2,3] = [1,2,3] : 
-- (rests [2,3] = [2,3]:
-- (rests [3] = [3]:rests [] = [[]]))
-- [1,2,3]:[2,3]:[3]:[[]] = [[1,2,3], [2,3], [3], []]

rests' l = scanl (\ acc _ -> tail acc) l [1..(length l)]
--------------------------------------------------------------
-- Ex5
i2dl:: (Integral t) => t -> [t]
i2dl 0 = []
i2dl n = (n `mod` 10) : i2dl (n `div` 10)

