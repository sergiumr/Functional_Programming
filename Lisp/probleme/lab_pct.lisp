(defun myLength(list)
    (cond ((NULL list) 0)
            (T (1+ (myLength (cdr list)))))
)

(defun isBT(tree)
    (if (NULL tree) nil (if (< (myLength tree) 3) nil T))
)


(defun inorder (tree)
(cond ((not (isBT tree)))
(t (inorder (cadr tree))

(print (car tree))
(inorder (caddr tree)))))

(defun preorder (tree)
(cond ((not (isBT tree)))
(t (print (car tree))
(inorder (cadr tree))
(inorder (caddr tree)))))

(defun postorder (tree)
(cond ((not (isBT tree)))
(t (postorder (cadr tree))
(postorder (caddr tree))
(print (car tree))
)))

(defun insert (item lista)
  (cond ((NULL lista) (list item))
        ((< item (car lista))
         (append (list item) lista))
        (t (append (list (car lista)) (insert item (cdr lista))))))


(defun insertion-sort (l)
  (do ((ramas l (cdr ramas))
       (lista '() (insert (car tail) lista)))
       ((NULL ramas) lista)))
