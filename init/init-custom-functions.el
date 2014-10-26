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
  (windmove-right)
  (ido-switch-buffer))

(defun switch-to-buffer-other-bottom-window ()
  "Switch to buffer in other window to the bottom"
  (interactive)
  (split-window-below)
  (windmove-down)
  (ido-switch-buffer))

(defun dired-find-file-other-vertical-window ()
  "In Dired, visit this file or directory in another vertical window."
  (interactive)
  (defvar get-filename-on-dired 'dired-copy-filename-as-kill)
  (split-window-right)
  (windmove-right)
  (find-file (funcall get-filename-on-dired)))

(defun dired-copy-path-file-as-kill ()
  "Copy path of marked (or at point) files and folders."
  (interactive)
  (setq current-prefix-arg '(0))
  (call-interactively 'dired-copy-filename-as-kill))

(defun dired-zip-compress-uncompress ()
  "Compress/Uncompress file or directory at point with zip format."
  (interactive)
  (defvar get-filename-on-dired 'dired-copy-filename-as-kill)
  (if (string= (file-name-extension (funcall get-filename-on-dired)) "zip")
      (call-process-shell-command (format "unzip \"%s\""
                                          (funcall get-filename-on-dired))
                                  nil "*Shell Command Output*" t)
    (call-process-shell-command (format "zip -r -X \"%s.zip\" \"%s\""
                                        (funcall get-filename-on-dired)
                                        (funcall get-filename-on-dired))
                                nil "*Shell Command Output*" t))
  (message (format "%s compressed/uncompressed"
                   (funcall get-filename-on-dired))))

(defun kill-gpg-buffers ()
  "Kills gpg buffers"
  (interactive)
  (kill-matching-buffers ".*\.gpg$"))

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))

(defun exit-eshell ()
  "Exits eshell just like executing exit"
  (interactive)
  (insert "exit")
  (eshell-send-input))

(defun insert-and-indent-line-below ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun insert-and-indent-line-above ()
  (interactive)
  (push-mark)
  (let*
      ((ipt (progn (back-to-indentation) (point)))
       (bol (progn (move-beginning-of-line 1) (point)))
       (indent (buffer-substring bol ipt)))
    (newline)
    (previous-line)
    (insert indent)))

(defun copy-line-or-region ()
  "Copy current line, or text selection.
When `universal-argument' is called first, copy whole buffer (but respect `narrow-to-region')."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-end-position)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-ring-save p1 p2)))

(provide 'init-custom-functions)
