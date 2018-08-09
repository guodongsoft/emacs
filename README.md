# Package
## 1.Start with this in .emacs
- (require 'package)
- (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
- (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
- (package-initialize)

## 2.Install script
- emacs --script install.el

# Quicklisp
## 1.Install
- see quicklisp/Install

## 2.Let Emacs know about SBCL and Quicklisp
- First in SBCL run:
```
(ql:quickload "quicklisp-slime-helper")
```

- Tell Emacs how to launch your Lisp environment
```
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
```

# EXWM
cp ~/.emacs.d/elpa/exwm*/xinitrc ~/.xinitrc
