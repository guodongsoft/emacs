;;; project.el --- Project's initialization file
;;; Commentary:

;; Projectile
;;; Code:
(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (projectile-mode t)
  (setq projectile-completion-system 'ivy)
  ;; 默认打开缓存
  (setq projectile-enable-caching t)
  (use-package counsel-projectile
    :ensure t))

(use-package ag :ensure t)

;; 使用f7键打开内容搜索
(global-set-key [f7] 'projectile-ag)

;; Neotree
(use-package neotree :ensure t)
(setq inhibit-compacting-font-caches t)
(setq neo-theme 'icons)

;; 显示隐藏文件
(setq neo-show-hidden-files t)
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(global-set-key [f6] 'neotree-toggle)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
            (neotree-dir project-dir)
            (neotree-find file-name)))
      (message "Could not find git project root."))))
(global-set-key [f8] 'neotree-project-dir)

(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "o")   'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q")   'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "g")   'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n")   'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p")   'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A")   'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H")   'neotree-hidden-file-toggle)

(global-set-key [f9] 'projectile-switch-project)

(provide 'project)
;;; project.el ends here
