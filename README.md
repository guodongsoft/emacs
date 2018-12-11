# 字体
## 打开emacs以后M-x all-the-icons-install-fonts

# Python
## 使用pip 安装：rope jedi flake8 importmagic autopep8 yapf

# Go
- go get -u -v golang.org/x/tools/cmd/cover
- go get -u -v golang.org/x/tools/cmd/guru
- go get -u -v golang.org/x/tools/cmd/gorename
- go get -u -v golang.org/x/tools/cmd/goimports
- go get -u -v golang.org/x/tools/cmd/godoc
- go get -u -v github.com/derekparker/delve/cmd/dlv
- go get -u -v github.com/fatih/gomodifytags
- go get -u -v github.com/k0kubun/pp
- go get -u -v github.com/motemen/gore
- go get -u -v github.com/nsf/gocode
- go get -u -v github.com/jstemmer/gotags
- go get -u -v github.com/rogpeppe/godef
- go get -u -v github.com/sourcegraph/go-langserver
- go get -u -v github.com/golangci/golangci-lint/cmd/golangci-lint
- go get -u -v github.com/golang/lint/golint

# Js
- npm install -g eslint 
- npm install -g prettier

# Projectile
- C-c p ?
- C-c p D projectile-dired
- C-c p I projectile-ibuffer
- C-c p S projectile-save-project-buffers
- C-c p T projectile-find-test-file
- C-c p V projectile-browse-dirty-projects
- C-c p c projectile-compile-project
- C-c p d projectile-find-dir
- C-c p e projectile-recentf
- C-c p f projectile-find-file
- C-c p p projectile-switch-project
- C-c p s g projectile-grep
- C-c p s r projectile-ripgrep
- C-c p s s projectile-ag

# ag
apt-get install silversearcher-ag
brew install the_silver_searcher

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

# Source
```
git://git.savannah.gnu.org/emacs.git
https://git.savannah.gnu.org/git/emacs.git
ssh://git.savannah.gnu.org:/srv/git/emacs.git
```

# アップグレードする方法
```
以下のコマンドでアップグレードしてください。
そのためにはpackage-utilsパッケージが必要です。
M-x package-install package-utils (初めてアップグレードする場合のみ)
M-x package-utils-upgrade-by-name ample-theme
```

# EXWM
cp ~/.emacs.d/elpa/exwm*/xinitrc ~/.xinitrc
