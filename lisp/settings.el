;;; settings.el --- Settings file
;;; Commentary:

;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp/emacswiki")
(add-to-list 'load-path "~/.emacs.d/lisp/emacswiki/common")

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))

(defun set-theme ()
  "Load tango-dark theme."
  (load-theme 'tango-dark t)
  ;; 透明
  (set-face-background 'default nil))
(set-theme)

;; Evil
(use-package evil :ensure t)
(evil-mode t)

(defvar require-list)
(setq require-list
      '(
        install-elisp
        custom-variables
        custom-term
        custom-anything
        custom-company
        custom-dired
        custom-ivy
        custom-magit
        custom-modeline
        custom-tabbar
        encoding
        language
        project
        yaml-mode
        ))

(dolist (req require-list)
  (require req))

(provide 'settings)
;;; settings.el ends here
