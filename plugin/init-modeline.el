(require 'doom-modeline)
(doom-modeline-init)
(setq doom-modeline-buffer-file-name-style 'file-name)
(setq-default mode-line-format
 (list
  '(:propertize " %l " face (:weight bold))
  'mode-line-mule-info
  'mode-line-modified
  'mode-line-remote " "
  '(:eval
    (propertize " %b "
     'face
     (if (buffer-modified-p)
      '(:background "#FF00FF" :foreground "#FDF6E3" :weight bold)
      '(:background "#FF00FF" :foreground "#FDF6E3" :weight normal))))
  '(:propertize " %p/%I " face (:background "#8A2BE2" :foreground "#FDF6E3"))
  '(:eval (propertize (concat " " (eyebrowse-mode-line-indicator) " ")))
  '(:eval
    (propertize (format-time-string " %p·%H:%M ")
     'help-echo
     (format-time-string "%F %a")
     'face
     '(:inherit 'font-lock-doc-face :background "#B7CEEB" :foreground "#404040")))
  '(:propertize vc-mode
    face
    (:inherit 'font-lock-keyword-face :background "#8B8386" :foreground "#76EE00" :weight bold))
  " %m "))

(provide 'init-modeline)
;;; init-modeline.el ends here
