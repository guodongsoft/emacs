;;; settings.el --- Settings file
;;; Commentary:

;;; Code:
;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              (expand-file-name "~/.cargo/bin")
              (expand-file-name "~/Library/Python/2.7/bin")
              ))
 ;; PATH と exec-path に同じ物を追加します
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))

;; MANPATH
(setenv "MANPATH" (concat "/usr/local/man:/usr/share/man:/Developer/usr/share/man:/sw/share/man" (getenv "MANPATH")))

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
        custom-shell
        custom-anything
        custom-company
        custom-dired
        custom-ivy
        custom-magit
        custom-modeline
        ;custom-org
        custom-pair
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
