
;; Hide GUI things
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; IDO mode
(setq ido-enable-flex-matching t)
(setq ido-max-prospects 10)
(setq ido-enable-prefix nil)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
(ido-mode t)

;; Configure dired:
;; - to hide boring files
;; - order by (directory>file, name)
(require 'dired-x)
(add-hook 'dired-mode-hook #'hl-line-mode)
(setq-default dired-omit-files-p t)
(setq dired-omit-files "^\\.[^.]\\|\\.pyc$")
(if (eq system-type 'darwin)
  (setq insert-directory-program "gls")
)
(setq dired-listing-switches "-aBhl --group-directories-first")


;; Store backups in enterprise-grade storage - /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Put whitespace under control
(setq whitespace-style '(face lines-tail))
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Misc configurations

;; Answer questions with "y" or "n"
(defalias 'yes-or-no-p 'y-or-n-p)

;; Follow symbolic links
(setq vc-follow-symlinks t)

;; Don't show startup message
(setq inhibit-startup-message t)

;; Hide initial message on scratch buffer
(setq initial-scratch-message nil)

;; I don't always code in Lisp but when I do I use Clojure
(setq initial-major-mode 'text-mode)

;; Toggle column number display in the mode line
(column-number-mode)

;; Highlight matching parentheses
(show-paren-mode t)

;; Allow to replace highlighted text
(delete-selection-mode t)

;; Word wrap
(visual-line-mode t)
(global-visual-line-mode t)

;; Disable auto-indent
(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

;; Custom keys
(global-set-key [f3] 'kill-this-buffer)

;; Color scheme
(load-theme 'wombat t)

;; Configure precious Clojure
(setq cider-show-error-buffer nil)
(setq cider-repl-use-clojure-font-lock t)
(setq cider-repl-display-help-banner nil)
(setq cider-cljs-lein-repl
      "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c M-o") #'cider-repl-clear-buffer)))

;; Move up/down the history in cider repl
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])


;; Org Mode
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; Misc
(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (region-beginning)
                             (region-end)
                             "python -m json.tool"
                             (buffer-name)
                             t)))
