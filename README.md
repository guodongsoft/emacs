# 准备
## 1.使用pip 安装：rope jedi flake8 importmagic autopep8 yapf

## 2. 字体：打开emacs以后M-x all-the-icons-install-fonts

# Package
## 1.Start with this in init.el
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

# TAGS
find . -name "*.el" -or -name "*.c" | etags -

## Source
```
git://git.savannah.gnu.org/emacs.git
https://git.savannah.gnu.org/git/emacs.git
ssh://git.savannah.gnu.org:/srv/git/emacs.git
```

# EXWM
cp ~/.emacs.d/elpa/exwm*/xinitrc ~/.xinitrc
