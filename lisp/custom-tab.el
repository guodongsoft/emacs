;;; custom-tab.el --- Awesome bar's initialization file
;;; Commentary:

;;; Code:
(use-package awesome-tab
  :load-path "~/.emacs.d/lisp/emacswiki/awesome-tab.el"
  :config
  (awesome-tab-mode t)
  )
(global-set-key [(meta j)] 'awesome-tab-backward)
(global-set-key [(meta k)] 'awesome-tab-forward)

(global-set-key (kbd "<M-up>")    'awesome-tab-backward-group)
(global-set-key (kbd "<M-down>")  'awesome-tab-forward-group)
(global-set-key (kbd "<M-left>")  'awesome-tab-backward-tab)
(global-set-key (kbd "<M-right>") 'awesome-tab-forward-tab)

(defun awesome-tab-hide-tab-function (x)
  (let ((name (format "%s" x)))
    (and
     (not (string-prefix-p "*epc" name))
     (not (string-prefix-p "*helm" name))
     (not (string-prefix-p "*Compile-Log*" name))
     (not (string-prefix-p "*lsp" name))
     (not (and (string-prefix-p "magit" name)
               (not (file-name-extension name))))
     )))

(provide 'custom-tab)
;;; custom-tab.el ends here
