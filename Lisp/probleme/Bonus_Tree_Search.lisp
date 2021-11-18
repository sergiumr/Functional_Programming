;;ne bazam pe faptul ca e arbore binar de cautare
(defun search-tree (el tree)
    (COND
        ((endp tree) nil)
        ((= el (CAR tree)) T)
        ((< el (CAR tree)) (search-tree el (CADR tree)))
        ((> el (CAR tree)) (search-tree el (CADDR tree)))
    )
)

(search-tree 10 '(9 (5 (3 () ()) (7 () (8 () ())))
                    (13 (10 () ()) ())))
(search-tree 6 '(9 (5 (3 () ()) (7 () (8 () ())))
                    (13 (10 () ()) ())))