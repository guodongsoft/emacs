;;; egg-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "egg" "egg.el" (0 0 0 0))
;;; Generated autoloads from egg.el

(autoload 'egg-minor-mode "egg" "\
Turn-on egg-minor-mode which would enable key bindings for
egg in current buffer.\\<egg-minor-mode-map>
\\[egg-start-new-branch] start a new branch from the current HEAD.
\\[egg-status] shows the repo's current status
\\[egg-commit-log-edit] start editing the commit message for the current staged changes.
\\[egg-file-stage-current-file] stage new changes of the current file
\\[egg-log] shows repo's history
\\[egg-file-checkout-other-version] checkout another version of the current file
\\[egg-file-cancel-modifications] delete unstaged modifications in the current file
\\[egg-next-action] perform the next logical action
\\[egg-file-diff] compare file with index or other commits
\\[egg-file-version-other-window] show other version of the current file.

\\{egg-minor-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'egg-minor-mode-find-file-hook "egg" "\


\(fn)" nil nil)

(add-hook 'find-file-hook 'egg-git-dir)

(add-hook 'find-file-hook 'egg-minor-mode-find-file-hook)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "egg" '("egg-" "tag:msg" "query:commit" "file-log" "list-nav" "log" "define-egg-buffer" "diff" "with-current-" "commit" "status")))

;;;***

;;;### (autoloads nil "egg-base" "egg-base.el" (0 0 0 0))
;;; Generated autoloads from egg-base.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "egg-base" '("egg-" "invoked-interactively-p" "subseq" "dolist-done")))

;;;***

;;;### (autoloads nil "egg-const" "egg-const.el" (0 0 0 0))
;;; Generated autoloads from egg-const.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "egg-const" '("egg-")))

;;;***

;;;### (autoloads nil "egg-custom" "egg-custom.el" (0 0 0 0))
;;; Generated autoloads from egg-custom.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "egg-custom" '("egg-")))

;;;***

;;;### (autoloads nil "egg-diff" "egg-diff.el" (0 0 0 0))
;;; Generated autoloads from egg-diff.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "egg-diff" '("egg-")))

;;;***

;;;### (autoloads nil "egg-git" "egg-git.el" (0 0 0 0))
;;; Generated autoloads from egg-git.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "egg-git" '("egg-" "with-")))

;;;***

;;;### (autoloads nil "egg-grep" "egg-grep.el" (0 0 0 0))
;;; Generated autoloads from egg-grep.el

(autoload 'egg-grep-process-setup "egg-grep" "\
Setup compilation variables and buffer for `egg-grep'.
Set up `compilation-exit-message-function' and run `egg-grep-setup-hook'.

\(fn)" nil nil)

(autoload 'egg-grep-mode "egg-grep" "\
Sets `compilation-last-buffer' and `compilation-window-height'.

\(fn)" nil nil)

(autoload 'egg-grep "egg-grep" "\


\(fn LEVEL)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "egg-grep" '("egg-grep-")))

;;;***

;;;### (autoloads nil "egg-key" "egg-key.el" (0 0 0 0))
;;; Generated autoloads from egg-key.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "egg-key" '("egg-" "with-egg-key-buffer")))

;;;***

;;;### (autoloads nil "egg-svn" "egg-svn.el" (0 0 0 0))
;;; Generated autoloads from egg-svn.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "egg-svn" '("egg-" "with-egg-temp-direct-mapping")))

;;;***

;;;### (autoloads nil nil ("egg-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; egg-autoloads.el ends here
