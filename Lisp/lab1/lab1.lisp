;;; package -- Summary
;;; Commentary:
;;; comentaiile (specificate prin ";") nu se evalueaza
;;; atomi simbolici == nume de variabile / nume de functii
;;; atomi numerici
;;; atomi stringuri
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Reprezentarea listelor
;;; (1 2 3)
;;; [*|*] -> [*|*] -> [*|*] -> NIL
;;; |        |        |
;;; -> 1     -> 2     -> 3
;;; listele sunt formate din 2 pointeri (o celula cons)
;;; primul pointer la valoarea stocata (pote fi si lista)
;;; al doilea pointer pointeaza la celula urmatoare
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; interpretorul Lispul evalueaza tot
;;; >>>> 7 => 7 (atom numeric)
;;; >>>> T => T (atom logic) (nu sunt sigur)
;;; >>>> NIL => NIL (atom logic) (nu sunt sigur)
;;; >>>> alfa => ERROR (nu a fost simbolic, atomii simbolici se evalueaza la valorile referite)
;;; >>>> (setq alfa 10) => 10 (alpha a primit valoare 10)
;;; >>>> alpha => 10 (alpha a fost declarat
;;; ' (apostroful) opreste evaluarea
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; formele = chestii care se executa (evalueaza)
;;; atomii numerici si stirnguri sunt forme -> se evalueaza la valoarea lor
;;; atomii simbolici se evalueaza la valoare la care sunt legati
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; listele trebuie sa inceapa cu numele unei functii
;;; (+ 1 2 3 4) => este forma
;;; (1 + 2) => nu este forma
;;; lisp ul are o sintaxa prefixa, operatorul este primul, operanzii dupa
;;; lispul evalueaza argumentele, functia fiind aplicata pe resultatul agumetelor
;;; Ex. (+ (- 2 1) 1) => (+ 1 1) => 2
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;selectori
;;; lista = [car|cdr]
;;; (car <lista>) -> pointer la prima valoare
;;; (cdr <lista>) -> pointer la urmatoarea celula cons
;;; se pot inlantui operatori car/cons (se evalueaza de la dreapta spre stanga)
;;; cadr =>  d - lista ce incepe cu al doilea element
;;;          a - primul element din lista returnata anterior
;;; cadr == second element
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; constructori (sau ceva similar)
;;; cons -> construieste o celula cons
;;; (cons <car> <cdr>) -> celula cons [<car> | <cdr>]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; legare - (atribuire)
;;; 1. setq => nu evalueaza primul argumet
;;; Ex. (setq a 'b) => a va lua valoarea b
;;; 2. set => evalueaza primul argumet
;;; Ex. (set a 7) => a este evaluat la b => b va lua valoare 7
;;; 3. setf => nu evalueaza primul argument, dar tine cont de referinta
;;; Ex. (setf l (1 2 3)); (setf (car l) 'c); (print l) => (c 2 3)
;;; Code:
(provide 'lab1)
;;; lab1.lisp ends here
