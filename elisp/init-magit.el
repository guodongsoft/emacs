;;; init-magit.el --- Magit's initialization file
;;; Commentary:

;; Magit
;;; Code:
(require 'magit)
(require 'magit-diff)
(setq-default magit-auto-revert-mode nil)
(setq vc-handled-backends '())
(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))
(bind-key "C-x m" 'magit-status)
(bind-key "C-c l" 'magit-blame)


(custom-set-faces
 '(diff-added ((t (:foreground "orange" :background nil :inherit nil))))
 '(diff-removed ((t (:foreground "#00FF00" :background nil :inherit nil))))

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

 ;; '(magit-diff-our ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-our-highlight ((t (:background "#282822" :foreground "#00FFFF"))))

 ;; '(magit-diff-base ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-base-highlight ((t (:background "#282822" :foreground "#00FFFF"))))

 ;; '(magit-diff-context ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-context-highlight ((t (:background "#282822" :foreground "#00FFFF"))))

 ;; '(magit-diff-their ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-their-highlight ((t (:background "#282822" :foreground "#00FFFF"))))

 ;; '(magit-section-heading ((t (:background "#282822" :foreground "#00FFFF"))))
 ;; '(magit-diff-whitespace-warning ((t (:background "#282822" :foreground "#00FFFF"))))
 '(magit-hash ((t (:foreground "red")))))

(provide 'init-magit)
;;; init-magit.el ends here
