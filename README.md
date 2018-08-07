#Package
## 1.Start with this in .emacs
- (require 'package)
- (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
- (package-initialize)

## 2.Install
- M-x package-refresh-contents
- Example: M-x package-install <RET> evil

# Slime
- cd ~/.emacs.d
- git clone https://github.com/slime/slime.git
