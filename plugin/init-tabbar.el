(add-to-list 'load-path "~/.emacs.d/elpa/tabbar-20180726.1735")

(require 'tabbar)
(tabbar-mode t)
(global-set-key [(meta j)] 'tabbar-backward)
(global-set-key [(meta k)] 'tabbar-forward)

(global-set-key (kbd "<M-up>")    'tabbar-backward-group)
(global-set-key (kbd "<M-down>")  'tabbar-forward-group)
(global-set-key (kbd "<M-left>")  'tabbar-backward-tab)
(global-set-key (kbd "<M-right>") 'tabbar-forward-tab)

(setq
 tabbar-scroll-left-help-function nil ;don't show help information
 tabbar-scroll-right-help-function nil
 tabbar-help-on-tab-function nil
 tabbar-home-help-function nil
 tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
 tabbar-scroll-left-button (quote (("") ""))
 tabbar-scroll-right-button (quote (("") "")))

(defun my-tabbar-buffer-groups ()
 "Return the list of group names the current buffer belongs to.
 Return a list of one element based on major mode."
 (list
  (cond
   ((or (get-buffer-process (current-buffer))
     ;; Check if the major mode derives from `comint-mode' or `compilation-mode'.
     (tabbar-buffer-mode-derived-p
      major-mode '(comint-mode compilation-mode)))
    "Process")
   ((string-equal "*" (substring (buffer-name) 0 1)) "Emacs Buffer")
   ((eq major-mode 'dired-mode) "Dired")
   (t "User Buffer"))))

(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

; close default tabs，and move all files into one group
(setq tabbar-buffer-list-function
 (lambda ()
  (remove-if
   (lambda (buffer)
    (find (aref (buffer-name buffer) 0) " *"))
   (buffer-list))))
(setq tabbar-buffer-groups-function (lambda()(list "All")))
(set-face-attribute 'tabbar-button nil)

;;set tabbar's backgroud color
(set-face-attribute 'tabbar-default nil
                    :background "gray"
                    :foreground "gray30")
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :background "#9ACD32"
                    :foreground "#A05220"
                    :box '(:line-width 2 :color "gray") )
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 2 :color "gray"))

;; USEFUL: set tabbar's separator gap
(custom-set-variables '(tabbar-separator (quote (1.5))))

(provide 'init-tabbar)
