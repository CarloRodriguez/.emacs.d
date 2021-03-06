(setq
    org-directory "~/gtd"
    org-agenda-files '("~/gtd/projects.org" "~/gtd/waiting.org")
    org-capture-templates '(("e" "entries" entry (file "~/gtd/entries.org")
                                "* TODO %i%?")
                               ("w" "waiting" entry (file "~/gtd/waiting.org")
                                   "* %i%?\n %U")
                               ("p" "projects" entry (file "~/gtd/projects.org")
                                   "* TODO %i%?")
                               ("b" "backlog" entry (file "~/gtd/backlog.org")
                                   "* %i%?"))
    org-refile-targets '(("~/gtd/projects.org" :maxlevel . 3)
                            ("~/gtd/backlog.org" :level . 1)
                            ("~/gtd/waiting.org" :maxlevel . 2))
    org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
    org-refile-use-outline-path 'file
    org-default-notes-file (concat org-directory "/entries.org"))

(global-set-key (kbd "C-c c") 'org-capture)

(provide 'org-mode-configs)
