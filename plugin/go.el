;; Go
(add-hook 'go-mode-hook
 (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (setq tab-with 2)
  (company-mode)))

(require 'go-mode)
(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20181012.329/")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
