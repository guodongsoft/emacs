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
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

(provide 'init-project)
;;; init-project.el ends here
