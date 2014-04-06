(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq dotfiles-dir
      (file-name-directory (or (buffer-file-name)
			       load-file-name)))

(setenv "PATH"
	(concat (concat (getenv "HOME") "/.bin") ":" (getenv "PATH")))

(add-to-list 'load-path (concat dotfiles-dir "/conf"))
