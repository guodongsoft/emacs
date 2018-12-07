;;; init-project.el --- Project's initialization file
;;; Commentary:

;; Projectile
(require 'projectile)
(add-to-list 'load-path "~/.emacs.d/elisp/emacswiki/find-file-in-project")
(require 'find-file-in-project)

;;; Code:
(projectile-mode)
;; 默认打开缓存
(setq projectile-enable-caching t)
;; 使用f5键打开默认文件搜索
(global-set-key [f5] 'projectile-find-file)

(projectile-mode t)

;; Neotree
(require 'neotree)
(setq projectile-switch-project-action 'neotree-projectile-action)
(defun neotree-ffip-project-dir ()
 "Open NeoTree using the git root."
 (interactive)
 (let ((project-dir (ffip-project-root))
       (file-name (buffer-file-name)))
  (if project-dir
   (progn
    (neotree-dir project-dir)
    (neotree-find file-name))
   (message "Could not find git project root."))))
(define-key projectile-mode-map (kbd "<f3>") 'neotree-ffip-project-dir)

(defun my-neotree-toggle ()
 "Toggle NeoTree."
 (interactive)
 (neotree-toggle)
 (set-theme))
(global-set-key [f6] 'my-neotree-toggle)
(setq neo-show-hidden-files t)

(add-hook 'neotree-mode-hook
 (lambda ()
  (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
  (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
  (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)))

(provide 'init-project)
;;; init-project.el ends here
