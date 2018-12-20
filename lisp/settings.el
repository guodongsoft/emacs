;;; settings.el --- Elisp directory's initialization file
;;; Commentary:

;; Install-elisp
;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp/emacswiki")
(add-to-list 'load-path "~/.emacs.d/lisp/emacswiki/common")
(require 'install-elisp)

(require 'custom-variables)

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))

(defun set-theme ()
  "Load tango-dark theme."
  (load-theme 'tango-dark t)
  ;; 透明
  (set-face-background 'default nil))
(set-theme)

;; Evil
(use-package evil :ensure t)
(evil-mode t)

;; Anything.el
(require 'custom-anything)

;; Company
(require 'custom-company)

;; Dired
(require 'custom-dired)

;; Ivy
(require 'custom-ivy)

;; Magit
(require 'custom-magit)

;; Modeline
(require 'custom-modeline)

;; Tabbar
(require 'custom-tabbar)

;; Term
(require 'custom-term)

;; Encoding
(require 'encoding)

;; Language
(require 'language)

;; Project
(require 'project)

;; Themes
;(require 'themes)

;; YAML
(require 'yaml-mode)

(provide 'settings)
;;; settings.el ends here
