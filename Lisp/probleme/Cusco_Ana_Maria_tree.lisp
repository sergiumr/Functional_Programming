;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BINARY SEARCH TREE INSERTION AND TRAVERSALS ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun currentNode (tree)
    (car tree)
)


(defun leftChild (tree)
    (cadr tree)
)


(defun rightChild (tree)
    (caddr tree)
)


;creates a node with key = root.key, leftChild = nil, rightChild = nil
(defun createNode (root leftChild rightChild)
(list root leftChild rightChild))

;inserts a node into a bst
(defun insertNode (key tree)
    (cond 
        ((null tree) (createNode key nil nil))
        ((= key (currentNode tree)) tree)
        ((< key (currentNode tree)) (createNode (currentNode tree) (insertNode key (leftChild tree)) (rightChild tree)))  ;insert in left subtree
        ((> key (currentNode tree)) (createNode (currentNode tree) (leftChild tree) (insertNode key (rightChild tree))))  ;insert in right subtree
    )
)

;Define keys list
(setf keys (list 5 4 2 7 3 6 8 1 9))
; we have to call createTree(keys)
;(5 (4 (2 (1 NIL NIL) (3 NIL NIL)) NIL) (7 (6 NIL NIL) (8 NIL (9 NIL NIL))))


;creates a binary search tree from a list of keys
(defun createTree (keys)
    (do 
        ((iter keys (cdr iter)))
        ((null iter) tree)
        (setf tree (insertNode (car iter) tree))
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; TREE TRAVERSALS ;;;;;;;;;;;;;;;;;;;;;;;;

;preorder traversal
;visit root
;visit left subtree
;visit right subtree
(defun preorder (tree)
    (cond 
        ((null tree) NIL)
        (T (print (currentNode tree))
        (preorder (leftChild tree)) 
        (preorder (rightChild tree))) 
    )
)



;inorder traveral 
;visit left subtree
;visit root
;visit right subtree
(defun inorder (tree)
    (cond 
        ((null tree) NIL)
        (T (inorder (leftChild tree))
        (print (currentNode tree))
        (inorder (rightChild tree)))  
    ) 
) 

;postorder traversal
;visit left subtree
;visit right subtree
;visit root
(defun postorder (tree)
    (cond ((null tree) NIL)
        (T (postorder (leftChild tree)))  
        (postorder (rightChild tree))     
        (print (currentNode tree))
    )
)










