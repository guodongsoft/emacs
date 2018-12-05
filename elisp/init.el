;;; init.el --- Elisp directory's initialization file
;;; Commentary:

;; Install-elisp
;;; Code:
(add-to-list 'load-path "~/.emacs.d/elisp/emacswiki")
(add-to-list 'load-path "~/.emacs.d/elisp/emacswiki/common")
(setq install-elisp-repository-directory "~/.emacs.d/elisp/emacswiki")
(require 'install-elisp)

;; Dired
(require 'init-dired)

;; Themes
(require 'init-themes)

;; Tabbar
(require 'init-tabbar)

;; Anything.el
(require 'init-anything)

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
