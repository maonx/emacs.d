;; Show org-mode bullets as UTF-8 Characters.
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/Dropbox/org/inbox.org")
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files (list "~/Dropbox/org"))

(setq org-capture-templates nil)

(add-to-list 'org-capture-templates
             '("r" "稍后阅读" entry
               (file+headline "~/Dropbox/org/inbox.org" "稍后阅读")
               "* [ ] %?\t%x\n创建于：%U"))
(add-to-list 'org-capture-templates
             '("t" "待办事项" entry
               (file+headline "~/Dropbox/org/todo.org" "待办事项")
               "* TODO %?\n创建于：%U\n%a"))
(provide 'init-org)
