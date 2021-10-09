;;; package --- Summary
;;; Commentary:
;;; Code:
;(use-package lsp-pyright
;  :hook (python-mode . (lambda ()
;                        (require 'lsp-pyright)
;                        (lsp-deferred))))
;
;(use-package python-mode
;  :hook (python-mode . lsp-deferred))


 (use-package elpy
   :ensure t
   :config (put 'set-goal-column 'disabled nil)
   (elpy-enable))


(use-package pyvenv
  :after python-mode
  :config
  (pyvenv-mode 1))

(provide 'py)
;;; py.el ends here
