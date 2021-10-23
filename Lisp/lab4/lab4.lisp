;;; package -- Summary
;;; Commentary:
;;;
;;; Code:
;;;(do
;;; ((var init-val step)
;;;  (var2 init-val step)) ; bloc de initializare
;;; () ; conditia oprire
;;; (() () () ()) ; body - ul)
;;;(do
;;; ((a 1) (b 2) (c 3)) ; 1) viariabile de initializare
;;; ((cond-p) a) ; 2) conditie oprie
;;;  ((setf a 2) ())) ; 3) body)

(defun iterate (l)
  (do*
   ((iter l (cdr iter))
    (len (length iter) (1+ len)))
   ((endp iter) len)))


(defun iterate-loop (l)
  (let
      ((iter l) (len 0))
    (loop
      (when (endp iter) (return len))
      (setq iter (cdr iter)
	    len (1+ len)))))

;;; (let vs let*) (initializare paralela vs initializare secventiala)
;;; (do vs do*) (initializare paralela vs initializare secventiala)
;;;(do
;;;(
;;;(do
;;;((var init step))
;;;(stop-cond)
;;;(body))
;;; (loop
;;;   ((endp lista) (return len))
;;;   (setq len 1)
;;;   (setq lista (cdr list))


(defun exp-let (m n)
  (let ((rez 1))
    (do
     ((exp n (- exp 1)))
     ((zerop exp))
      (setf rez (* rez m)))
    rez))

(dotimes (i 10)
  (dotimes (j 10)
    (list i j)))

(defun exp-nolet (m n)
  (do ((rez 1)
       (exp n (- exp 1)))
      ((zerop exp) rez)
    (setf rez (* rez m))))


(defun exp-do (m n)
  (do
   ((rez 1 (* rez m))
    (exp n (- exp 1)))
   ((zerop exp) rez)))


(defun fact2 (n)
  (do
   ((rez 1)
    (ft n (- ft 1)))
   ((zerop ft) rez)
    (setf rez (* rez ft))))

(defun fact-loop (n)
  (let ((rez 1))
    (loop
      (when (zerop n) (return rez))
      (setf rez (* rez n) n (- n 1)))))


(defun lun-do (lista)
  (do
   ((lung 0 (+ lung 1))
    (parc lista (cdr parc)))
   ((endp parc) lung)))


(defun cresc (lista)
  (do*
   ((seq lista (cdr seq))
    (st (first seq) (first seq))
    (nd (second seq) (second seq)))
   ((or (null nd) (> st nd)) (null nd))))


(defmacro for-py (expr for var in list cond expr-p)
  (let ((result (gensym)) (iter (gensym)))
    `(let* ((,result nil) (,iter ,list) (,var (car ,iter)))
       (loop
	 (when (endp ,iter) (return ,result))
	 (when ,expr-p (setq ,result (append ,result (list ,expr))))
	 (setq ,iter (cdr ,iter)
	       ,var (car ,iter))))))


(defmacro stop-if (func)
  `(let ((a (,func)))
     (if (= a 1) "ok" "not")))


(defmacro foreach (var in list &body body)
  (let ((iter (gensym)))
    `(do*
      ((,iter ,list (cdr ,iter))
       (,var (car ,iter) (car ,iter)))
      ((endp ,iter) nil)
       ,@body)))



(defmacro forc ((var init stop-p update-f) &body body)
  `(do
    ((,var ,init ,update-f))
    ((not ,stop-p) nil)
     ,@body))


(defun range (to)
  (loop for x from 0 to to collecting x))


(foreach x in (range 10)
  (print x))


(for-py (* 2 x) for x in (range 10) if (oddp x))


(forc (x 1 (< x 10) (1+ x))
      (print x))


(loop for i from 0 to 10 collecting i)


(defun fibo (n)
  (do
   ((iter (- n 1) (- iter 1))
    (acc1 0 acc2)
    (acc2 1 (+ acc1 acc2)))
   ((zerop iter) acc1)))


(defun elim-nr (lista)
  (do
   ((iter lista (cdr iter))
    (rez nil))
   ((null iter) rez)
    (setf rez (append rez (if
			   (not (numberp (car iter)))
			   (list (car iter)))))))


(defun elim-nr-l (lista)
  (let ((rez nil) (iter lista))
    (loop
      (if (null iter) (return rez))
      (when (not (numberp (car iter)))
	(setf rez (append rez (list (car iter)))))
      (setf iter (cdr iter)))
    rez))


(defun elim-num (lista)
  (do
   ((iter lista (cdr iter))
    (elem (car lista) (car iter))
    (rez nil))
   ((endp iter) rez)
    (setf rez (append rez (cond
			    ((listp (car iter))
			     (list (elim-num (car iter))))
			    ((not (numberp (car iter)))
			     (list (car iter))))))))


(defun add-numere-do (lista)
  (do
   ((iter lista (cdr iter))
    (rez 0))
   ((null iter) rez)
    (setf rez (+ rez (car iter)))))



(defun swap (x y)
  (do
   ((a x) (b y))
   (t (list b a))))



(defun add-numere-do-secv (lista)
  (do*
   ((iter lista (cdr iter))
    (rez 0 (+ rez  (car iter))))
   ((endp iter) rez)))



(defun remove-num (lista)
  (do*
   ((iter lista (cdr iter))
    (rez (if (not (numberp (car iter)))
	     (list (car iter))
	     nil)
	 (if (not (numberp (car iter)))
	     (append rez (list (car iter)))
	     rez)))
   ((null iter) rez)))


(defun insert-tree (el tree)
  (cond
    ((endp tree) `(,el () ()))
    ((= el (car tree)) tree)
    ((< el (car tree)) `(,(car tree) ,(insert-tree el (cadr tree)) ,(caddr tree)))
    ((> el (car tree)) `(,(car tree) ,(cadr tree) ,(insert-tree el (caddr tree))))
    (T `(,el () ()))))


(defun reduce-l (fun list)
  (cond
    ((endp (cdr list)) (car list))
    (T (funcall fun (car list) (reduce-l fun (cdr list))))))


(defun reduce-r (fun list)
  "Right reduce using inner definition -- inner function is defined
  (in global namespace) only when the outer fuctions is called"
  (defun reduce-r-helper (fun list acc)
    (cond
      ((endp list) acc)
      (T (reduce-r-helper fun (cdr list) (funcall fun acc (car list))))))

  (reduce-r-helper fun (cdr list) (car list)))


(defun reduce-rr (fun list)
  "Right reduce using labels -- defines local helpers"
  (labels
      ((reduce-helper-r (fun list acc)
	 (cond
	   ((endp list) acc)
	   (T (reduce-helper-r fun (cdr list) (funcall fun acc (car list)))))))

    (reduce-helper-r fun (cdr list) (car list))))


(defun reduce-rr (fun list &optional (acc nil acc-p))
  "reduce using an optional argument"
  (cond
    ((not acc-p) (reduce-rr fun (cdr list) (car list)))
    ((endp list) acc)
    (T (reduce-rr fun (cdr list) (funcall fun acc (car list))))))

(provide 'lab4)
;;; lab4.lisp ends here
