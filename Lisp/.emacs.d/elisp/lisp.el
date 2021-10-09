;;; package --- Summary
;;; Commentary:
;;; Code:
(defvar slime-contribs)
(defvar slime-complete-symbol-function)
(defvar slime-net-coding-system)
(defvar slime-lisp-implementations)
(defvar common-lisp-hyperspec-root)
(defvar common-lisp-hyperspec-symbol-table)
(defvar common-lisp-hyperspec-issuex-table)
(defvar slime-company-completion)
(defvar slime-company-after-completion)


(use-package slime
  :ensure t
  :init
  (setq   inferior-lisp-program       "sbcl"
	  slime-contribs              '(slime-fancy)
	  slime-net-coding-system     'utf-8-unix
  slime-lisp-implementations  '((sbcl  ("/usr/bin/sbcl"))
					(clisp ("/usr/bin/clisp"))))
  :config
  (slime-setup '(slime-fancy))
  :hook
  (slime-mode . (lambda ()
                  (load (expand-file-name "~/quicklisp/slime-helper.el"))
                  (add-to-list 'slime-contribs 'slime-fancy)
                  (add-to-list 'slime-contribs 'inferior-slime))))

(use-package rainbow-identifiers
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-identifiers-mode)))

;(use-package slime-company
;  :after slime
;  :bind-keymap
;    ("C-n" . company-select-next)
;    ("C-p" . company-select-previous)
;    ;("C-d" . company-show-doc-buffer)
;    ;("M-." . company-show-location)
;  :config (setq slime-company-completion 'fuzzy
;                slime-company-after-completion 'slime-company-just-one-space))
;
; (use-package slime :ensure t
;   :init
;   (setq slime-contribs                     '(slime-fancy)
; 	slime-complete-symbol-function 'slime-fuzzy-complete-symbol
; 	slime-net-coding-system            'utf-8-unix
; 	slime-lisp-implementations         '((sbcl  ("/usr/bin/sbcl"))
; 					     (clisp ("/usr/bin/clisp"))))
;   :config
;   (setq common-lisp-hyperspec-root         "/usr/local/share/doc/hyperspec/HyperSpec/"
; 	common-lisp-hyperspec-symbol-table (concat common-lisp-hyperspec-root "Data/Map_Sym.txt")
; 	common-lisp-hyperspec-issuex-table (concat common-lisp-hyperspec-root "Data/Map_IssX.txt")))

(provide 'lisp)
;;; lisp.el ends here
