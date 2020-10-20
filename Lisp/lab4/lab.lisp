(defun exp_let (m n)
    (let ((rez 1))
        (do ((exp n (- exp 1)))
            ((zerop exp))
            (setf rez (* rez m))
        )
        rez
    )
)
(defun exp_nolet (m n)
    (do 
        (
            (rez 1)
            (exp n (- exp 1))
        )
        ((zerop exp) rez)
        (setf rez (* rez m))
    )
)
(defun exp_do (m n)
    (do 
        (
            (rez 1 (* rez m))
            (exp n (- exp 1))
        )
        ((zerop exp) rez)
    )
)
(defun fact2 (n)
    (do
        (
            (rez 1)
            (ft n (- ft 1))
        )    
        ((zerop ft) rez)
        (setf rez (* rez ft))
    )
)

(defun fact_loop (n)
    (let ((rez 1))
        (loop
            (when (zerop n) (return rez))
            (setf rez (* rez n) n (- n 1))
        
        )    
    )
)
(defun lun_do (lista)
    (do
        (
            (lung 0 (+ lung 1))
            (parc lista (cdr parc))
        ) 
        ((endp parc) lung)
    
    )
)
(defun cresc (lista)
    (do*
        (
            (seq lista (cdr seq))
            (st (first seq) (first seq))
            (nd (second seq) (second seq))
        ) 
        ((or (null nd) (> st nd)) (null nd))
    )
)
