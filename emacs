;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;;;; 设置编辑环境
(set-language-environment "Japanese")
;; 设置默认读入文件编码
(prefer-coding-system 'utf-8)
;; 设置写入文件编码
(setq default-buffer-file-coding-system 'utf-8)
;; 设置emacs 使用 utf-8
(setq locale-coding-system 'utf-8)
;; 设置键盘输入时的字符编码
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
;; 文件默认保存为 utf-8
(set-buffer-file-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf8)
(set-default-coding-systems 'utf-8)
;; 解决粘贴中文出现乱码的问题
(set-clipboard-coding-system 'utf-8)
;; 终端中文乱码
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
;; 解决文件目录名乱码
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)

(setq tags-table-list
      '("~/work/project/J_SCORE_API"
        "~/work/ruby/rails/5.x/sample_app"
        "~/.emacs.d/source"))

(global-linum-mode t)

(defun set-theme () (load-theme 'tango-dark t))
(set-theme)
;;(set-face-background 'default "0")

(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

(require 'evil)
(evil-mode 1)

(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

(load (expand-file-name "~/.emacs.d/local/shell.el"))
(load (expand-file-name "~/.emacs.d/local/projectile.el"))

;; Indent region
(global-set-key (kbd "C-\\") 'indent-region)

;; Use youdao dictionary
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

;; Emmet
(global-set-key (kbd "C-c ,y") 'emmet-expand-yas)

;; Auto complete
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

;; Neotree
(require 'neotree)
(defun my-neotree-toggle ()
  (interactive)
  (neotree-toggle)
  (set-theme))
(global-set-key [f6] 'my-neotree-toggle)

(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)))

;; No bar
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
;;(menu-bar-mode -1)
;;(scroll-bar-mode -1)
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rspec-mode xwidgete ctags-update projectile-speedbar egg git-command package-utils emmet-mode mozc evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
