;;; custom-shell.el --- Shell and term's settings file
;;; Commentary:

;;; Code:
;; shell の存在を確認
(defun skt:shell ()
  "Find shell."
  (or (executable-find "fish")
      (executable-find "zsh")
      (executable-find "bash")
      ;; (executable-find "f_zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
      ;; (executable-find "f_bash") ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
      (executable-find "cmdproxy")
      (error "Can't find 'shell' command in PATH!!")))

;; Shell 名の設定
(custom-set-variables
 '(shell-file-name (skt:shell))
 '(explicit-shell-file-name shell-file-name)

 ;; Emacs が保持する terminfo を利用する
 '(system-uses-terminfo nil)

 '(multi-term-program shell-file-name)

 ;; t: skip dedicated window when using `other-window'.
 '(multi-term-dedicated-skip-other-window-p t)

 ;; focus dedicated window after open
 '(multi-term-dedicated-select-after-open-p t)

 '(multi-term-dedicated-close-back-to-open-buffer-p t))

(setenv "SHELL" shell-file-name)

(eval-when-compile (require 'cl))
(use-package multi-term :ensure t)
(use-package fish-mode
  :ensure t
  :init
  (setq fish-indent-offset 2))

;; "C-z"、"C-x"、"C-c"、"C-h"、"C-y"、"<ESC>" のキーが奪われなくなりますので、ほとんどの操作は Emacs 的にできるはずです。
;; 他のキーも奪われたくなければ以下のようにキーを追加します。
;; emacs に認識させたいキーがある場合は、term-unbind-key-list に追加する
(add-to-list 'term-unbind-key-list "C-\\") ; IME の切り替えを有効とする
(add-to-list 'term-unbind-key-list "M-x")
(add-to-list 'term-unbind-key-list "C-q")
;; (add-to-list 'term-unbind-key-list "C-o")  ; IME の切り替えに C-o を設定している場合

;; terminal に直接通したいキーがある場合は、以下をアンコメントする
(delete "<ESC>" term-unbind-key-list)
;(delete "C-h" term-unbind-key-list)
;(delete "C-z" term-unbind-key-list)
;(delete "C-x" term-unbind-key-list)
;(delete "C-c" term-unbind-key-list)
;(delete "C-y" term-unbind-key-list)

(defun term-send-tab ()
  "Term send tab."
  (interactive)
  (term-send-raw-string "\C-i"))

;; Interrupt
(defadvice term-interrupt-subjob
  (around ad-term-interrupt-subjob activate)
  "Term send raw string."
  (term-send-raw-string "\C-c"))

;; Paste via helm interface
(defadvice insert-for-yank
  (around insert-for-yank-on-term (str) activate)
  "Check term mode."
  (if (eq major-mode 'term-mode)
      (term-send-raw-string (ad-get-arg 0))
    ad-do-it))

;; (lazyload (multi-term multi-term-dedicated-open) "multi-term" nil)

(custom-set-faces
 '(term-color-black ((t (:foreground "#3F3F3F" :background "#2B2B2B"))))
 '(term-color-red ((t (:foreground "#AC7373" :background "#8C5353"))))
 '(term-color-green ((t (:foreground "#7F9F7F" :background "#9FC59F"))))
 '(term-color-yellow ((t (:foreground "#DFAF8F" :background "#9FC59F"))))
 '(term-color-blue ((t (:foreground "#7CB8BB" :background "#4C7073"))))
 '(term-color-magenta ((t (:foreground "#DC8CC3" :background "#CC9393"))))
 '(term-color-cyan ((t (:foreground "#93E0E3" :background "#8CD0D3"))))
 '(term-color-white ((t (:foreground "#DCDCCC" :background "#656555"))))

 '(term-default-fg-color ((t (:inherit term-color-white))))
 '(term-default-bg-color ((t (:inherit term-color-black)))))

(add-hook 'term-mode-hook
          '(lambda ()
             ;;  mkdir -p ~/.terminfo
             ;;  tic -o ~/.terminfo /app/emacs/emacs/etc/e/eterm-color.ti
             ;; ~/.terminfo/65 -> ~/.terminfo/e
             ;; infocmp eterm-color
             (setenv "TERMINFO" "~/.terminfo")

             ;; keybind
             ;; C-h を term 内文字削除にする
             (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
             ;; C-y を term 内ペーストにする
             ;(define-key term-raw-map (kbd "C-y") 'term-paste)
             (define-key term-raw-map (kbd "M-d") 'term-send-forward-kill-word)
             (define-key term-raw-map (kbd "M-<backspace>") 'term-send-backward-kill-word)
             (define-key term-raw-map (kbd "M-w") 'term-send-backward-kill-word)
             (define-key term-raw-map (kbd "M-DEL") 'term-send-backward-kill-word)
             (define-key term-raw-map (kbd "TAB") 'term-send-tab)
 
             (define-key term-raw-map (kbd "M-j") 'multi-term-prev)
             (define-key term-raw-map (kbd "M-k") 'multi-term-next)

             (define-key term-raw-map (kbd "C-SPC") nil)
             (define-key term-raw-map (kbd "C-@") nil) ; for putty
             (define-key term-raw-map (kbd "C-v") nil)

             (setq system-uses-terminfo t)
             (setq term-default-bg-color nil)
             (setq term-default-fg-color nil)
             (setq multi-term-scroll-show-maximum-output t)

             (setq show-trailing-whitespace nil)))

;; C-x t で multi-term を起動する
(global-set-key (kbd "C-x t") '(lambda ()
                                 "Get shell buffer."
                                 (interactive)
                                 (multi-term)))

(require 'shell-pop)
;; multi-term に対応
(add-to-list 'shell-pop-internal-mode-list '("multi-term" "*terminal<1>*" '(lambda () (multi-term))))
(shell-pop-set-internal-mode "multi-term")
;; 35% の高さに分割する
(shell-pop-set-window-height 35)
(shell-pop-set-internal-mode-shell shell-file-name)

(defun my-shell-pop ()
  "Shell popup."
  (interactive)
  (if (cl-search "terminal" (buffer-name))
      (shell-pop-out)
    (shell-pop-up)))

;; ショートカットも好みで変更してください
(global-set-key [f4] 'my-shell-pop)

;; Aweshell
(add-to-list 'load-path "~/.emacs.d/lisp/aweshell")
(require 'aweshell)
(global-set-key [f5] 'aweshell-new)

(provide 'custom-shell)
;;; custom-shell.el ends here
