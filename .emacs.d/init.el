(package-initialize)

(setq dotfiles-dir
      (file-name-directory (or (buffer-file-name)
			       load-file-name)))

;; this is where all the configuration is
(load (concat dotfiles-dir "base-config.el"))
(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
