; lambda function = anonymous/nameless function
; creaza un body de functie
; symbol-function -> body functie
; (defun f (x) (+ 1 x))
; (setf (symbol-function 'f) (lambda (x) (* x 1)))
; f -> (lambda (x) (* x 1))
; (apply f (x))
; (funcall f x)
; #' -> opreste evaluarea functie, ' opreste evaluarea symbolurilor
; (setq f (lambda (x) (+ 1 x)))
; (defun f (x) (* 2 x))
; f -> (lambda (x) (+ 2 x))
; #'f -> (defun f(x) (* 2 x))
; 'f -> f
; (funcall f 1) -> 3
; (funcall #'f 1) -> 2
; (funcall 'f 1) -> 2
; scopping -> (let ((x))) -> x definit doar in corpul let, setq defineste in corpul global
; mapcar -> aplica o functie peste o lista
; liste asociere -> (key . value)
; assoc -> cauta dupa cheie
; rassoc -> cauta dupa valoare
; '( 1 2)
; [*|*] -> [*|*] .... -> NIL
; |_>1     |_>2
; '(1 . 2)
; [*|*]->2
; |_>1
(defun local-f ()
    (let* 
        (
            (x 2)
            (foo #'(lambda () (print x)))
            (boo #'(lambda (x) (print x) (funcall foo)))
        )
        (funcall boo 1)
    )
    (print x)
)

(defun meber-if (predicat lista)
    (if
        (funcall predicat (first lista))    
        lista
        (meber-if predicat (rest lista))
    )
)
(defun map-leaf (predicat lista)
    (cond
        ((funcall predicat lista) T)
        ((atom lista) NIL)
        (T (mapcar (lambda (x) (map-leaf predicat x)) lista))
    )
)
; lungime maxima
(defun lgm2 (l)
    (do
        (rez (length l))
        (ll l (rest l))
    )
)
(defun remove-iff (pred lista)
    (mapcan #'(lambda (x) (if (not (funcall pred x)) (list x))) lista)
)
(setq atlas '((france . paris) (romania . bucharest) (romania . cluj) (germany . bonn)))
(defun selcap (caps)
    (mapcar #'cdr caps)
)
(defun selcon (caps)
    (mapcar #'car caps)
)
(defun selrom (caps)
    (mapcan #'(lambda (x) (if (equal (car x) 'romania) (list x))) caps)
)
(defun move_germ_cap (caps)
    (mapcan 
        #'(lambda (x) 
            (if (equal (car x) 'germany) (list (cons 'germany 'berlin)) (list x))) caps)
)
(defun dbl (e)
    (if (numberp e) (* 2 e) e)
)
(defun proc-rec (process lista)
    (if
        (atom lista)    
        (funcall process lista)
        (mapcar 
            #'(lambda (x) (proc-rec process x)) 
            lista
        )
    )
)
(defun double-it-or-leave-it (lista)
    (proc-rec #'dbl lista)
)
