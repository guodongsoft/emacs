;; Common Lisp
(require 'cl)

;; SBCL
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; Python补全
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;; Javascript
(require 'js2-mode)
(add-to-list 'load-path "~/.emacs.d/elpa/js2-mode-20180724.801/")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

;; Go-mode
(require 'go-mode)
(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20181012.329/")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook
 (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))
