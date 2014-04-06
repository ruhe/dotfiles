(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(blink-cursor-mode -1)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(ido-mode t)
(show-paren-mode t)
(cua-mode t)
(delete-selection-mode t)

(setq indent-tabs-mode nil
      column-number-mode t
      fringe-mode (cons 4 0)
      echo-keystrokes 0.1
      show-paren-mode t
      x-select-enable-clipboard t
      font-lock-maximum-decoration t
      inhibit-startup-message t
      initial-scratch-message nil
      initial-major-mode 'text-mode
      transient-mark-mode t
      shift-select-mode nil
      save-place-file (concat dotfiles-dir "places")
      ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (concat dotfiles-dir "ido.last")
      backup-directory-alist `(("." . ,(expand-file-name
					     (concat dotfiles-dir "backups")))))

(setq ns-use-srgb-colorspace t)

(set-default 'imenu-auto-rescan t)

(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size old-max)))

(global-set-key (kbd "\C-c M-o") 'clear-shell)
(global-set-key [f3] 'kill-this-buffer)
(global-set-key [f5] 'find-name-dired)


(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'base-config)
