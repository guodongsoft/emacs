;; --- Lisp ---
;; Emacs Lisp
(add-hook 'elisp-mode-hook 'company-mode)

;; Common Lisp
(require 'cl)

;; SBCL
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; --- Go ---
(add-hook 'go-mode-hook
 (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (setq tab-with 2)
  (company-mode)))

(require 'go-mode)
(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20181012.329/")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; --- Javascript ---
(setq js-indent-level 2)

;; デフォルトではJSHintの優先度が高くなっているようなので、JSHintを無効にする
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
    ))
;; 上記記事にあったjs2-modeで競合してしまう機能についてもオフにしておく
(setq js2-include-browser-externs nil)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-highlight-external-variables nil)
(setq js2-include-jslint-globals nil)

(require 'js-comint)
(require 'js2-mode)

(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fixing the file" (buffer-file-name))
  (shell-command (concat "eslint --fix " (buffer-file-name))))

(defun eslint-fix-file-and-revert ()
  (interactive)
  (eslint-fix-file)
  (revert-buffer t t))

(add-hook 'js2-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'eslint-fix-file-and-revert)))

(add-to-list 'load-path "~/.emacs.d/elpa/js2-mode-20180724.801/")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              (flycheck-add-mode 'javascript-eslint 'web-mode)
              (flycheck-mode))))

;; --- Python ---
;(add-hook 'python-mode-hook 'anaconda-mode)

;; 补全
;(elpy-enable)
;(setq elpy-rpc-backend "jedi")

;; --- Ruby ---
;(require 'rails)

(provide 'language)