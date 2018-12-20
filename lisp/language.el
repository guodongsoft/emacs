;;; language.el --- Develop language settings
;;; Commentary:

(require 'custom-paredit)

(add-to-list 'load-path "~/.emacs.d/lisp/language")

;; Language Server Protocol
(use-package lsp-mode :ensure t)
(use-package company-lsp :ensure t)

;; --- Lisp ---
;;; Code:
;; Emacs Lisp
(add-hook 'elisp-mode-hook 'company-mode)

;; Common Lisp
(require 'cl)

;; SBCL
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; --- C C++ ---
(add-hook 'c-mode-hook      'company-mode)
(add-hook 'c++-mode-hook    'company-mode)
;; 缩进4个空格
(setq c-basic-offset 4)
;; 没有这个 { } 就会瞎搞
(setq c-default-style "linux")

;; --- Go ---
(require 'init-golang)

;; --- Javascript ---
(require 'init-js)

;; --- Python ---
;(add-hook 'python-mode-hook 'anaconda-mode)

;; 补全
;(elpy-enable)
;(setq elpy-rpc-backend "jedi")

;; --- Ruby ---
;(require 'init-rails)

(provide 'language)
;;; language.el ends here
