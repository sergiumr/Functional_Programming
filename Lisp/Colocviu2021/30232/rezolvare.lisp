;;; Subiectul I
;;; map-zip
(defun map-zip-b (list &rest funs)
  (labels
      ((map-it (list funs)
	 (cond
	   ((endp list) nil)
	   ((endp funs) nil)
	   (T (cons (funcall (car funs) (car list))
		    (map-it (cdr list) (cdr funs)))))))
    (map-it list funs)))



(defun map-zip-f (list &rest funs)
  (labels
      ((map-it (list funs &optional (rez nil))
	 (cond
	   ((endp list) rez)
	   ((endp funs) rez)
	   (T (map-it (cdr list)
		      (cdr funs)
		      `(,@rez ,(funcall (car funs) (car list))))))))
    (map-it list funs)))

;;; inv-map
(defun inv-map-b (el &rest functions)
  (labels ((mapp (funs)
	     (cond
	       ((endp funs) nil)
	       (T (cons (funcall (car funs) el)
			(mapp (cdr funs)))))))
    (mapp functions)))

(defun inv-map-f (el &rest funs)
  (labels
      ((mapp (funs &optional (rez nil))
	 (cond
	   ((endp funs) rez)
	   (T (mapp (cdr funs) `(,@rez ,(funcall (car funs) el)))))))

    (mapp funs)))


;;; repeat on list

(defun repeat (el n)
  (cond
    ((= n 0) nil)
    (t (cons el (repeat el (- n 1))))))


(defun repeat-on-list-b (el list)
  (cond
    ((endp list) nil)
    (t (cons (repeat el (car list))
	     (repeat-on-list-b el (cdr list))))))


(defun repeat-on-list-f (el list &optional (acc nil))
  (cond
    ((endp list) acc)
    (t (repeat-on-list-f el
			 (cdr list)
			 `(,@acc ,(repeat el (car list)))))))


;;; repeat on element
(defun repeat-on-el-b (n list)
  (cond
    ((endp list) nil)
    (t (cons (repeat (car list) n)
	     (repeat-on-el-b n (cdr list))))))


(defun repeat-on-el-f (n list &optional (acc nil))
  (cond
    ((endp list) acc)
    (t (repeat-on-el-f n (cdr list) `(,@acc ,(repeat (car list) n))))))


;;; concat
(defun concat-b (list1 list2)
  (cond
    ((endp list1) list2)
    (t (cons (car list1) (concat-b (cdr list1) list2)))))


(defun concat-f (list1 list2)
  (cond
    ((endp list2) list1)
    (t (concat-f `(,@list1 ,(car list2)) (cdr list2)))))

;;; Subiectul II

;;; filter
(defun filter-do (fun list)
  (do
   ((iter list (cdr iter))
    (rez nil (if (funcall fun (car iter))
		 `(,@rez ,(car iter))
		 rez)))
   ((endp iter) rez)))


(defun filter-do* (fun list)
  (do*
   ((rez nil (if (funcall fun (car iter))
		 `(,@rez ,(car iter))
		 rez))
    (iter list (cdr iter)))
   ((endp iter) rez)))


(defun filter-loop (fun list)
  (let
      ((iter list)
       (rez nil))
    (loop
      (when (endp iter) (return rez))
      (setq rez (if (funcall fun (car iter))
		    `(,@rez ,(car iter))
		    rez)
	    iter (cdr iter)))))


;;; map
(defun map-do (fun list)
  (do
   ((iter list (cdr iter))
    (rez nil `(,@rez ,(funcall fun (car iter)))))
   ((endp iter) rez)))


(defun map-do* (fun list)
  (do*
   ((rez nil `(,@rez ,(funcall fun (car iter))))
    (iter list (cdr iter)))
   ((endp iter) rez)))


(defun map-loop (fun list)
  (let
      ((iter list)
       (rez nil))
    (loop
      (when (endp iter) (return rez))
      (setq rez `(,@rez ,(funcall fun (car iter)))
	    iter (cdr iter)))))


;;; take-while
(defun take-while-do (fun list)
  (do
   ((iter list (cdr iter))
    (rez nil `(,@rez ,(car iter))))
   ((not (funcall fun (car iter))) rez)))


(defun take-while-do* (fun list)
  (do*
   ((rez nil `(,@rez ,(car iter)))
    (iter list (cdr iter)))
   ((not (funcall fun (car iter))) rez)))


(defun take-while-loop (fun list)
  (let
      ((iter list)
       (rez nil))
    (loop
      (when (not (funcall fun (car iter))) (return rez))
      (setq rez `(,@rez ,(car iter))
	    iter (cdr iter)))))

;;;Subiectul III
;;; partial map backward
(defun partial-map-b (fun list)
  (cond
    ((endp list) nil)
    (t (cons #'(lambda (x) (funcall fun (car list) x))
	     (partial-map-b fun (cdr list))))))



;;; partial map forward
(defun partial-map-f (fun list &optional (acc nil))
  (cond
    ((endp list) acc)
    (t (partial-map-f fun
		      (cdr list)
		      `(,@acc ,#'(lambda (x) (funcall fun (car list) x)))))))


;;; partial zip backward
(defun partial-zip-b (list &rest funs)
  (labels
      ((zip-it (list funs)
	 (cond
	   ((endp list) nil)
	   ((endp funs) nil)
	   (t (cons #'(lambda (x) (funcall (car funs) (car list) x))
		    (zip-it (cdr list) (cdr funs)))))))
    (zip-it list funs)))



;;; partial zip forward
(defun partial-zip-f (list &rest funs)
  (labels
      ((zip-it (list funs &optional (acc nil))
	 (cond
	   ((endp list) acc)
	   ((endp funs) acc)
	   (t (zip-it (cdr list)
		      (cdr funs)
		      `(,@acc ,#'(lambda (x) (funcall (car funs) (car list) x))))))))

    (zip-it list funs)))


;;; Subiectul IV
;;; flatten

(defun flatten (list)
  (cond
    ((endp list) nil)
    ((atom (car list)) (cons (car list) (flatten (cdr list))))
    (t (append (flatten (car list))
	       (flatten (cdr list))))))


;;; invert tree


(defun left (tree) (cadr tree))
(defun right (tree) (caddr tree))
(defun node (tree) (car tree))

(defun invert-tree (tree)
  (cond
    ((endp tree) nil)
    (t `(,(node tree)
	 ,(invert-tree (right tree))
	 ,(invert-tree (left tree))))))
