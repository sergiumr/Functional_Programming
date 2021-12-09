(defun left (tree)
   (COND 
   	((null tree) NIL)
   	((not (listp tree)) NIL)
    (T (CAR (CDR tree)))   
   	)
)

(defun right (tree)
   (COND 
   	((null tree) NIL)
   	((not (listp tree)) NIL)
    (T (CAR (CDR (CDR tree)))) 
   	)
)

(defun tree_cond (tree)
	(COND
		((null tree) NIL)
		((< (list-length tree) 3) NIL)
		(T)
	)
)

(defun preo (tree)
	(if (not (tree_cond tree)) nil
		(CONS (CAR tree) (append (preo (left tree)) (preo (right tree))))
	)
)

(defun ino (tree)
	(if (not (tree_cond tree)) nil
		(append (ino (left tree)) (list (car tree)) (ino (right tree)))
	)	
)

(defun posto (tree)
	(if (not (tree_cond tree)) nil
		(append (posto (left tree)) (posto (right tree)) (list (car tree)))
	)
)

(setq tree '(10 (12 (3 () ()) (4 (6 () ()) (7 () ()))) (5 (11 () ()) (2 () (8 () ())))))
