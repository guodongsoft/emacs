(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(package-refresh-contents)
(package-install `auto-complete)
(package-install `youdao-dictionary)
(package-install `markdown-mode)

;; system operation check
;; (when (eq system-type 'gnu/linux)
;;  (package-install `exwm))
