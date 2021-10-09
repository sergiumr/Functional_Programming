;;; package --- Summary
;;; Commentary:
;;; Code:

(setq custom-file "~/.emacs.d/custom.el")
(ignore-errors (load custom-file))
(require 'package)

(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)
(defvar hsc/default-font-size 120)
(set-face-attribute 'default nil :height hsc/default-font-size)

(defvar display-line-numbers-type)
(setq inhibit-startup-screen t
      inhibit-splash-screen t
      display-line-numbers-type 'relative
      cursor-type 'box
      make-backup-files nil
      visible-bell nil
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )
;; Keep buffers automatically up to date

(global-auto-revert-mode t)
(global-display-line-numbers-mode)
(show-paren-mode 1)
(global-hl-line-mode t)
(global-linum-mode)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(provide 'base)
;;; base.el ends here
