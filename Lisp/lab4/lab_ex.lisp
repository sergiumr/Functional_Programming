;;; package -- Summary
;;; Commentary:
;;; Code:
(defun add-numere (lista)
  (let
      ((rez 0)
       (iter lista))
    (loop
      (when (null iter) (return rez))
      (setf rez (+ rez (car iter)) iter (cdr iter)))))


(defun add-numere-do (lista)
  (do
   ((iter lista (cdr iter))
    (rez 0))
   ((null iter) rez)
    (setf rez (+ rez (car iter)))))


(defun add-numere-do-secv (lista)
  (do*
   ((rez 0 (+ rez  (car iter)))
    (iter lista (cdr iter)))
   ((null iter) rez)))


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

(provide 'lab_ex)
;;; lab_ex.lisp ends here
