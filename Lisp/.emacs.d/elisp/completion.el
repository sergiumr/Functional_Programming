;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package company
  :bind (:map company-active-map
	      ("<tab>" . company-complete-selection)
	      ("C-n" . company-select-next))
  :config
  (setq company-idle-delay 0
	company-minimum-prefix-length 1
	company-show-quick-access t
	company-tooltip-limit 10
	company-tooltip-align-annotations t
	;; invert the navigation direction if the the completion popup-isearch-match
	;; is displayed on top (happens near the bottom of windows)
	company-tooltip-flip-when-above t)
  (global-company-mode t))


;(use-package company-box
;  :hook (company-mode . company-box-mode))

(use-package paren
  :config
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))

(use-package helm
  :diminish
  :init (helm-mode t)
  :bind (("M-x"     . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b"   . helm-mini)     ;; See buffers & recent files; more useful.
	 ("C-x r b" . helm-filtered-bookmarks)
	 ("C-x C-r" . helm-recentf)  ;; Search for recently edited files
	 ("C-c i"   . helm-imenu)
	 ("C-h a"   . helm-apropos)
	 ;; Look at what was cut recently & paste it in.
	 ("M-y" . helm-show-kill-ring)

	 :map helm-map
	 ;; We can list ‘actions’ on the currently selected item by C-z.
	 ("C-z" . helm-select-action)
	 ;; Let's keep tab-completetion anyhow.
	 ("TAB"   . helm-execute-persistent-action)
	 ("<tab>" . helm-execute-persistent-action)))

(provide 'completion)
;;; completion.el ends here
