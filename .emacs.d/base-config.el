;; Hide GUI things
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;; Set package sources
(setq package-archives
      '(("elpa" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")))


;; IDO mode
(setq ido-enable-flex-matching t)
(setq ido-max-prospects 10)
(setq ido-enable-prefix nil)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
(ido-mode t)


;; Configure dired to hide boring files
(require 'dired-x)
(setq-default dired-omit-files-p t)
(setq dired-omit-files "^\\.[^.]\\|\\.pyc$")


;; Put whitespace under control
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Store backups in enterprise-grade storage - /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


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


;; No place for colorz in my terminalz
(defun decolorize-font-lock ()
  "remove all colors from font-lock faces except comment and warning"
  (let ((fg (face-attribute 'default :foreground))
        (bg (face-attribute 'default :background)))
    (mapc (lambda (face)
            (when face
              (set-face-attribute face nil
                                  :foreground fg
                                  :background bg)))
          (mapcar (lambda (f)
                    (if (and (string-match "^font-lock" (symbol-name f))
                             (not (string-match "-comment\\|-warning"
                                               (symbol-name f))))
                        f
                      nil))
                  (face-list)))))

(set-face-foreground 'font-lock-comment-face "#999999")
(decolorize-font-lock)


;; Custom keys
(global-set-key [f3] 'kill-this-buffer)
