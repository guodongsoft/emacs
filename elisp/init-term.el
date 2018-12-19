;;; init-term.el --- Term's initialization file
;;; Commentary:

;;; Code:
;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
 ;; PATH と exec-path に同じ物を追加します
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))

(setenv "MANPATH" (concat "/usr/local/man:/usr/share/man:/Developer/usr/share/man:/sw/share/man" (getenv "MANPATH")))

;; shell の存在を確認
(defun skt:shell ()
  (or (executable-find "zsh")
      (executable-find "bash")
      ;; (executable-find "f_zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
      ;; (executable-find "f_bash") ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
      (executable-find "cmdproxy")
      (error "can't find 'shell' command in PATH!!")))

;; Shell 名の設定
(setq shell-file-name (skt:shell))
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)

;; Emacs が保持する terminfo を利用する
(setq system-uses-terminfo nil)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(eval-when-compile (require 'cl))
(use-package multi-term :ensure t)
(setq multi-term-program shell-file-name)

;; "C-z"、"C-x"、"C-c"、"C-h"、"C-y"、"<ESC>" のキーが奪われなくなりますので、ほとんどの操作は Emacs 的にできるはずです。
;; 他のキーも奪われたくなければ以下のようにキーを追加します。
(add-to-list 'term-unbind-key-list '"M-x")

(add-hook 'term-mode-hook
          '(lambda ()
             ;; C-h を term 内文字削除にする
             (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
             ;; C-y を term 内ペーストにする
             (define-key term-raw-map (kbd "C-y") 'term-paste)))

(global-set-key (kbd "C-x t") '(lambda ()
                                 "Get shell buffer."
                                 (interactive)
                                 (multi-term)))

(require 'shell-pop)
;; multi-term に対応
(add-to-list 'shell-pop-internal-mode-list '("multi-term" "*terminal<1>*" '(lambda () (multi-term))))
(shell-pop-set-internal-mode "multi-term")
;; 25% の高さに分割する
(shell-pop-set-window-height 25)
(shell-pop-set-internal-mode-shell shell-file-name)

(defun my-shell-pop ()
  (interactive)
  (if (cl-search "terminal" (buffer-name))
      (shell-pop-out)
    (shell-pop-up)))

;; ショートカットも好みで変更してください
(global-set-key [f4] 'my-shell-pop)

(provide 'init-term)
;;; init-term.el ends here
