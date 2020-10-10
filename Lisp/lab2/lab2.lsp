; lungimea listei backward
(defun lungime_back (lista)
    (cond 
        ((null lista) 0)
        (T (+ 1 (lungime_back (rest lista))))
    )
)
; lungimea listei forward (acumulater)
(defun lungime_forward (lista &optional (lungime 0))
    (cond 
        ((null lista) lungime)
        (T (lungime_forward (rest lista) (+ lungime 1)))
    )
)
; inversarea listei backward
(defun reverse_back (lista)
    (if 
        (not (null lista))
        (append 
            (reverse_back (cdr  lista))
            (list (first lista))
        )
        nil
    )
)
; inversarea listei forward
(defun reverse_forward (lista &optional (acumulator '()))
    (if 
        (not (null lista))
        (reverse_forward (rest lista) (cons (first lista) acumulator))
        acumulator  
    )
)
; factorial backward
(defun factorial_back (n)
    (if 
        (zerop n)
        1
        (* n (factorial_back (- n 1)))
    )
)
; factorial forward
(defun factorial_forward  (n &optional (acumulator 1))
    (if 
        (zerop n)
        acumulator
        (factorial_forward (- n 1) (* acumulator n))
    )
)
; nr de atomi back
(defun check_atoms_back (lista)
    (cond 
        ((null lista) 0)
        ((atom (first lista)) (+ 1 (check_atoms_back (cdr lista)))) 
        (T (+ (check_atoms_back (car lista)) (check_atoms_back (cdr lista))))
    )
)
; nr de atomi forward
(defun check_atoms_forward (lista &optional (acumulator 0))
    (cond 
        ((null lista) acumulator)
        ((atom (first lista)) (check_atoms_forward (cdr lista) (+ acumulator 1))) 
        (T 
            (check_atoms_forward (cdr lista) (check_atoms_forward (car lista) acumulator))
        )
    )
)
; is_sorted backward
(defun is_sorted_backward (lista)
    (cond 
        ((null (cadr lista)) T)
        ((< (car lista) (cadr lista)) (is_sorted_backward (cdr lista)))
    )
)

; remove all not number atoms
(defun remove_not_atoms_back (lista)
    (cond
        ((null lista) nil)
        ((listp (car lista))
            (cons 
                (remove_not_atoms_back (car lista))
                (remove_not_atoms_back (cdr lista))              
            )
        )
        ((numberp (car lista))
            (cons (car lista) (remove_not_atoms_back (cdr lista)))
        )
        ((not (null lista))
            (remove_not_atoms_back (cdr lista))
        )
    )
)
; sum all number atoms
(defun sum_all_numbers (lista)
    (cond
        ((null lista) 0)
        ((listp (car lista))
            (+ 
                (sum_all_numbers (car lista))
                (sum_all_numbers (cdr lista))              
            )
        )
        ((numberp (car lista))
            (+ (car lista) (sum_all_numbers (cdr lista)))
        )
        ((not (null lista))
            (sum_all_numbers (cdr lista))
        )
    )
)
; Fibonacci
(defun fibonacci_back (n)
    (cond 
        ((= n 1) 0)
        ((= n 2) 1)
        (T (+ (fibonacci_back (- n 1)) (fibonacci_back (- n 2))))
    )
)
; Fibonacci forward
(defun fibonacci_forward (n &optional (acumulator 0) (acumulator1 1))
    (cond 
        ((= n 1) acumulator)
        ((= n 2) acumulator1)
        (T (fibonacci_forward (- n 1) acumulator1 (+ acumulator acumulator1)))
    )
)
; adancime backward
(defun adancime (l)
    (cond 
        ((null l) 0)
        ((listp (first l)) 
                    (max 
                        (+ 1 (adancime (first l))) 
                        (adancime (rest l)) 
                    )
        )
        ((atom (first l)) (adancime (rest l))) 
    )
)
; adancime forward
(defun adancime_forward (l &optional (depth 0) (depth_max 0))
    (cond 
        ((null l) depth_max)
        ((listp (first l)) 
            (let ((_max_depth (adancime_forward (rest l) depth depth_max)))
                (setq _max_depth (max _max_depth (+ 1 depth)))
                (adancime_forward (first l) (+ depth 1) _max_depth)
            )
        )
        ((atom (first l)) (adancime_forward (rest l) depth depth_max)) 
    )
)
; remove nnumbers
;elim_numbers
(defun elim_numbers_back (lista)
    (cond 
        ((null lista) '())
        ((numberp (car lista)) (elim_numbers_back (cdr lista)))
        ((listp (car lista)) (cons (elim_numbers_back (first lista)) (elim_numbers_back (cdr lista))))
        (T (cons (car lista) (elim_numbers_back (rest lista))))
    )
)
; quicksort
(defun quicksort (lista)
    (cond 
        ((null lista) nil)
        (T 
            (let ((quick_temp (partition lista (car (last lista))))) 
                (append 
                        (quicksort (car quick_temp)) 
                        (last lista) 
                        (quicksort (cadr quick_temp))
                )
            )
        )
    )
)
(defun partition (lista item)
    (cond 
        ((null (cadr lista)) '(() ()))
        ((<= (car lista) item) 
            (setq temp (partition (cdr lista) item)) 
            (list (cons (car lista) (car temp)) (cadr temp)))
    ((> (car lista) item) 
            (setq temp (partition (cdr lista) item)) 
            (list  (car temp) (cons (car lista) (cadr temp))))
    )
)
