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

;; 显示行号
(require 'linum)
(global-linum-mode t)
(setq linum-format "%4d\u2502")

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

;; 缩进默认设置
(setq-default
 ;; 缩进默认是2个空格
 tab-width 2
 standard-indent 2
 ;; Tab 改为插入空格
 indent-tabs-mode nil)
;; C C++ 缩进4个空格
(setq c-basic-offset 4)
;; 没有这个 { } 就会瞎搞
(setq c-default-style "linux")

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

(add-hook 'org-mode-hook    'company-mode)
(add-hook 'css-mode-hook    'company-mode)
(add-hook 'c-mode-hook      'company-mode)
(add-hook 'c++-mode-hook    'company-mode)
(add-hook 'after-init-hook  'global-company-mode)

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

(add-to-list 'load-path "/usr/share/emacs/site-lisp")

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

;; MDwenjian
(add-to-list 'load-path "~/.emacs.d/markdown-mode/repository")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; Plugin
(setq plugin_dir "~/.emacs.d/plugin")
(dolist (file (directory-files plugin_dir nil "^[^.].*[.]el$"))
  (if (not (file-directory-p file))
      (load (expand-file-name (concat plugin_dir "/" file)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (js-comint neotree rspec-mode xwidgete ctags-update projectile-speedbar egg git-command package-utils emmet-mode mozc evil)))
 '(tabbar-separator (quote (1.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
