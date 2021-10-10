;;; package -- Summary
;;; Commentary:
;;; Code:
(defun lungime-back (lista)
  (cond
    ((null lista) 0)
    (T (+ 1 (lungime-back (rest lista))))))


(defun lungime-forward (lista &optional (lungime 0))
  (cond
    ((null lista) lungime)
    (T (lungime-forward (rest lista) (+ lungime 1)))))


(defun reverse-back (lista)
  (if
   (not (null lista))
   (append (reverse-back (cdr  lista)) (list (first lista)))
   nil))


(defun reverse-forward (lista &optional (acumulator '()))
  (if
   (not (null lista))
   (reverse-forward (rest lista) (cons (first lista) acumulator))
   acumulator))


(defun factorial-back (n)
  (if
   (zerop n)
   1
   (* n (factorial-back (- n 1)))))

(defun factorial-forward  (n &optional (acumulator 1))
  (if
   (zerop n)
   acumulator
   (factorial-forward (- n 1) (* acumulator n))))


(defun check-atoms-back (lista)
  (cond
    ((null lista) 0)
    ((atom (first lista)) (+ 1 (check-atoms-back (cdr lista))))
    (T (+ (check-atoms-back (car lista))
	  (check-atoms-back (cdr lista))))))


(defun check-atoms-forward (lista &optional (acumulator 0))
  (cond
    ((null lista) acumulator)
    ((atom (first lista)) (check-atoms-forward (cdr lista)
					       (+ acumulator 1)))
    (T (check-atoms-forward (cdr lista)
			    (check-atoms-forward (car lista) acumulator)))))


(defun is-sorted-backward (lista)
  (cond
    ((null (cadr lista)) T)
    ((< (car lista) (cadr lista)) (is-sorted-backward (cdr lista)))))


(defun remove-not-atoms-back (lista)
  (cond
    ((null lista) nil)
    ((listp (car lista)) (cons (remove-not-atoms-back (car lista))
			       (remove-not-atoms-back (cdr lista))))
    ((numberp (car lista)) (cons (car lista)
				 (remove-not-atoms-back (cdr lista))))
    ((not (null lista)) (remove-not-atoms-back (cdr lista)))))


(defun sum-all-numbers (lista)
  (cond
    ((null lista) 0)
    ((listp (car lista)) (+ (sum-all-numbers (car lista))
			    (sum-all-numbers (cdr lista))))
    ((numberp (car lista)) (+ (car lista)
			      (sum-all-numbers (cdr lista))))
    ((not (null lista)) (sum-all-numbers (cdr lista)))))


(defun fibonacci-back (n)
  (cond
    ((= n 1) 0)
    ((= n 2) 1)
    (T (+ (fibonacci-back (- n 1))
	  (fibonacci-back (- n 2))))))


(defun fibonacci-forward (n &optional (acumulator 0) (acumulator1 1))
  (cond
    ((= n 1) acumulator)
    ((= n 2) acumulator1)
    (T (fibonacci-forward (- n 1)
			  acumulator1
			  (+ acumulator acumulator1)))))

(defun adancime (l)
  (cond
    ((null l) 0)
    ((listp (first l)) (max (+ 1 (adancime (first l)))
			    (adancime (rest l))))
    ((atom (first l)) (adancime (rest l)))))


(defun adancime-forward (l &optional (depth 0) (depth-max 0))
  (cond
    ((null l) depth-max)
    ((listp (first l)) (let ((-max-depth (adancime-forward (rest l)
							   depth depth-max)))
			 (setq -max-depth (max -max-depth (+ 1 depth)))
			 (adancime-forward (first l) (+ depth 1) -max-depth)))
    ((atom (first l)) (adancime-forward (rest l)
					depth depth-max))))

(defun elim-numbers-back (lista)
  (cond
    ((null lista) '())
    ((numberp (car lista)) (elim-numbers-back (cdr lista)))
    ((listp (car lista)) (cons (elim-numbers-back (first lista))
			       (elim-numbers-back (cdr lista))))
    (T (cons (car lista)
	     (elim-numbers-back (rest lista))))))

(defun quicksort (lista)
  (cond
    ((null lista) nil)
    (T (let
	   ((quick-temp (partition lista (car (last lista)))))
	 (append (quicksort (car quick-temp))
		 (last lista)
		 (quicksort (cadr quick-temp)))))))


(defun partition (lista item)
  "implements partition in a backward way"
  (cond
    ((null (cadr lista)) '(() ()))
    ((<= (car lista) item)
     (setq temp (partition (cdr lista) item))
     (list (cons (car lista) (car temp))
	   (cadr temp)))
    ((> (car lista) item)
     (setq temp (partition (cdr lista) item))
     (list  (car temp) (cons (car lista) (cadr temp))))))

(provide 'lab2)
;;; lab2.lisp ends here
