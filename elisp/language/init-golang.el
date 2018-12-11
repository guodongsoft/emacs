;;; init-golang.el --- Golang develop environment configure
;;; Commentary:

(require 'go-projectile)
(require 'go-mode)
(require 'go-errcheck)
(require 'lsp-go)

;;; Code:

;; 设置为t表示忽略大小写，设置为nil表示区分大小写
;; 默认情况下为smart，表示如果输入的字符串不含有大写字符才会忽略大小写
(setq ac-ignore-case t)

(add-hook 'before-save-hook 'gofmt-before-save)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;;;;;; go-mode ;;;;;;;
(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-go))
            (local-set-key (kbd "C-c c") 'go-errcheck)
            (setq ac-sources '(ac-source-go ac-source-abbrev ac-source-dictionary))
            #'flycheck-mode
            #'lsp-go-enable
            #'company-mode-on
            (company-mode)))
(set-variable 'gofmt-command "goimports")

;; 如果是Mac OS X系统，则需要借助exec-path-from-shell将GOPATH环境变量拷贝到emacs中
;; 具体问题可以参考https://github.com/purcell/exec-path-from-shell
;; 该插件在common目录下已经安装，此处可以直接使用
(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "GOPATH"))

;;;;; auto-complete ;;;;;;
;; 如果要使用company-go，则需要先安装gocode，请参考
;; https://github.com/nsf/gocode
(require 'go-autocomplete)

(require 'auto-complete-config)
(ac-config-default)

;;;;;; company-go ;;;;;;
;; company-go是auto-complete的一个替代品，比auto-complete小，
;; 但是功能和效果确实没有auto-complete好。
;;
;; 如果要使用company-go，则需要先安装gocode，请参考
;; https://github.com/nsf/gocode
;(add-to-list 'load-path (concat golang-config-dir "/company"))
;(require 'company)
;(require 'company-go)
;; Only use company-mode with company-go in go-mode
;; By default company-mode loads every backend it has.
;; If you want to only have company-mode enabled in go-mode add the following
;(add-hook 'go-mode-hook
;	  (lambda()
;	    (set (make-local-variable 'company-backends) '(company-go))
;	    (company-mode)))
;; Possible improvements
; (defun improve-company() 
;  (setq company-tooltip-limit 20)  ; bigger popup window
;  (setq company-idle-delay .3)     ; decrease delay before autocompletion popup shows
;  (setq company-echo-delay 0)      ; remove annoying blinking
;  (setq company-begin-commands '(self-insert-command))  ;; start autocompletion only after typing
;  )

(provide 'init-golang)
;;; init-golang.el ends here
