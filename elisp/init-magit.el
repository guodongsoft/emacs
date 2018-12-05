;;; init-magit.el --- Magit's initialization file
;;; Commentary:

;; Magit
;;; Code:
(require 'magit)
(require 'evil-magit)

(setq-default magit-auto-revert-mode nil)
(setq vc-handled-backends '())
(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))
(bind-key "C-x m" 'magit-status)
(bind-key "C-c l" 'magit-blame)

(custom-set-faces
 ;; other faces
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) nil))))

(provide 'init-magit)
;;; init-magit.el ends here
