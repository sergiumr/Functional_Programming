-- debugging in haskell
-- facem debug din ghci
-- debuggerul ii la fel ca si in cazul celoralte limbaje
-- :break <line-number> <=> face break la linia specificata de noi
-- :print <nume-variabila> <=> printeaza fara sa evalueze
-- :force <nume-variabila> <=> forteaza evaluarea variabilei
-- <nume-variabila> <=> evalueaza variabila
-- :list <=> afiseaza linia curenta
-- seq <nu  e-variabila> ()
-- :continue <=> continua pana la urmatorul break
-- ####################
-- Modalitati de setare a break
-- :break <nume-functie-din-modulul-incarcat>
-- :break <linie>
-- :break <linie> <coloana>
-- :break <modul> <linie>
-- :break <modul> <linie> <coloana>
-- ####################
-- :show breaks <=> afiseaza toate break-urile
-- :show bindings <=> afiseaza toate variabilele
-- :delete <break-number> <=> delete la un breakpoint
-- :step <nume-functie> <=> intra in functie
-- :set stop :list <=> printeaza locatia(liniile care se afla in scope) debuggerului la fiecare break
-- :abandon <=> parasim debug mode


qsort [] = []
qsort (a:as) = qsort left ++ [a] ++ qsort right
    where (left, right) = (filter (<=a) as, filter (>a) as)

main = print (qsort [8,4,0,3,1,23,11,18])

-- Ex1 -- Implemetati o varianta de
-- map',
map' _ [] = []
map' fn (x:xn) = (fn x) : map' fn xn
map'' fn ls = [fn x|x<-ls]
-- foldl',
foldl' fn acc [] = acc
foldl' fn acc (x:xn) = foldl' fn (fn acc x) xn
-- firstN,
-- backwards
firstN 0 _ = []
firstN _ [] = []
firstN n (x:xn) = x : firstN (n-1) xn
-- firstN 2 [1,2,3] = 1:firstN 1 [2,3] -- 1:2:[]
-- firstN 1 [2,3] = 2:firstN 0 [3] -- 2:[]
-- firstN 0 [3] = []
--forwards
firstN' 0 _ acc = acc
firstN' _ [] acc = acc
firstN' n (x:xn) acc = firstN' (n-1) xn (acc ++ [x])
-- firstN' 2 [1,2,3] [] = firstN' (2-1) [2,3] ([] ++ [1])
-- firstN' 1 [2,3] [1]  = firstN' (1-1) [3] ([1] ++ [2])
-- firstN' 0 [3] [1,2]  = [1,2]
-- nextN
nextN 0 ls = ls
nextN _ [] = []
nextN n (_:xn) = nextN (n-1) xn
------------------------------------------
-- Ex2 a -- Implemetati o functie ce aduna doua numere reprezentate ca si liste
-- [1,2,3] `plus'` [2,3] = [1, 2 + 2, 3 + 3] = 146
suma [] [] carry = [carry]
suma (x:xn) [] carry = (summ `mod` 10) : suma xn [] (summ `div` 10)
    where summ = x + carry
suma [] (y:yn) carry = (summ `mod` 10) : suma [] yn (summ `div` 10)
    where summ = y + carry
suma (x:xn) (y:yn) carry = (summ `mod` 10) : suma xn yn (summ `div` 10)
    where summ = x + y + carry
-- suma [] [] 1 = [1]
-- suma [] (9:yn) 1 = 0: suma xn yn 1
-- suma (6:xn) (7:yn) 0 = 3: suma xn yn 1
sumaList xn yn = reverse $ suma (reverse xn)  (reverse yn) 0
-- func $ x = func (x)
-- Ex2 b -- interclasarea a 2 liste sortate, extindeti la 3 liste, la n liste?
interclasare xl [] = xl
interclasare [] yl = yl
interclasare xl@(x:xn) yl@(y:yn)
    | x < y = x : interclasare xn yl
    | otherwise = y : interclasare xl yn
interclasare3 xl yl zl = interclasare (interclasare xl yl) zl
interclasareN:: Ord a => [[a]] -> [a]
interclasareN = foldl1 interclasare
-- Ex2 c -- Eliminarea duplicatelor
elimDups [] acc = acc
elimDups (x:xn) acc = if x `elem` acc
                        then elimDups xn acc
                        else elimDups xn (acc ++ [x])


------------------------------------------
-- Exectitii tema - (puncte bonus, daca vreti) Ex3 a -- Verificati daca un string este substring la un al string
-- Exectitii tema - (puncte bonus, daca vreti) Ex3 b -- Verificati daca sir de paranteze este corect
-- Exectitii tema - (puncte bonus, daca vreti) ()() = corect, ()) - incorect
-- Exectitii tema - (puncte bonus, daca vreti) Ex3 c -- implemtarea grouby pe liste de asociatii
------------------------------------------
-- Seturi
-- operatii pe seturi folosind arbori binari de cautare
-- (uniune, intersectie, diferenta, sortare)


