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
(if (eq system-type 'gnu/linux)
    (progn
      (package-install `base16-theme)
      (package-install `exwm)))
