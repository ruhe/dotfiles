(defun ruhe/c-mode-hook ()
  (auto-fill-mode)
  (c-toggle-hungry-state 1)
  (c-set-style "linux")
  (setq indent-tabs-mode nil
	delete-trailing-whitespace))

(add-hook 'c-mode-hook 'ruhe/c-mode-hook)

(require 'xcscope)
(provide 'lang-c)
