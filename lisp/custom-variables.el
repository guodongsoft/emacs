;;; custom-variables.el --- Custom variables setting.
;;; Commentary:

;;; Code:
(custom-set-variables
 '(backup-directory-alist `((".*" . ,emacs-tmp-dir)))
 '(auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
 '(auto-save-list-file-prefix emacs-tmp-dir)

 '(tramp-default-method "ssh")          ; uses ControlMaster

 '(comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
 '(comint-scroll-to-bottom-on-output nil) ; always add output at the bottom
 '(comint-scroll-show-maximum-output t) ; scroll to show max possible output
 ;'(comint-completion-autolist t)        ; show completion list when ambiguous
 '(comint-input-ignoredups t)           ; no duplicates in command history
 '(comint-completion-addsuffix t)       ; insert space/slash after file completion
 '(comint-buffer-maximum-size 20000)    ; max length of the buffer in lines
 '(comint-prompt-read-only nil)         ; if this is t, it breaks shell-command
 '(comint-get-old-input (lambda () "")) ; what to run when i press enter on a
                                        ; line above the current prompt
 '(comint-input-ring-size 5000)         ; max shell history size
 '(protect-buffer-bury-p nil)
 '(evil-shift-with 2)

 ;; 启动 Org-mode 文本内语法高亮
 '(org-src-fontify-natively t)

 '(all-the-icons-color-icons nil)
 '(inhibit-compacting-font-caches t)
 '(neo-theme 'icons)

 ;; 关闭启动帮助画面
 '(inhibit-startup-screen t)
 '(inhibit-startup-message t)
 '(inhibit-splash-screen t)

 ;; 在标题栏提示你目前在什么位置
 '(frame-title-format "%b")

 ;; 显示列号、行号
 '(column-number-mode t)
 '(line-number-mode t)

 ;'(linum-format "%4d\u2502")
 '(linum-format "%4d")

 ;; 多行注释
 '(comment-style 'multi-line)

 ;; 关闭备份
 '(make-backup-files nil)

 ;; 关闭哔哔的警告提示音
 '(ring-bell-function 'ignore)

 ;; 自动补全括号
 '(electric-pair-pairs '((?\' . ?\')))

 ;; Emacs Wiki
 '(install-elisp-repository-directory "~/.emacs.d/lisp/emacswiki")
)

(provide 'custom-variables)
;;; custom-variables.el ends here
