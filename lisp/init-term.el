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

;; (setenv "CDPATH" "/")
(setenv "CDPATH" (concat (replace-regexp-in-string
                          "\\\\" "/" (getenv "HOME"))))

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

(eval-when-compile (require 'cl) (require 'multi-term) (require 'term))

(use-package multi-term :ensure t)
(setq multi-term-program shell-file-name)

;; "C-z"、"C-x"、"C-c"、"C-h"、"C-y"、"<ESC>" のキーが奪われなくなりますので、ほとんどの操作は Emacs 的にできるはずです。
;; 他のキーも奪われたくなければ以下のようにキーを追加します。
;; emacs に認識させたいキーがある場合は、term-unbind-key-list に追加する
(add-to-list 'term-unbind-key-list "C-\\") ; IME の切り替えを有効とする
(add-to-list 'term-unbind-key-list "M-x")
(add-to-list 'term-unbind-key-list "C-q")
;; (add-to-list 'term-unbind-key-list "C-o")  ; IME の切り替えに C-o を設定している場合

;; terminal に直接通したいキーがある場合は、以下をアンコメントする
(delete "<ESC>" term-unbind-key-list)
;; (delete "C-h" term-unbind-key-list)
;; (delete "C-z" term-unbind-key-list)
;; (delete "C-x" term-unbind-key-list)
;; (delete "C-c" term-unbind-key-list)
;; (delete "C-y" term-unbind-key-list)

;; t: skip dedicated window when using `other-window'.
(setq multi-term-dedicated-skip-other-window-p t)

;; focus dedicated window after open
(setq multi-term-dedicated-select-after-open-p t)

(setq multi-term-dedicated-close-back-to-open-buffer-p t)

(defun term-send-tab ()
  (interactive)
  (term-send-raw-string "\C-i"))

;; interrupt
(defadvice term-interrupt-subjob
  (around ad-term-interrupt-subjob activate)
  (term-send-raw-string "\C-c"))

;; paste via helm interface
(defadvice insert-for-yank
  (around insert-for-yank-on-term (str) activate)
  (if (eq major-mode 'term-mode)
      (term-send-raw-string (ad-get-arg 0))
    ad-do-it))

;; (lazyload (multi-term multi-term-dedicated-open) "multi-term" nil)

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
 
             (define-key term-raw-map (kbd "C-c p") 'multi-term-prev)
             (define-key term-raw-map (kbd "C-c n") 'multi-term-next)

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
