# 准备
## 1.使用pip 安装：rope jedi flake8 importmagic autopep8 yapf

## 2. 字体：打开emacs以后M-x all-the-icons-install-fonts

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

## TAGS
find . -name "*.el" -or -name "*.c" | etags -

## Source
```
git://git.savannah.gnu.org/emacs.git
https://git.savannah.gnu.org/git/emacs.git
ssh://git.savannah.gnu.org:/srv/git/emacs.git
```

## アップグレードする方法
```
以下のコマンドでアップグレードしてください。
そのためにはpackage-utilsパッケージが必要です。
M-x package-install package-utils (初めてアップグレードする場合のみ)
M-x package-utils-upgrade-by-name ample-theme
```

# EXWM
cp ~/.emacs.d/elpa/exwm*/xinitrc ~/.xinitrc
