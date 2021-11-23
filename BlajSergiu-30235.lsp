;; sorts
;; sorts
(defun bubble-sort (lista)
   (let ((n (length lista)))
      (do
         ((i 0 (1+ i)))
         ((= i n))
         (do
            ((j 0 (1+ j)))
            ((= j n))
            (when (< (nth i lista) (nth j lista))
               (let ((temp (nth i lista)))
                  (setf (nth i lista) (nth j lista))
                  (setf (nth j lista) temp)))))) lista)

(defun selection-sort (lista)
   (let ((n (length lista))
         (min_idx 0))
      (do
         ((i 0 (1+ i)))
         ((= i n))
         (progn 
            (do
               ((j (1+ i) (1+ j)))
               ((= j n))
               (when (< (nth j lista) (nth min_idx lista))
                  (setf min_idx j)))
            (let ((temp (nth min_idx lista)))
               (setf (nth min_idx lista) (nth i lista))
               (setf (nth i lista) temp))
            (setf min_idx (1+ i))))) lista)     

(defun insertion-sort (lista)
   (let ((n (length lista))
         (j 0))
      (do
         ((i 1 (1+ i)))
         ((= i n))
         (let ((key (nth i lista)))
            (do
               ()
               ((or (< j 0) (> key (nth j lista))))
               (progn 
                  (setf (nth (1+ j) lista) (nth j lista))
                  (setf j (1- j))))
            (setf (nth (1+ j) lista) key)
            (setf j i)))) lista )

;; search
(defun binary-search (lista elem &optional (low 0) (high (1- (length lista))))
   (if (> low high) NIL
      (let ((mid (/ (+ low high) 2)))
         (cond
            ((= elem (nth mid lista)) T)
            ((< elem (nth mid lista)) (binary-search lista elem low (1- mid)))
            (T (binary-search lista elem (1+ mid) high))))))

;; trees
(defun node (tree) (first tree))
(defun left (tree) (second tree))
(defun right (tree) (third tree))

(defun preorder (tree)
   (if (null tree) nil
      (append (list (node tree)) (append (preorder (left tree)) (preorder (right tree))))))

(defun inorder (tree)
   (if (null tree) nil
      (append (append (inorder (left tree)) (list (node tree))) (inorder (right tree)))))

(defun postorder (tree)
   (if (null tree) nil
      (append (append (postorder (left tree)) (postorder (right tree))) (list (node tree)))))

(defun is-bst (tree)
   (cond
      ((null tree) T)
      ((and (not (null (left tree))) (< (node tree) (node (left tree)))) NIL)
      ((and (not (null (right tree))) (> (node tree) (node (right tree)))) NIL)
      ((or (not (is-bst (right tree))) (not (is-bst (left tree)))) NIL)
      (T T)))

(defun search-bst (tree elem)
   (cond
      ((null tree) NIL)
      ((< elem (node tree)) (search-bst (left tree) elem))
      ((> elem (node tree)) (search-bst (right tree) elem))
      ((= elem (node tree)) T)))

; aproape merge
(defun insert-bst (tree elem)
   (cond
      ((null tree) elem)
      ((< elem (node tree)) (setf (left tree) (insert-bst (left tree) elem)))
      (T (setf (right tree) (insert-bst (right tree) elem)))))

;; graphs
;; !Nota
;; graful e aciclic si direct
;; graful e definit ca o lista de subliste
;; ((a b c) (b c) (c)) inseamna 
;; a ii are ca succesori pe b si c
;; b il are ca succesor pe c
;; c nu are niciun succesor - chiar daca n-are succesori, tot trebuie declarat ca o lista

(defun successors (graph node)
   (do*
      ((i 0 (1+ i))
      (crt_list (first graph) (nth i graph)))
      ((equal (first crt_list) node) crt_list)))

;; (dfs '((a c d) (b) (c b) (d b)) 'a)
(defun dfs (graph start)
   (let ((visited (list start)) (stack (list start)) (answer '()))
      (do
         ((node start (last stack)))
         ((null stack))
         (progn
            (if (listp node) (setf node (first stack))) ;; dunno y
            (setf answer (append answer (list node)))
            (setf stack (rest stack))
            (let ((neighbours (successors graph node)))
               (do*
                  ((i 1 (1+ i))
                  (crt_neighbour (second neighbours) (nth i neighbours)))
                  ((= i (length neighbours)))
                  (if (not (member crt_neighbour visited :test #'equal))
                     (progn
                        (setf visited (append visited (list crt_neighbour)))
                        (setf stack (cons crt_neighbour stack))
                        )))))) answer))

;; (bfs '((a c d) (b) (c b) (d b)) 'a)
(defun bfs (graph start)
   (let ((visited (list start)) (queue (list start)) (answer '()))
      (do
         ((node start (first queue)))
         ((null queue))
         (progn
            (setf answer (append answer (list node)))
            (setf queue (rest queue))
            (let ((neighbours (successors graph node)))
               (do*
                  ((i 1 (1+ i))
                  (crt_neighbour (second neighbours) (nth i neighbours)))
                  ((= i (length neighbours)))
                  (if (not (member crt_neighbour visited :test #'equal))
                     (progn
                        (setf visited (append visited (list crt_neighbour)))
                        (setf queue (append queue (list crt_neighbour))))))))) answer))
   




   