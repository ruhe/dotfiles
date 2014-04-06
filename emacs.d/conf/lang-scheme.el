(defvar racket "/usr/local/bin/mit-scheme")

(setq quack-fontify-style (quote emacs))
(setq quack-newline-behavior (quote indent-newline-indent))
(setq quack-smart-open-paren-p t)
(setq quack-default-program racket)

(add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))
(custom-set-variables
 '(quack-smart-open-paren-p nil))

(defun scheme ()
    (interactive)
    (split-window-horizontally)
    (run-scheme racket))

(add-hook 'scheme-mode-hook
          (lambda()
	    (define-key scheme-mode-map "\t" 'scheme-complete-or-indent)))

(provide 'lang-scheme)    
