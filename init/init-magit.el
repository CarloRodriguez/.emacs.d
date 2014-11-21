(require 'magit)

(define-key magit-log-mode-map (kbd "x") 'magit-reset-head-hard)

(define-key magit-mode-map (kbd "SPC") 'ace-jump-char-mode)

(add-hook 'git-commit-mode (lambda ()
                             (flyspell-mode t)))

(provide 'init-magit)
