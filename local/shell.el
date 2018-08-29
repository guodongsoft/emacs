;; Zsh
(defun new-zsh ()
  (interactive)
  (ansi-term "/bin/zsh"))

(defun get-buffer-with-name (name)
  (unless (get-buffer name)
    (new-zsh)
    (rename-buffer name)))

(defun zsh ()
  (interactive)
  (get-buffer-with-name "zsh"))

(defun rails ()
  (interactive)
  (get-buffer-with-name "rails"))
