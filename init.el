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
        ("gnu"          . "http://elpa.gnu.org/packages/")
        ("elpy"         . "http://jorgenschaefer.github.io/packages/")
        ("melpa-cn"     . "http://elpa.emacs-china.org/melpa/")
        ("org-cn"       . "http://elpa.emacs-china.org/org/")
        ("gnu-cn"       . "http://elpa.emacs-china.org/gnu/"))
      package-enable-at-startup nil)
(when (version< emacs-version "27.0") (package-initialize))

;; use-package
;; ensure属性设为t: 若package未安装, 就安装该package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'load-path "/usr/share/emacs/site-lisp")

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'settings)

(cond
 ;; Mac OSX判定
 ((eq system-type 'darwin)
  (progn
   ;; default Latin font (e.g. Consolas)
   (set-face-attribute 'default nil :family "Monaco")

   ;; default font size (point * 10)
   ;;
   ;; WARNING!  Depending on the default font,
   ;; if the size is not supported very well, the frame will be clipped
   ;; so that the beginning of the buffer may not be visible correctly.
   (set-face-attribute 'default nil :height 120)

   ;; use specific font for Korean charset.
   ;; if you want to use different font size for specific charset,
   ;; add :size POINT-SIZE in the font-spec.
   (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

   ;; you may want to add different for other charset in this way.
   (set-fontset-font t 'japanese-jisx0208 (font-spec :family "Kochi Gothic"))
   ))

 ;; Linux判定
 ((eq system-type 'gnu/linux)
  (progn
    (set-face-attribute 'default nil :height 120)))

 (t nil))

(global-set-key (kbd "M-#") 'sort-lines)

;; diminish: 次模式在modeline中不显示, 只需显示主模式
(use-package diminish :ensure t)

(use-package bind-key :ensure t)

;; auto package update
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; 关闭菜单
;(menu-bar-mode -1)
;; 关闭文件滑动控件
;(scroll-bar-mode -1)
;; 关闭工具栏
(tool-bar-mode -1)

;; 匹配括号高亮
(show-paren-mode t)

;; 自动补全括号
(electric-pair-mode t)

;; 缩进默认设置
(setq-default
 ;; 缩进默认是2个空格
 tab-width 2
 standard-indent 2
 ;; Tab改为插入空格
 indent-tabs-mode nil)

;; hideshow
;; C-c @ C-a  -> show all
;; C-c @ C-h  -> hide
;; C-c @ C-s  -> show
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; パスワード暗号化
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; 显示加载时间
(defvar mage-init-time 'nil)
(defun mage-display-benchmark()
  "Mage display benchmark."
  (message
   "Mage loaded %s packages in %.03fs"
   (length package-activated-list)
   (or mage-init-time
       (setq mage-init-time
             (float-time (time-subtract (current-time) before-init-time))))))
(add-hook 'emacs-startup-hook #'mage-display-benchmark)

;; 显示行号
(use-package linum :ensure t)
(global-linum-mode t)
(set-face-foreground 'linum "orange")

;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)

;; 多行注释
(defun my-comment-or-uncomment-region (beg end &optional arg)
  "Comment or uncomment region (BEG END ARG)."
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end arg)
)
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)

;; （Y or N）
(fset 'yes-or-no-p 'y-or-n-p)

;; 快速打开配置文件
(defun open-init-file()
  "Open init file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; Tags
;;(setq tags-table-list
;;      '("~/work/project"
;;        "~/.emacs.d/source"))

;; Tramp
(use-package tramp :ensure t)

(auto-image-file-mode t)
(delete-selection-mode t)

;; indent region
(global-set-key (kbd "C-\\") 'indent-region)
;; Use youdao dictionary
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
;; Emmet
(global-set-key (kbd "C-c ,y") 'emmet-expand-yas)

;; 启动 Org-mode 文本内语法高亮
(use-package org :ensure t)

;; Icons
(use-package all-the-icons :ensure t)

;; Yasnippet
(use-package yasnippet
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
  (yas-global-mode)
  (use-package yasnippet-snippets :ensure t))

;; Markdown
(use-package markdown-mode :ensure t)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; (use-package autoinsert
;;   :ensure t
;;   :config
;;   (setq auto-insert-query nil)
;;   (setq auto-insert-directory (locate-user-emacs-file "templates/"))
;;   (add-hook 'find-file-hook 'auto-insert)
;;   (auto-insert-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-hunk-heading ((t (:background "#282822" :foreground "#00FFFF"))))
 '(magit-diff-lines-boundary ((t (:background "#blue" :foreground "#00FFFF"))))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-diff-removed-hightlight ((t (:background "#gray20" :foreground "#FF0000"))))
 '(magit-hash ((t (:foreground "red"))))
 '(magit-section-heading ((t (:background "#282822" :foreground "#00FFFF"))))
 '(magit-section-highlight ((((type tty)) nil)))
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil))))
 '(neo-dir-link-face ((t (:foreground "cyan"))))
 '(neo-file-link-face ((t (:foreground "white"))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "dark red"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-default ((t (:inherit variable-pitch :background "#E3E3E3" :foreground "black" :weight bold))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-modified ((t (:inherit tabbar-default :foreground "red"))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "#48D1CC"))))
 '(tabbar-selected-modified ((t (:inherit tabbar-default :background "#48D1CC" :foreground "red"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#C1FFC1"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-color-icons nil)
 '(auto-save-file-name-transforms (\` ((".*" (\, emacs-tmp-dir) t))))
 '(auto-save-list-file-prefix emacs-tmp-dir)
 '(backup-directory-alist (\` ((".*" \, emacs-tmp-dir))))
 '(column-number-mode t)
 '(comint-buffer-maximum-size 20000)
 '(comint-completion-addsuffix t)
 '(comint-get-old-input (lambda nil "") t)
 '(comint-input-ignoredups t)
 '(comint-input-ring-size 5000)
 '(comint-move-point-for-output nil)
 '(comint-prompt-read-only nil)
 '(comint-scroll-show-maximum-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(comment-style (quote multi-line))
 '(electric-pair-pairs (quote ((39 . 39))))
 '(evil-shift-with 2)
 '(explicit-shell-file-name shell-file-name)
 '(flycheck-disabled-checkers (quote (javascript-jshint javascript-jscs)))
 '(frame-title-format "%b" t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(inhibit-compacting-font-caches t t)
 '(inhibit-startup-screen t)
 '(install-elisp-repository-directory "~/.emacs.d/lisp/emacswiki")
 '(large-file-warning-threshold nil)
 '(line-number-mode t)
 '(linum-format "%4d")
 '(make-backup-files nil)
 '(multi-term-dedicated-close-back-to-open-buffer-p t)
 '(multi-term-dedicated-select-after-open-p t)
 '(multi-term-dedicated-skip-other-window-p t)
 '(multi-term-program shell-file-name)
 '(neo-theme (quote icons))
 '(org-src-fontify-natively t)
 '(package-selected-packages
   (quote
    (company-lsp lsp-go lsp-mode golint go-dlv flymake flymake-go flycheck-gometalinter go-errcheck company-go paredit-everywhere proceed all-the-icons tabbar yasnippet flycheck counsel go-projectile projectile color-theme go-autocomplete evil-paredit paredit evil-magit magit-gitflow auto-compile auto-complete company company-web company-ycmd magit js-comint js2-mode doom-modeline neotree rspec-mode xwidgete ctags-update projectile-speedbar egg git-command package-utils emmet-mode mozc evil use-package)))
 '(protect-buffer-bury-p nil)
 '(ring-bell-function (quote ignore))
 '(shell-file-name (skt:shell))
 '(show-paren-mode t)
 '(system-uses-terminfo nil t)
 '(tabbar-separator (quote (1.5)))
 '(tramp-default-method "ssh" nil (tramp)))

(provide 'init)
;;; init.el ends here
