(DEFUN bubble-sort (lista)
    (LET 
        ((sortat NIL)           ;; am terminat
        (inter (length lista))) ;; bucla externa, o parcurg de exact n ori
        (DO ()              ;; nu am variabile locale
            (sortat lista) ;; ma opresc cand nu mai am de sortat
            (SETF sortat T) ;; presupun ca am terminat
            (DECF inter)  ;; merg la urmatoare iteratie => pe anteriorul pas am
            (             ;; valoarea cea mai buna
                DO
                    ((j 0 (1+ j)))  ;; bucla interioara
                    ((>= j inter))  ;; se opreste mereu la ultimul
                    (WHEN (> (nth j lista) (nth (1+ j) lista)) ;; interschimbarea
                        (rotatef (nth j lista) (nth (1+ j) lista))
                        (SETF sortat NIL) ;; mai am de sortat
                    )
            )
        )
    )
)

(bubble-sort '(1 5 7 2 4 7 9))

(>= 2 2)