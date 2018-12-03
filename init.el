;;; init.el --- Initialization file for Emacs.
;;; Commentary:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

;;; Code:
(setq package-archives
      '(("melpa"        . "http://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("marmalade"    . "http://marmalade-repo.org/packages/")
        ("elpy"         . "http://jorgenschaefer.github.io/packages/")
        ("gnu"          . "http://elpa.gnu.org/packages/"))
      package-enable-at-startup nil)
(package-initialize)

;; パスワード暗号化
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

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
(set-face-foreground 'linum "orange")

;; 关闭菜单
;;(menu-bar-mode 0)

;; 关闭文件滑动控件
;;(scroll-bar-mode 0)

;; 关闭工具栏
;;(tool-bar-mode 0)

;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)

;; 多行注释
(setq comment-style 'multi-line)
(defun my-comment-or-uncomment-region (beg end &optional arg)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end arg)
)
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)

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
(autoload 'company-mode "company" nil t)
(setq company-idle-delay 0.2;菜单延迟
      company-minimum-prefix-length 1; 开始补全字数0
      company-require-match nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil
      company-show-numbers t; 显示序号
      company-transformers '(company-sort-by-backend-importance)
      company-continue-commands '(not helm-dabbrev))

(add-hook 'org-mode-hook    'company-mode)
(add-hook 'css-mode-hook    'company-mode)
(add-hook 'c-mode-hook      'company-mode)
(add-hook 'c++-mode-hook    'company-mode)
(add-hook 'after-init-hook  'global-company-mode)

;; 关闭备份
(setq make-backup-files nil)

;; 关闭哔哔的警告提示音
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

;; indent region
(global-set-key (kbd "C-\\") 'indent-region)

;; Use youdao dictionary
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

;; Emmet
(global-set-key (kbd "C-c ,y") 'emmet-expand-yas)

;; 启动 Org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; Fonts
(set-default-font "Monaco-11")
(require 'all-the-icons)
(setq all-the-icons-color-icons nil)
(setq inhibit-compacting-font-caches t)
(setq neo-theme 'icons)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Helm
;(require 'helm-config)
;(global-set-key (kbd "C-x r b") #'helm-file-bookmarks)
;(global-set-key (kbd "C-x C-f") #'helm-find-files)
;(global-set-key (kbd "M-x") 'helm-M-x)
;(helm-mode t)

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
(add-to-list 'load-path "~/.emacs.d/plugin")
(require 'config)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(neo-dir-link-face ((t (:foreground "cyan"))))
 '(neo-file-link-face ((t (:foreground "white")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (clj-refactor js-comint neotree rspec-mode xwidgete ctags-update projectile-speedbar egg git-command package-utils emmet-mode mozc evil)))
 '(tabbar-separator (quote (1.5))))

(provide 'init)
