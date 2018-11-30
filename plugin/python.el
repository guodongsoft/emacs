;; Python
(add-hook 'python-mode-hook 'anaconda-mode)

;; 补全
(elpy-enable)
(setq elpy-rpc-backend "jedi")
