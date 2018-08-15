(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(with-no-warnings (require 'cl))

(package-refresh-contents)

(package-install 'package-utils)
(package-install 'all-the-icons)
(package-install 'hydra)
(package-install 'bundler)
(package-install 'yasnippet-snippets)
(package-install 'yasnippet-classic-snippets)

(package-install 'discover)
(package-install 'discover-my-major)
(package-install 'discover-js2-refactor)
(package-install 'discover-clj-refactor)

;; molokai 配色
;;(package-install 'molokai-theme)
;;(package-install 'dracula-theme)

;; 文件列表
(package-install 'neotree)
(package-install 'sr-speedbar)
(package-install 'imenu-list)
;; 标签页
;;(package-install 'tabbar)
;; 自动保存
(package-install 'super-save)
;; 窗口操作
(package-install 'popwin)
;; 窗口跳转
(package-install 'window-numbering)
;; 目录增强
;;(package-install 'dired+)
;; 打开当前文件目录
(package-install 'direx)
;; 打开外部应用
(package-install 'crux)
;; undo
(package-install 'undo-tree)
;; editorconfig
(package-install 'editorconfig)
;; exec form path
(package-install 'exec-path-from-shell)

;;快速操作
;;(package-install 'helm)
(package-install 'swiper)
(package-install 'counsel)
(when (eq system-type 'darwin)
 (package-install 'counsel-osx-app))
;;(package-install 'ecb)
;;(package-install 'smex)
;; vim 模式
(package-install 'evil)
;; 按键提示
(package-install 'which-key)

(package-install 'find-file-in-project)

;; 搜索
(package-install 'avy)
(package-install 'ag)
(package-install 'ace-jump-mode)
;;(package-install 'helm-ag)

;; 多光标
(package-install 'iedit)

;; 中文输入法
;;(package-install 'chinese-pyim)

(package-install 'mozc)

;;彩虹猫
;;(package-install 'nyan-mode)

;; 有道词典
(package-install 'youdao-dictionary)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 开发插件
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(package-install 'sql-impala)

;; 代码片段补全
(package-install 'yasnippet)
;; 智能提示
(package-install 'company)
(package-install 'company-ycmd)
(package-install 'company-web)
(package-install 'company-c-headers)
(package-install 'auto-complete)

;; 代码帮助
(if (eq system-type 'darwin)
 (package-install 'dash-at-point)
 (package-install 'zeal-at-point))

;; 代码跳转
;;(package-install 'xcscope)
;;(package-install 'ggtags)
(package-install 'ctags-update)

;; 代码检查
(package-install 'flycheck)
(package-install 'flycheck-ycmd)
;;(package-install 'flycheck-google-cpplint)

;; Google c style
;;(package-install 'google-c-style)

;; Git
(package-install 'egg)
;;(package-install 'magit)
;;(package-install 'git-gutter)

;; 自动添加匹配括号
(package-install 'smartparens)
;; 高亮括号
(package-install 'highlight-parentheses)
;; 缩进线
(package-install 'indent-guide)
;; 缩进对齐
(package-install 'aggressive-indent)
;; 扩展选择区域
(package-install 'expand-region)

;; Markdown
(package-install 'markdown-mode)

;; Web
(package-install 'web-mode)
(package-install 'emmet-mode)

;; Yaml
(package-install 'yaml-mode)

;; Javascript
(package-install 'js2-mode)

;; Projectile
(package-install 'projectile-direnv)
(package-install 'projectile-rails)
(package-install 'projectile-variable)

(package-install 'rspec-mode)

;; Python
;;(package-install 'anaconda-mode)
;;(package-install 'elpy)

;; Go
;;(package-install 'go-mode)
;;(package-install 'company-go)

;; system operation check
;; (when (eq system-type 'gnu/linux)
;;  (package-install `exwm))
