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
;; 设置为中文简体语言环境
;;(set-language-environment 'Chinese-GB)
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

(setq tags-table-list '("~/.emacs.d/source"))

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

;; Zsh
(defun new-zsh ()
  (interactive)
  (ansi-term "/bin/zsh"))

(defun get-buffer-with-name (name)
  (unless (get-buffer name)
    (new-zsh)
    (rename-buffer name)))

(defun zsh ()
  (interactive)
  (get-buffer-with-name "zsh"))

(defun rails ()
  (interactive)
  (get-buffer-with-name "rails"))

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

;; Projectile
;; 默认全局使用
(projectile-global-mode)
;; 默认打开缓存
(setq projectile-enable-caching t)
;; 使用f5键打开默认文件搜索
(global-set-key [f5] 'projectile-find-file)

(projectile-mode +1)
(projectile-rails-global-mode)
;;(define-key key-translation-map (kbd "C-c ,") (kbd "C-c r"))
;;(define-key key-translation-map (kbd "C-c .") (kbd "C-c r !"))

(setq projectile-switch-project-action 'neotree-projectile-action)
(defun neotree-ffip-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
	(file-name (buffer-file-name)))
    (if project-dir
	(progn
	  (neotree-dir project-dir)
	  (neotree-find file-name))
      (message "Could not find git project root."))))
(define-key projectile-mode-map (kbd "C-c C-p") 'neotree-ffip-project-dir)

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
