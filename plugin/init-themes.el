;; Themes
(defvar my-themes '(zenburn-theme
                   monokai-theme
                   idea-darkula-theme
                   jazz-theme
                   planet-theme 
                   obsidian-theme))

(dolist (theme my-themes)
  (unless (package-installed-p theme)
    (eval `(use-package ,theme :ensure t :defer t))))

(defun set-theme ()
  (load-theme 'tango-dark t)
  ;; 透明
  (set-face-background 'default "0"))
(set-theme)

(provide 'init-themes)
