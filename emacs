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

(load-theme 'tango-dark t)
(set-face-background 'default "0")

(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

(require 'evil)
(evil-mode 1)

(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; ansi-term
(global-set-key (kbd "C-x a") '(lambda ()(interactive)(ansi-term "/bin/zsh")))

;; Indent region
(global-set-key (kbd "C-\\") 'indent-region)

;; Use youdao dictionary
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

;; auto complete
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (mozc evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
