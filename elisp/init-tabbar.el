;;; init-tabbar.el --- Tabbar's initialization file
;;; Commentary:

;;; Code:
(require 'tabbar)
(tabbar-mode t)
(global-set-key [(meta j)] 'tabbar-backward)
(global-set-key [(meta k)] 'tabbar-forward)

(global-set-key (kbd "<M-up>")    'tabbar-backward-group)
(global-set-key (kbd "<M-down>")  'tabbar-forward-group)
(global-set-key (kbd "<M-left>")  'tabbar-backward-tab)
(global-set-key (kbd "<M-right>") 'tabbar-forward-tab)

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode nil)
;; グループ化しない
(setq tabbar-buffer-groups-function nil)
;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
        (set btn (cons (cons "" nil)
                 (cons "" nil))))
;; ウインドウからはみ出たタブを省略して表示
(setq tabbar-auto-scroll-flag nil)
;; タブとタブの間の長さ
(setq tabbar-separator '(1.5))

;; the color of the tabbar background
(setq tabbar-background-color "#E3E3E3")

(defun my-tabbar-buffer-groups ()
 "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
 (list
  (cond
   ((or
     (get-buffer-process (current-buffer))
     ;; Check if the major mode derives from `comint-mode' or `compilation-mode'.
     (tabbar-buffer-mode-derived-p
      major-mode '(comint-mode compilation-mode)))
     "Process")
   ((string-equal "*" (substring (buffer-name) 0 1)) "Emacs Buffer")
   ((eq major-mode 'dired-mode) "Dired")
   (t "User Buffer"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

(provide 'init-tabbar)
;;; init-tabbar.el ends here
