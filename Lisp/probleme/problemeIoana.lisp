
(defun e_arbore(arbore)
    (cond 
         ((null arbore) NIL)
         (t)
    )
)

;return left subtree of a binary tree
(defun left(arbore)
    (cond 
         ((null arbore) NIL)
         (t (car (cdr arbore)))
    )
)

(defun right(arbore)
    (cond 
         ((null arbore) NIL)
         (t (car (cdr (cdr arbore))))
    )
)

;preorder - radacina , stanga, dreapta
(defun preorder(arbore)
    (if 
        (not (e_arbore arbore)) NIL
        
           (cons (car arbore)
               (append (preorder (left arbore))
                     (preorder (right arbore))
               )
           )
    )
)
; inorder-stanga, radacina, dreapta
(defun inorder(arbore)
    (if 
        (not (e_arbore arbore)) NIL
            (append 
                 (inorder (left arbore))
                 (list (car arbore))
                 (inorder (right arbore))
            ) 
    )
)

;postorder-stanga, dreapta, radacina
(defun postorder(arbore)
    (if 
        (not (e_arbore arbore)) NIL
            (append 
                 (postorder (left arbore))
                 (postorder (right arbore))
                 (list (car arbore))
            ) 
    )
)



