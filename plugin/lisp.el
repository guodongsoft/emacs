;; Emacs Lisp
(add-hook 'elisp-mode-hook 'company-mode)

;; Common Lisp
(require 'cl)

;; SBCL
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
