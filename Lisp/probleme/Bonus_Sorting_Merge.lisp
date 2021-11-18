;;functie ce imi returneaza primele n elemente dintr-o lista sub forma unei liste
(DEFUN first-n-items (n lista)
    (IF (<= n 1) (LIST (CAR lista))
                (CONS (CAR lista) (first-n-items (1- n) (CDR lista)))
    )
)

(first-n-items 3 '(1 2 3 4 5 6))
;;functia ce imi returneaza o lista cu elementele dupa pozitia n
(DEFUN second-n-items (n lista)
    (IF (= n 0) lista
                (second-n-items (1- n) (CDR lista))
    )
)

(second-n-items 3 '(1 2 3 4 5 6))

;;functie ce combina 2 liste intre ele, creand una sortata
(DEFUN merge-lists (lista1 lista2)
    (IF (= 0 (length lista1)) lista2
        (IF (= 0 (length lista2)) lista1
            (IF (< (CAR lista1) (CAR lista2)) 
                    (CONS (CAR lista1) (merge-lists (CDR lista1) lista2))
                (CONS (CAR lista2) (merge-lists lista1 (CDR lista2)))
            )
        )
    )
)

(merge-lists '(1 2 3) '(4 5 6))

(DEFUN merge-sort (lista)
    (IF (<= (length lista) 1) lista
        (merge-lists 
            (merge-sort (first-n-items (floor (/ (+ (length lista) 1) 2)) lista))
            (merge-sort (second-n-items (floor (/ (+ (length lista) 1) 2)) lista)))
    )
)


(merge-sort '(7 1 4 5 2 3 6))