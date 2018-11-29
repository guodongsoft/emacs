;; Zsh
(defun term()
  (interactive)
  (ansi-term "/bin/zsh"))

(defun get-buffer-with-name (name)
  (unless (get-buffer name)
    (ansi-term "/bin/zsh")
    (rename-buffer name)))

(defun zsh ()
  (interactive)
  (get-buffer-with-name "zsh"))

(defun rails ()
  (interactive)
  (get-buffer-with-name "rails"))
