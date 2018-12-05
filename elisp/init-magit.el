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

;(setq magit-gitflow-popup-key "C-n")
;(require 'magit-gitflow)
;(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(custom-set-faces
 ;; other faces
 '(magit-diff-added ((((type tty)) (:foreground "orange"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "orange"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "whitespace"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "red"))))
 '(magit-section-highlight ((((type tty)) nil))))

;; (custom-set-faces
;;  '(diff-added ((t (:foreground "orange" :background nil :inherit nil))))
;;  '(diff-removed ((t (:foreground "#00FF00" :background nil :inherit nil))))


 ;; ;; cursorが載っていない状態でのaddedのface
 ;; '(magit-diff-added ((t (:background "#282822" :foreground "#00FF00"))))
 ;; ;; cursorが載っている状態のaddedのface
 ;; '(magit-diff-added-highlight ((t (:background "#gray20" :foreground "#00FF00"))))
 ;; ;; cursor載っていない状態のremoved
 ;; '(magit-diff-removed ((t (:background "#282822" :foreground "#FF0000"))))
 ;; ;; cursor載っている状態のremoved
 ;; '(magit-diff-removed-highlight ((t (:background "#gray20" :foreground "#FF0000"))))

 ;; ;; lineを選択してstageしようとするときのface
 ;; '(magit-diff-lines-boundary ((t (:background "#blue" :foreground "#00FFFF"))))
 ;; '(magit-diff-lines-heading ((t (:background "#blue" :foreground "#00FFFF"))))

 ;; '(magit-diff-file-heading ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-file-heading-highlight ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-file-heading-selection ((t (:background "#282822" :foreground "#00FFFF"))))

 ;; '(magit-diff-hunk-heading ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-hunk-heading-highlight ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-hunk-heading-selection ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-hunk-region ((t (:background "#282822" :foreground "#00FFFF"))))

 ;; '(magit-diff-conflict-heading ((t (:background "#282822" :foreground "#00FFFF"))))

 ;; '(diff-our ((t (:foreground "orange" :background nil :inherit nil))))
 ;; '(diff-our-highlight ((t (:foreground "orange" :background nil :inherit nil))))

 ;; '(diff-base ((t (:foreground "orange" :background "#000000" :inherit nil))))
 ;; '(diff-base-highlight ((t (:foreground "orange" :background "#000000" :inherit nil))))

 ;; '(diff-context ((t (:foreground "orange" :background nil :inherit nil))))
 ;; '(diff-context-highlight ((t (:foreground "orange" :background nil :inherit nil))))

 ;; '(diff-diff-their ((t (:foreground "orange" :background nil :inherit nil))))
 ;; '(diff-diff-their-highlight ((t (:foreground "orange" :background nil :inherit nil))))

 ;; '(section-heading ((t (:foreground "orange" :background nil :inherit nil))))
 ;; '(section-heading-selection ((t (:foreground "orange" :background nil :inherit nil))))
 ;; '(section-highlight ((t (:foreground "orange" :background nil :inherit nil))))

;section-secondary-heading '((t :weight bold))

 ;; '(magit-diff-whitespace-warning ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-hash ((t (:foreground "red" :background nil :inherit nil)))))

(provide 'init-magit)
;;; init-magit.el ends here
