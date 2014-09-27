(add-to-list 'load-path "~/.emacs.d/extensions/key-chord")
(require 'key-chord)
(key-chord-mode 1)

(key-chord-define-global "mx" 'smex)
(key-chord-define-global "fj" 'ido-switch-buffer)
(key-chord-define-global "xk" 'ido-kill-buffer)
(key-chord-define-global "xx" 'end-of-buffer)
(key-chord-define-global "xj" 'dired-jump)
(key-chord-define-global "js" 'save-buffer)
(key-chord-define-global "ww" 'beginning-of-buffer)
(key-chord-define-global "xh" 'mark-whole-buffer)
(key-chord-define-global "cm" 'goto-match-paren)
(key-chord-define-global "jj" 'er/expand-region)
(key-chord-define-global "kd" 'ace-jump-mode)
(key-chord-define-global "kc" 'ace-jump-char-mode)
(key-chord-define-global "kk" 'ace-jump-line-mode)
(key-chord-define-global ",." 'eshell)
(key-chord-define-global "ms" 'magit-status)
(key-chord-define-global "ml" 'magit-log)
(key-chord-define-global "qj" 'ispell-word)
(key-chord-define-global "xc" 'exchange-point-and-mark)
(key-chord-define-global "x0" 'delete-window)
(key-chord-define-global "fs" 'point-to-register)
(key-chord-define-global "jl" 'jump-to-register)
(key-chord-define-global "x9" 'delete-other-windows)
(key-chord-define-global "jr" 'switch-to-buffer-other-side-window)
(key-chord-define-global "jv" 'switch-to-buffer-other-bottom-window)
(key-chord-define-global "jk" 'ace-jump-mode-pop-mark)
(key-chord-define-global "wj" 'windmove-left)
(key-chord-define-global "wk" 'windmove-down)
(key-chord-define-global "wl" 'windmove-right)
(key-chord-define-global "wh" 'windmove-up)
(key-chord-define-global "kl" 'revert-buffer-no-confirm)
(key-chord-define dired-mode-map "oe" 'open-file-with-external-program)
(key-chord-define dired-mode-map "ep" 'export-latex-to-pdf)
(require 'message)
(key-chord-define message-mode-map "jq" 'ispell-message)

(provide 'init-key-chord)
