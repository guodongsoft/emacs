;;; paredit.el --- Paredit settings
;;; Commentary:

(require 'paredit)

;;; Code:
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook                  #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook            #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook                        #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook                        #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook                      #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)

(add-hook 'slime-repl-mode-hook                  (lambda () (paredit-mode +1)))

(add-hook 'emacs-lisp-mode-hook                  'evil-paredit-mode)
(add-hook 'emacs-lisp-mode-hook                  'evil-paredit-mode)
(add-hook 'lisp-interaction-mode-hook            'evil-paredit-mode)
(add-hook 'ielm-mode-hook                        'evil-paredit-mode)
(add-hook 'lisp-mode-hook                        'evil-paredit-mode)
(add-hook 'scheme-mode-hook                      'evil-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'evil-paredit-mode)

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(defun paredit-barf-all-the-way-backward ()
  (interactive)
  (paredit-split-sexp)
  (paredit-backward-down)
  (paredit-splice-sexp))

(defun paredit-barf-all-the-way-forward ()
  (interactive)
  (paredit-split-sexp)
  (paredit-forward-down)
  (paredit-splice-sexp)
  (if (eolp) (delete-horizontal-space)))

(defun paredit-slurp-all-the-way-backward ()
  (interactive)
  (catch 'done
    (while (not (bobp))
      (save-excursion
        (paredit-backward-up)
        (if (eq (char-before) ?\()
            (throw 'done t)))
      (paredit-backward-slurp-sexp))))

(defun paredit-slurp-all-the-way-forward ()
  (interactive)
  (catch 'done
    (while (not (eobp))
      (save-excursion
        (paredit-forward-up)
        (if (eq (char-after) ?\))
            (throw 'done t)))
      (paredit-forward-slurp-sexp))))

(nconc paredit-commands
       '("Extreme Barfage & Slurpage"
         (("C-M-)")
                      paredit-slurp-all-the-way-forward
                      ("(foo (bar |baz) quux zot)"
                       "(foo (bar |baz quux zot))")
                      ("(a b ((c| d)) e f)"
                       "(a b ((c| d)) e f)"))
         (("C-M-}" "M-F")
                      paredit-barf-all-the-way-forward
                      ("(foo (bar |baz quux) zot)"
                       "(foo (bar|) baz quux zot)"))
         (("C-M-(")
                      paredit-slurp-all-the-way-backward
                      ("(foo bar (baz| quux) zot)"
                       "((foo bar baz| quux) zot)")
                      ("(a b ((c| d)) e f)"
                       "(a b ((c| d)) e f)"))
         (("C-M-{" "M-B")
                      paredit-barf-all-the-way-backward
                      ("(foo (bar baz |quux) zot)"
                       "(foo bar baz (|quux) zot)"))))

(paredit-define-keys)
(paredit-annotate-mode-with-examples)
(paredit-annotate-functions-with-examples)

(defun paredit-delete-indentation (&optional arg)
  "Handle joining lines that end in a comment."
  (interactive "*P")
  (let (comt)
    (save-excursion
      (move-beginning-of-line (if arg 1 0))
      (when (skip-syntax-forward "^<" (point-at-eol))
  (setq comt (delete-and-extract-region (point) (point-at-eol)))))
    (delete-indentation arg)
    (when comt
      (save-excursion
    	  (move-end-of-line 1)
  (insert " ")
  (insert comt)))))
(define-key paredit-mode-map (kbd "M-^") 'paredit-delete-indentation)

(provide 'init-paredit)
;;; init-paredit.el ends here
