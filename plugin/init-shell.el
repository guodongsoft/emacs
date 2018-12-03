;; Zsh
(defun xterm ()
  (interactive)
  (term "/bin/zsh"))

(defun get-buffer-with-name (name)
  (unless (get-buffer name)
    (term "/bin/zsh")
    (rename-buffer name)))

(defun zsh ()
  (interactive)
  (get-buffer-with-name "zsh"))

(defun rails ()
  (interactive)
  (get-buffer-with-name "rails"))

(provide 'init-shell)
