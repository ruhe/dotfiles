(add-hook 'clojure-mode-hook
	  (lambda ()
	    (paredit-mode t)))

(setq nrepl-popup-stacktraces nil)
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

(provide 'lang-clojure)
