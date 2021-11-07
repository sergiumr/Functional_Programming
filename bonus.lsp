;Bubble Sort

(defun bubble-sort (lista)
   (let 
      ((len (length lista))
      ((i 0))
         (loop
            (when (= i len) (return))
            (let 
               ((swapped nil))
               ((j 0))
               (loop
                  (when (= j (- len 1)) (return))
                  (let ((num1 (nth j lista))          
                     (num2 (nth (+ j 1) lista)))   
                      (if (> num1 num2)             
                      (let ((temp num1))
                      (setf (nth j lista) num2)
                      (setf (nth (+ j 1) lista) temp)
                      (setf swapped T)))
                  )
                  (setf j (+ j 1))
                )
           (when (not swapped) (return lista)))
            setf i (+ i 1))
      )))


;Trees

(defparameter *tree2* '(40 (30 (25 () ()) (35 () ())) (60 (50 () ()) ())))
(defparameter *tree* '(3 (2 (1 () ()) ()) (5 () ())))

;if it is binary tree
(defun is-tree (tree)
    (cond 
         ((null tree) NIL)
         ((< (list-length tree) 3) NIL)
    )
)

;return left subtree of a binary tree
(defun left-subtree (tree)
    (cond 
         ((null tree) NIL)
         ((not (listp tree)) NIL)
         (t (car (cdr tree)))
    )
)

;return right subtree of a binary tree
(defun right-subtree (tree)
    (cond 
         ((null tree) NIL)
         ((not (listp tree)) NIL)
         (t (car (cdr (cdr tree))))
    )
)

;preorder
(defun preorder (tree)
    (if 
        (not (is-tree tree)) NIL
           (cons (car tree)
               (append (preorder (left-subtree tree)) (preorder (right-subtree tree)))
           )
    )
)

;inorder
(defun inorder (tree)
    (if 
        (not (is-tree tree)) NIL
            (append (inorder (left-subtree tree)) (list (car tree)) (inorder (right-subtree tree))) 
    )
)

;postorder
(defun postorder (tree)
    (if 
        (not (is-tree tree)) NIL
            (append (postorder (left-subtree tree)) (postorder (right-subtree tree)) (list (car tree))) 
    )
)












         )

)