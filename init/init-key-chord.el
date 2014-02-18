(add-to-list 'load-path "~/.emacs.d/extensions/key-chord")
(require 'key-chord)
(key-chord-mode 1)

(key-chord-define-global "mx" 'execute-extended-command)
(key-chord-define-global "fj" 'helm-mini)
(key-chord-define-global "xk" 'ido-kill-buffer)
(key-chord-define-global "xx" 'end-of-buffer)
(key-chord-define-global "xj" 'dired-jump)
(key-chord-define-global "js" 'save-buffer)
(key-chord-define-global "ww" 'beginning-of-buffer)
(key-chord-define-global "xf" 'ido-find-file)
(key-chord-define-global "xh" 'mark-whole-buffer)
(key-chord-define-global "cm" 'goto-match-paren)
(key-chord-define-global "xb" 'switch-to-buffer)
(key-chord-define-global "x1" 'delete-other-windows)
(key-chord-define-global "x2" 'split-window-below)
(key-chord-define-global "x3" 'split-window-right)
(key-chord-define-global "x0" 'delete-window)
(key-chord-define-global "ff" 'er/expand-region)

(provide 'init-key-chord)
