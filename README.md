# Emacs インストール #

## Mac ##

### 第一种方式： ###

- brew unlink emacs
- brew uninstall emacs
- brew install emacs --with-modules --with-cocoa --with-gnutls --with-librsvg --with-mailutils --with-imagemagick@6

### 第二种方式： ###

- https://emacsformacosx.com/builds

## Ubuntu ##

### configure && make ###

- sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev
- for gtk3 build replace libgtk2.0-dev with libgtk-3-dev
- git clone --depth=1 git://git.savannah.gnu.org/emacs.git
- ./autogen.sh # not needed when installing from tarball
- ./configure
- make bootstrap
- sudo make install

### use the package ###

- sudo add-apt-repository -y ppa:ubuntu-elisp
- sudo apt-get update
- sudo apt-get install emacs-snapshot

-------------------------------------------------------------------------------

# Term color #

- eterm-color.ti から生成した terminfo を利用する。tiファイルのパスは自分で判断して変更してください
- tic -o ~/.terminfo /usr/local/share/emacs/23.1/etc/e/eterm-color.ti
- Mac OS X で app 形式の場合は以下のような場所にあります
- tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti

-------------------------------------------------------------------------------

# fish #

## fish インストール ##

### Ubuntu ###

- sudo apt-add-repository ppa:fish-shell/release-2
- sudo apt-get update
- sudo apt-get install fish

### Mac ###

- brew install fish

## fisherman インストール ##

- curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

## fishのテーマ変更 ##

- どのようなテーマがあるかは、以下ページが参考になります。
- https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md
- ここで「bobthefish」というテーマを利用しており、以下手順でインストールしています。
- fisher omf/theme-bobthefish

-------------------------------------------------------------------------------

# Powerline #

## Powerline インストール ##

### Ubuntu ###

- sudo apt-get install powerline

### Mac ###

- pip install psutil
- pip install powerline-shell

## Powerline fonts ##

### Ubuntu ###

- sudo apt-get install fonts-powerline

### Other environments ###

- git clone https://github.com/powerline/fonts.git --depth=1
- fonts/install.sh
- rm -rf fonts

## Redefine fish_prompt in ~/.config/fish/config.fish ##

- function fish_prompt
-   powerline-shell --shell bare $status
- end

-------------------------------------------------------------------------------

# Markdown #

## 编辑命令 ##

- C-c C-t n 插入 hash 样式的标题，其中 n 为 1~5，表示从第一级标题到第五级标题。
- C-c C-t t 插入 underline 样式的标题，这是一级。
- C-c C-t s 同上，这是二级。
- C-c C-a l 插入链接，格式为 [text](url)。
- C-c C-i i 插入图像，格式为 ![text](url)。
- C-c C-s b 插入引用内容。
- C-c C-s c 插入代码。
- C-c C-p b 加粗。
- C-c C-p i 斜体。
- C-c - 插入水平线。

## 大纲视图  ##

- 按 S-Tab 将在大纲视图、目录视图、及正常视图间切换。

## 预览(需要安装 Markdown 程序包) ##

- C-c C-c m 在当前缓冲运行 Markdown，并在另一个缓冲预览。
- C-c C-c p 同上，但在浏览器中预览。

-------------------------------------------------------------------------------

# All the icons #

- 打开emacs以后M-x all-the-icons-install-fonts

-------------------------------------------------------------------------------

# Python #

- 使用pip 安装：rope jedi flake8 importmagic autopep8 yapf

-------------------------------------------------------------------------------

# Go #

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

-------------------------------------------------------------------------------

# JS #

- npm install -g eslint 
- npm install -g prettier
- npm install -g typescript

-------------------------------------------------------------------------------

# Projectile #

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

-------------------------------------------------------------------------------

# ag #

- apt-get install silversearcher-ag
- brew install the_silver_searcher

-------------------------------------------------------------------------------

# Quicklisp #

## Install ##

- see quicklisp/Install

## Let Emacs know about SBCL and Quicklisp ##

- First in SBCL run:

```
(ql:quickload "quicklisp-slime-helper")
```

- Tell Emacs how to launch your Lisp environment

```
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
```

-------------------------------------------------------------------------------

# TAGS #
- find . -name "*.el" -or -name "*.c" | etags -

-------------------------------------------------------------------------------

# Source #

```
git://git.savannah.gnu.org/emacs.git
https://git.savannah.gnu.org/git/emacs.git
ssh://git.savannah.gnu.org:/srv/git/emacs.git
```

-------------------------------------------------------------------------------

# アップグレードする方法 #

```
以下のコマンドでアップグレードしてください。
そのためにはpackage-utilsパッケージが必要です。
M-x package-install package-utils (初めてアップグレードする場合のみ)
M-x package-utils-upgrade-by-name ample-theme
```

# EXWM #

cp ~/.emacs.d/elpa/exwm*/xinitrc ~/.xinitrc
