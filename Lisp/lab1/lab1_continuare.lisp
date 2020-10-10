; celule cons din lab 1 (recap)
; eq compara referinta
; qeual compara continutul
; (eq 'a 'b) NIL
; (eq 'a 'a) T
; (setf a '(1 2 3))
; (setf b (rest a))
; (eq (rest a) b) T
;
;
; flow controll
; cond is switch
; if is if else
; when is if
; unless is else

(defun ?12-b (el)
 (when (numberp el)
   (when (= el 1) 'UNU!)
   (when (= el 2) 'DOI!)
 )
)
(defun optargs (x y &optional (z 3))
 (+ a y z)
)
(defun restargs (x y  &rest list_vals)
 (/ (apply '+ list_vals) (* x y))
)
(defun keyargs (&key a b c)
 (list a b c)
)
(defun keyargs2 (&rest res &key a b c)
 (list res a b c)
)
(defun auxfun (a b &aux (m (+ a b)))
  (+ a b m)
)
