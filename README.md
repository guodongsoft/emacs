# Install
## 第一种方式：
- brew unlink emacs
- brew uninstall emacs
- brew install emacs --with-modules --with-cocoa --with-gnutls --with-librsvg --with-mailutils --with-imagemagick@6

## 第二种方式：
- https://emacsformacosx.com/builds

# Term
## 環境変数 TERM の設定
- # eterm-color.ti から生成した terminfo を利用する。tiファイルのパスは自分で判断して変更してください
- tic -o ~/.terminfo /usr/local/share/emacs/23.1/etc/e/eterm-color.ti
- # Mac OS X で app 形式の場合は以下のような場所にあります
- tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti
## Shell の設定ファイル (.zshrc、.bashrc 等) に以下ような設定を記述する 
- if [ "$EMACS" ];then
-   export TERM=Eterm-color
- fi

# All the icons
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
- go get -u -v github.com/golang/lint/golint
- gocode set autobuild true

# Js
- npm install -g eslint 
- npm install -g prettier
- npm install -g typescript

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
