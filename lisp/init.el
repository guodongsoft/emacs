;;; init.el --- Elisp directory's initialization file
;;; Commentary:

;; Install-elisp
;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp/emacswiki")
(add-to-list 'load-path "~/.emacs.d/lisp/emacswiki/common")
;(setq install-elisp-repository-directory "~/.emacs.d/lisp/emacswiki")
(require 'install-elisp)

;; Company
(require 'init-company)

;; Dired
(require 'init-dired)

;; Themes
(require 'init-themes)

;; Tabbar
(require 'init-tabbar)

;; Anything.el
(require 'init-anything)

;; Ivy
(require 'init-ivy)

;; Magit
(require 'init-magit)

;; Term
(require 'init-term)

;; Encoding
(require 'init-encoding)

;; Modeline
(require 'init-modeline)

;; Project
(require 'init-project)

;; Language
(require 'language)

;; YAML
(require 'yaml-mode)

(provide 'init)
;;; init.el ends here
