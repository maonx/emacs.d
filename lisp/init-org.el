;; Show org-mode bullets as UTF-8 Characters.
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/Dropbox/org/inbox.org")

(setq org-capture-templates nil)

(add-to-list 'org-capture-templates
             '("w" "Web Collections" entry
               (file+headline "~/Dropbox/org/inbox.org" "Web")
               "* %U %:annotation\n\n%:initial\n\n%?"))
(add-to-list 'org-capture-templates
             '("t" "teb Collections" entry
               (file+headline "~/Dropbox/org/inbox.org" "Test")
               "* %U %:description\n\n%:link\n\n%?"))
(provide 'init-org)
