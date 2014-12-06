(setq dotfiles-dir
      (file-name-directory (or (buffer-file-name)
			       load-file-name)))

;; this is where all the configuration is
(load (concat dotfiles-dir "base-config.el"))