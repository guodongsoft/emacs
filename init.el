;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-archives
 '(("melpa"        . "http://melpa.org/packages/")
   ("melpa-stable" . "https://stable.melpa.org/packages/")
   ("melpa-cn"     . "http://elpa.emacs-china.org/melpa/")
   ("org-cn"       . "http://elpa.emacs-china.org/org/")
   ("gnu-cn"       . "http://elpa.emacs-china.org/gnu/")))
(package-initialize)

;; 显示加载时间
(defvar mage-init-time 'nil)
(defun mage-display-benchmark()
 (message "Mage loaded %s packages in %.03fs"
  (length package-activated-list)
  (or mage-init-time
   (setq mage-init-time
    (float-time (time-subtract (current-time) before-init-time))))))
(add-hook 'emacs-startup-hook #'mage-display-benchmark)

;; 关闭启动帮助画面
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

;; 在标题栏提示你目前在什么位置
(setq frame-title-format "%b")

;; 显示列号、行号
(setq column-number-mode t)
(setq line-number-mode t)

;; 关闭菜单
;;(menu-bar-mode 0)

;; 关闭文件滑动控件
;;(scroll-bar-mode 0)

;; 关闭工具栏
;;(tool-bar-mode 0)

;; 回车缩进
;(global-set-key "\C-m" 'newline-and-indent)
;(global-set-key (kbd "C-<return>") 'newline)

;; Autopair括号
(require 'autopair)
;; 自动补全括号
(autopair-global-mode)
;; 匹配括号高亮
(show-paren-mode t)

;; Tab 改为插入空格
(setq-default indent-tabs-mode nil)
;; C C++ 缩进4个空格
(setq c-basic-offset 4)
;; 没有这个 { } 就会瞎搞
(setq c-default-style "linux")
;; 缩进默认为2个空格
(setq default-tab-width 2)

;; Auto complete
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

;; Company补全
(global-company-mode t)
(add-to-list 'load-path "~/.emacs.d/company-mode")
(autoload 'company-mode "company" nil t)
(setq company-idle-delay 0.2;菜单延迟
      company-minimum-prefix-length 1; 开始补全字数0
      company-require-match nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil
      company-show-numbers t; 显示序号
      company-transformers '(company-sort-by-backend-importance)
      company-continue-commands '(not helm-dabbrev)
      )

(add-hook 'js-mode-hook     'js2-minor-mode)
(add-hook 'go-mode-hook     'company-mode)
(add-hook 'org-mode-hook    'company-mode)
(add-hook 'elisp-mode-hook  'company-mode)
(add-hook 'css-mode-hook    'company-mode)
(add-hook 'after-init-hook  'global-company-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'c-mode-hook      'company-mode)
(add-hook 'c++-mode-hook    'company-mode)

;; 设置编辑环境
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
;;(setenv "LC_ALL" "en_US.UTF-8")
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

;;关闭备份
(setq make-backup-files nil)

;;关闭哔哔的警告提示音
(setq ring-bell-function 'ignore)

;; （Y or N）
(fset 'yes-or-no-p 'y-or-n-p)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; Tags
;;(setq tags-table-list
;;      '("~/work/project"
;;        "~/.emacs.d/source"))

;; 显示行号
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(require 'linum)
(global-linum-mode t)
(setq linum-format "%4d\u2502")

(auto-image-file-mode t)
(delete-selection-mode t)

;; Evil
(require 'evil)
(evil-mode t)

;; Indent region
(global-set-key (kbd "C-\\") 'indent-region)

;; Use youdao dictionary
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

;; Emmet
(global-set-key (kbd "C-c ,y") 'emmet-expand-yas)

;; Themes
(defun set-theme ()
  (load-theme 'tango-dark t)
  ;; 透明
  (set-face-background 'default "0")
  )
(set-theme)

;; Neotree
(require 'neotree)
(defun my-neotree-toggle ()
 (interactive)
 (neotree-toggle)
 (set-theme))
(global-set-key [f6] 'my-neotree-toggle)
(setq neo-show-hidden-files t)

(add-hook 'neotree-mode-hook
 (lambda ()
  (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
  (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
  (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)))

;; Python补全
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;; 启动 Org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; Fonts
(set-default-font "Monaco-11")
(require 'all-the-icons)
(setq all-the-icons-color-icons nil)
(setq inhibit-compacting-font-caches t)
(setq neo-theme 'icons)

;; Helm
(require 'helm-config)
(global-set-key (kbd "C-x r b") #'helm-file-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode t)

;; TabBar and Gui
(require 'tabbar)  
(tabbar-mode t)  
(global-set-key [(meta j)] 'tabbar-backward)  
(global-set-key [(meta k)] 'tabbar-forward)  

;; MDwenjian
(add-to-list 'load-path "~/.emacs.d/markdown-mode/repository")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; Mode-Line
(require 'doom-modeline)
(doom-modeline-init)
(setq doom-modeline-buffer-file-name-style 'file-name)
(setq-default mode-line-format
              (list
               '(:propertize " %l " face (:weight bold))
               'mode-line-mule-info
               'mode-line-modified
               'mode-line-remote " "
               '(:eval (propertize " %b "
                                   'face
                                   (if (buffer-modified-p)
                                       '(:background "#FF00FF" :foreground "#FDF6E3" :weight bold)
                                     '(:background "#FF00FF" :foreground "#FDF6E3" :weight normal))))
               '(:propertize " %p/%I " face (:background "#8A2BE2" :foreground "#FDF6E3"))
               '(:eval (propertize (concat " " (eyebrowse-mode-line-indicator) " ")))
               '(:eval (propertize (format-time-string " %p·%H:%M ")
                                   'help-echo
                                   (format-time-string "%F %a")
                                   'face
                                   '(:inherit 'font-lock-doc-face :background "#B7CEEB" :foreground "#404040")))
               '(:propertize vc-mode
                             face
                             (:inherit 'font-lock-keyword-face :background "#8B8386" :foreground "#76EE00" :weight bold))
               " %m "))

;; ---------- 开发语言 ---------- Start

;; Common Lisp
(require 'cl)

;; SBCL
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

(load (expand-file-name "~/.emacs.d/local/shell.el"))
(load (expand-file-name "~/.emacs.d/local/projectile.el"))

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

;; ---------- 开发语言 ---------- End

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (neotree rspec-mode xwidgete ctags-update projectile-speedbar egg git-command package-utils emmet-mode mozc evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
