;; Show org-mode bullets as UTF-8 Characters.
;;(use-package org-bullets
  ;;:ensure t
;;  :config
;;  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "d:/org/inbox.org")

(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files (list "d:/org/inbox.org"
			     "d:/org/todo.org"
			     "d:/org/beorg.org"
			     "d:/org/life.org"
			     ))

(setq org-agenda-text-search-extra-files
        (list "d:/org/archive.org"
  ))

(setq truncate-lines nil)

(setq org-capture-templates nil)

(setq org-log-done 'time)

(add-to-list 'org-capture-templates
             '("i" "Inbox" entry
               (file+headline "d:/org/inbox.org" "Inbox")
               "* %U - %^{Title} %^G\n %?\n" :empty-lines 1))
(add-to-list 'org-capture-templates
             '("t" "Tasks" entry
               (file+headline "d:/org/todo.org" "Tasks")
               "* TODO %^{Title} %^G\n %?\n" :empty-lines 1))
(add-to-list 'org-capture-templates
             '("l" "Life" entry
               (file+olp+datetree "d:/org/life.org" "Life")
               "* %U - %^{Title}\n %?\n" :empty-lines 1))

(setq org-refile-targets '((nil :maxlevel . 2)
                             (org-agenda-files :maxlevel . 2)
                             ("d:/org/archive.org" :maxlevel . 2)
                             )
        )
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path 'file)

(provide 'init-org)
