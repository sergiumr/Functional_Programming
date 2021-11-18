;; am plecat de la faptul ca fiecare linie din fisier contine numai cate un numar
(with-open-file (in "input-file.lisp")
    (WHEN in
        (LET* ((tree '())) 
        (LOOP
            for line = (read-line in NIL)
                while line do
                        (SETQ tree
                            (insert-tree tree (parse-integer line)))
            )
            (print tree) 
        )
    )
)

(defun insert-tree (tree el)
    (COND
        ((endp tree) `(, el () ()))
        ((= el (CAR tree)) tree)
        ((< el (CAR tree)) `(,(CAR tree), (insert-tree (CADR tree) el),
                                          (CADDR tree)))
        ((> el (CAR tree)) `(, (CAR tree), (CADR tree), 
                                            (insert-tree (CADDR tree) el)))
        (T `(, el () ()))
    )
)
