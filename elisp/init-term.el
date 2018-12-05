;;; init-term.el --- Term's initialization file
;;; Commentary:

(add-to-list 'load-path "~/.emacs.d/elisp/emacswiki/multi-term")
(require 'multi-term)

;;; Code:
(setq multi-term-program "/bin/zsh")

;; Term
(defun xterm ()
  (interactive)
  (multi-term))

(defun get-buffer-with-name (name)
  (unless (get-buffer name)
    (multi-term)
    (rename-buffer name)))

(defun zsh ()
  (interactive)
  (get-buffer-with-name "zsh"))

(defun rails ()
  (interactive)
  (get-buffer-with-name "rails"))

(provide 'init-term)
;;; init-term.el ends here
