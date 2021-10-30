;;; Subiectul I
;;; take-while

(defun take-while-b (fun-p list)
  (cond
    ((endp list) nil)
    ((not (funcall fun-p (car list))) nil)
    (T (cons (car list) (take-while-b fun-p (cdr list))))))

(defun take-while-f (fun-p list &optional (acc nil))
  (cond
    ((endp list) acc)
    ((not (funcall fun-p (car list))) acc)
    (T (take-while-f fun-p (cdr list) `(,@acc ,(car list))))))


;;; zip-with
(defun zip-with-b (fun list1 list2)
  (cond
    ((endp list1) nil)
    ((endp list2) nil)
    (T (cons (funcall fun (car list1) (car list2))
	     (zip-with-b fun (cdr list1) (cdr list2))))))

(defun zip-with-f (fun list1 list2 &optional (acc nil))
  (cond
    ((endp list1) acc)
    ((endp list2) acc)
    (T (zip-with-f fun
		   (cdr list1)
		   (cdr list2)
		   `(,@acc ,(funcall fun (car list1) (car list2)))))))

;;; take
(defun take-b (n list)
  (cond
    ((= n 0) nil)
    ((endp list) nil)
    (T (cons (car list) (take-b (- n 1) (cdr list))))))


(defun take-f (n list &optional (acc nil))
  (cond
    ((= n 0) acc)
    ((endp list) acc)
    (T (take-f (- n 1)
	       (cdr list)
	       `(,@acc ,(car list))))))


;;; drop
(defun drop-b (n list)
  (cond
    ((= n 0) list)
    ((endp list) list)
    (T (drop-b (- n 1) (cdr list)))))

(defun drop-f (n list)
  (cond
    ((= n 0) list)
    ((endp list) list)
    (T (drop-f (- n 1) (cdr list)))))

;;; repeat

(defun repeat-b (n e)
  (cond
    ((= n 0) nil)
    (T (cons e (repeat-b (- n 1) e)))))


(defun repeat-f (n e &optional (acc nil))
  (cond
    ((= n 0) acc)
    (T (repeat-f (- n 1) e `(,@acc ,e)))))


;;; Subiectul II
;;; take
(defun take-do (n list)
  (do
   ((iter list (cdr iter))
    (acc nil (append acc (list (car iter))))
    (k n (- k 1)))
   ((or (= k 0) (endp iter)) acc)))


(defun take-do* (n list)
  (do*
   ((acc nil (append acc (list (car iter))))
    (iter list (cdr iter))
    (k n (- k 1)))
   ((or (= k 0) (endp iter)) acc)))


(defun take-loop (n list)
  (let
      ((acc nil)
       (iter list)
       (k n))
    (loop
      (when (or (= k 0) (endp iter)) (return acc))
      (setq acc (append acc (list (car iter)))
	    iter (cdr iter)
	    k (- k 1)))))

;;; drop

(defun drop-do (n list)
  (do
   ((iter list (cdr iter))
    (k n (- k 1)))
   ((or (= k 0) (endp iter)) iter)))


(defun drop-do* (n list)
  (do*
   ((iter list (cdr iter))
    (k n (- k 1)))
   ((or (= k 0) (endp iter)) iter)))


(defun drop-loop (n list)
  (let
      ((iter list)
       (k n))
    (loop
      (when (or (= k 0) (endp iter)) (return iter))
      (setq iter (cdr iter)
	    k (- k 1)))))

;;; inv-map
(defun inv-map-do (el &rest funs)
  (do
   ((iter funs (cdr iter))
    (rez nil (append rez (list (funcall (car iter) el)))))
   ((endp iter) rez)))


(defun inv-map-do* (el &rest funs)
  (do*
   ((rez nil (append rez (list (funcall (car iter) el))))
    (iter funs (cdr iter)))
   ((endp iter) rez)))


(defun inv-map-loop (el &rest funs)
  (let
      ((iter funs)
       (rez nil))
    (loop
      (when (endp iter) (return rez))
      (setq rez (append rez (list (funcall (car iter) el)))
	    iter (cdr iter)))))

;;; Subiectul III

;;; acumulate backward
(defun acumulate-b (fun list)
  (labels
      ((acc-it (fun list acc)
	 (cond
	   ((endp list) (list acc))

	   (t (cons acc (acc-it fun
				(cdr list)
				(funcall fun acc (car list))))))))
    (acc-it fun (cdr list) (car list))))


;;; acumulate forward
(defun acumulate-f (fun list)
  (labels
      ((acc-it (fun list acc &optional (rez nil))
	 (cond
	   ((endp list) `(,@rez ,acc))
	   (t (acc-it fun
			   (cdr list)
			   (funcall fun acc (car list))
			   `(,@rez ,acc))))))

    (acc-it fun (cdr list) (car list))))


;;; aplicative-functor backward
(defun inv-map (el funs)
  (mapcar #'(lambda (fn) (funcall fn el))
	  funs))

(defun applicative-b (list &rest funs)
  (labels
      ((applly (list)
	 (cond
	   ((endp list) nil)
	   (t (append (inv-map (car list) funs)
		      (applly (cdr list)))))))
    (applly list)))


;;; aplicative-functor forward
(defun applicative-f (list &rest funs)
  (labels
      ((applly (list &optional (rez nil))
	 (cond
	   ((endp list) rez)
	   (t (applly (cdr list)
		      (append rez (inv-map (car list) funs)))))))
    (applly list)))

;;; Subiectul IV
;;; is-well
(defun is-well (str-list &optional (stack nil))
  (cond
    ((endp str-list) (endp stack))
    ((string= (car str-list) "(") (is-well (cdr str-list) (cons "(" stack)))
    ((string= (car str-list) ")") (if (string= "(" (car stack))
				      (is-well (cdr str-list) (cdr stack))
				      nil))))


;;; zip-tree
(defun left (tree) (cadr tree))
(defun right (tree) (caddr tree))
(defun node (tree) (car tree))
(defun zip-nodes (node1 node2)
  (cond
    ((null node1) (list node2))
    ((null node2) (list node1))
    (t (list node1 node2))))

(defun zip-tree (tree1 tree2)
  (cond
    ((and (endp tree1) (endp tree2)) nil)
    (t `(,(zip-nodes (node tree1) (node tree2))
	 ,(zip-tree (left tree1) (left tree2))
	 ,(zip-tree (right tree1) (right tree2))))))

;;; mapcar-n
(defun any-endp (lists)
  (cond
    ((endp lists) nil)
    ((endp (car lists)) t)
    (t (any-endp (cdr lists)))))



(defun mapcar-n (fun &rest lists)
  (labels
      ((map-n-it (lists)
	 (cond
	   ((any-endp lists) nil)
	   (t (cons (apply fun (mapcar #'car lists))
		    (map-n-it (mapcar #'cdr lists)))))))
    (map-n-it lists)))
