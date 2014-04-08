(defun uncomment-comment-region ()
  "If region is set, [un]comments it. Otherwise [un]comments current line."
  (interactive)
  (if (eq mark-active nil)
      (progn 
	(beginning-of-line 1)
	(set-mark (point))
	(forward-line)
	(comment-dwim nil))
    (comment-dwim nil))
  (deactivate-mark))

(defun insert-semi-colon-with-ñ ()
  (interactive)
  (insert ";"))

(defun insert-ñ ()
  (interactive)
  (insert "ñ"))

(defun insert-couple-parentesis()
  "Inserts single parentesis easily"
  (interactive)
  (insert "()")
  (backward-char 1))

(defun insert-couple-of-straight-brackets()
  "Inserts couple of [ symbols like this: []"
  (interactive)
  (insert "[]"))

(defun insert-brackets-and-indent ()
  (interactive)
  (insert "{")
  (let ((pps (syntax-ppss)))
    (when (and (eolp) (not (or (nth 3 pps) (nth 4 pps))))
      (indent-for-tab-command)
      (insert "\n\n}")
      (indent-for-tab-command)
      (forward-line -1)
      (indent-for-tab-command))))

(defun insert-tilde-symbol()
  "Inserts tilde symbol"
  (interactive)
  (insert "~"))

;; Disable the bell just when scrolling to limits
(defun no-bell-sound ()
  (unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer
                                keyboard-quit mwheel-scroll down up next-line previous-line
                                backward-char forward-char))
    (ding)))

(setq ring-bell-function 'no-bell-sound)

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun play-video-file-with-vlc ()
  "Plays video file with VLC by directly opening VLC"
  (interactive)
  (defvar get-filename-on-dired 'dired-copy-filename-as-kill)
  (shell-command (format "%s --quiet --fullscreen \"%s\""
                         emms-player-vlc-command-name
                         (funcall get-filename-on-dired))))

(defun open-file-with-external-program ()
  "Opens a file by directly calling the default external program"
  (interactive)
  (defvar get-filename-on-dired 'dired-copy-filename-as-kill)
  (shell-command (format "open \"%s\""
                         (funcall get-filename-on-dired))))

(defun export-latex-to-pdf ()
  "Exports latex file to pdf with pdflatex"
  (interactive)
  (defvar get-filename-on-dired 'dired-copy-filename-as-kill)
  (shell-command (format "pdflatex \"%s\""
                         (funcall get-filename-on-dired))))

(defun switch-to-buffer-other-side-window ()
  "Switch to buffer in other window to the side"
  (interactive)
  (split-window-right)
  (proff-select-window-right)
  (ido-switch-buffer))

(defun switch-to-buffer-other-bottom-window ()
  "Switch to buffer in other window to the bottom"
  (interactive)
  (split-window-below)
  (proff-select-window-down)
  (ido-switch-buffer))

(defun insert-equal-symbol ()
  "Inserts symbol = "
  (interactive)
  (insert "="))

(provide 'init-custom-functions)
