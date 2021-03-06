;;; custom-modeline.el --- Modeline's initialization file
;;; Commentary:

(require 'doom-modeline)

;; diminish: 次模式在modeline中不显示, 只需显示主模式
(use-package diminish :ensure t)

;;; Code:
;; 文字コード表示
(doom-modeline-init)
(setq doom-modeline-buffer-file-name-style 'file-name)
(setq-default mode-line-format
 (list
  '(:propertize " %l/%c " face (:weight bold))
  'mode-line-modified
  'mode-line-remote " "
  '(:eval
    (propertize " %b "
     'face
     (if (buffer-modified-p)
      '(:background "red" :foreground "#404040" :weight bold)
      '(:background "#B7CEEB" :foreground "#404040" :weight normal))))
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
  '(:propertize " %m " face (:background "#8A2BE2" :foreground "#FDF6E3"))
  '(:eval (propertize (concat " " (symbol-name buffer-file-coding-system) " ")))))

(provide 'custom-modeline)
;;; custom-modeline.el ends here
