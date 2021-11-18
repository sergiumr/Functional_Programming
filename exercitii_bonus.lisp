(defun lungime (lista)
  (cond
    ((null lista) 0)
    (T (+ 1 (lungime (rest lista))))))
    
(defun merge1(f s)
    (cond
      ((= (lungime f) 0) s)
      ((= (lungime s) 0) f)
      ((< (car f) (car s)) (append (list (car f)) (merge1 (cdr f) s)))
      ((> (car f) (car s)) (append (list (car s)) (merge1 f (cdr s))))
      ((= (car f) (car s)) (append (list (car f) (car s)) (merge1 (cdr f) (cdr s))))
    )
 )
 
 (defun merge-sort (li)
 	(cond
 		((<= (lungime li) 1) li)
 		(T (merge1 (merge-sort (subseq li 0 (ceiling (lungime li) 2)) ) (merge-sort(subseq li (ceiling (lungime li) 2)) )))
 	)
 )
 
 (defun bubble-sort (li )

 		(loop for i from 0 to  ( - (lungime li) 1) do
 			(loop for j from 0 to ( - (lungime li) 2) do (
 				if(> (nth j li) (nth (+ j 1) li))
 					 (rotatef (nth j li) (nth (+ j 1) li))
 				)
 			)
 		   )
 		   (print li)
 )
 
  (defun sortare-basic (li ) ;nu stiu cum se cheama

 		(loop for i from 0 to  ( - (lungime li) 2) do
 			(loop for j from i to ( - (lungime li) 1) do (
 				if(> (nth i li) (nth j li))
 					 (rotatef (nth i li) (nth j li))
 				)
 			)
 		   )
 		   (print li)
 )
 
(defun remove-nth (li n &optional (i 0) (newl '())) ;fct opt pt selection sort
	(cond
		((null li) newl)
		((= i n) (remove-nth (cdr li) n (+ i 1) newl))
		(T (remove-nth (cdr li) n (+ i 1) (append newl (list (car li)))))
	)
)

(defun find-idx-min (li) ;fct opt pt selection sort
	(do
		((i 0)
		(n (lungime li))
		(mi (car li))
		(idx-mi 0))
		((= i n) idx-mi)
		(if (< (car li) mi)
			(setf mi (car li) idx-mi i)
		(setf i (+ i 1) li (cdr li)))
	)
)

(defun selection-sort (li &optional (newli '()))
	(cond
		((null li) newli)
		(T (selection-sort (remove-nth li (find-idx-min li)) (append newli (list (nth (find-idx-min li) li)))))
	)
)

(defun selection-sort1 (li &optional (newli '())) ;cu let 
	(let  ((idxm  (find-idx-min li)) )
		(cond
			((null li) newli)
			(T (selection-sort1 (remove-nth li idxm) (append newli (list (nth idxm li)))))
		)
	)
)

(DEFUN insert-sorted (el l)
	(COND 
		((null l) ( list el))
		((< el l) (CONS el l))
		(T (cons (car l) (insert_sorted el (cdr l)) ))
	)
)

(DEFUN insert_sort(l) ;backward
	(COND
		((NULL l) nil)
		(T (insert_sorted (car l) (insert_sort (cdr l))))
	)
)
 
 (defun preord (li )
 	(cond
 		((null li) nil)
 		((atom (car li)) (append (list(car li)) (preord (cdr li))))
 		((listp (car li)) (append (preord (car li)) (preord (cdr li))))
 	)
 )
 
 (defun postord (li )
 	(cond
 		((null li) nil)
 		((listp (car li)) (append (postord (car li)) (postord (cdr li))))
 		((and (atom (car li)) (atom (cadr li))) (append (list(car li)) (postord (cdr li)) ))
 		((atom (car li)) (append (postord (cdr li)) (list(car li))  ))
 	)
 )
 
 (defun inord (li)
 	(cond
 		((null li) nil)
 		((and (atom (car li)) (atom (car (cadr li))) (atom (cadr (cadr li)))) (append (list(car (cadr li))) (list (car li)) (list (cadr (cadr li))) ))
 		((atom (car li)) (append (inord (cdr li)) (list (car li)) (inord (cddr li))))
 		((listp (car li)) (inord (car li)))
 	)
 )
 
 (defun pretty (li &optional (sp "")) ;pretty print
 	(cond
 		((null li) nil)
 		((atom (car li)) (write sp)(write (car li)) (terpri) (pretty (cdr li) sp))
 		((listp (car li))(pretty (car li) (concatenate 'string "   " sp)) (pretty (cdr li) sp))
 	)
 )
 
 (defun insert-nth1 (li poz el &optional (i 0) (newli '()))
 	(cond
 		((null li) newli)
 		((= i poz) (insert-nth1 (cdr li) poz el (+ i 1) (append newli (list el) (list (car li)))))
 		(T (insert-nth1 (cdr li) poz el (+ i 1) (append newli (list (car li)))))
 	)
 )
 """(DEFUN f ()
	(LET* ((x 2)
		(foo #’(LAMBDA () (PRINT x)))
		(bar #’(LAMBDA (x) (PRINT x) (FUNCALL foo))))
		(FUNCALL bar 1))
	(print x)
)"""
 
