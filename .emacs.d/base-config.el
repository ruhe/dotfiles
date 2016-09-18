
;; Hide GUI things
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;; Setup package repositories
(add-to-list 'package-archives
	     '("trelpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))


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
(add-hook 'python-mode-hook 'whitespace-mode)
(add-hook 'clojure-mode-hook 'whitespace-mode)
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


;; Custom keys
(global-set-key [f3] 'kill-this-buffer)


;; These days I'm using color scheme from my terminal
(setq-default global-font-lock-mode nil)
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)


;; Parentheses don't matter
(defface paren-face
  '((((class color) (background dark))
     (:foreground "grey40"))
    (((class color) (background light))
     (:foreground "grey40")))
  "Face used to dim parentheses.")

(defun dim-parens ()
  (font-lock-add-keywords nil '(("(\\|)" . 'paren-face))))

(add-hook 'clojure-mode-hook 'dim-parens)
(add-hook 'emacs-lisp-mode-hook 'dim-parens)

;; Configure precious Clojure
(setq cider-show-error-buffer nil)
(setq cider-repl-use-clojure-font-lock t)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c M-o") #'cider-repl-clear-buffer)))
