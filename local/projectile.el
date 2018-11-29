;; Projectile
;; 默认全局使用
(projectile-global-mode)
;; 默认打开缓存
(setq projectile-enable-caching t)
;; 使用f5键打开默认文件搜索
(global-set-key [f5] 'projectile-find-file)

(projectile-mode +1)

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

(load (expand-file-name "~/.emacs.d/local/rails.el"))
