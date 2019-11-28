;; Show org-mode bullets as UTF-8 Characters.
;;(use-package org-bullets
  ;;:ensure t
;;  :config
;;  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "d:/org/inbox.org")

(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files (list "d:/org"))

(setq truncate-lines nil)

(setq org-capture-templates nil)

(add-to-list 'org-capture-templates
             '("i" "Inbox" entry
               (file+headline "d:/org/inbox.org" "Inbox")
               "* %U - %^{Title} %^G\n %?\n"))
(add-to-list 'org-capture-templates
             '("t" "Tasks" entry
               (file+headline "d:/org/todo.org" "Tasks")
               "* TODO %^{Title} %^G\n %?\n"))
;; (add-to-list 'org-capture-templates
;;              '("m" "备忘录" entry
;;                (file+headline "d:/org/todo.org" "备忘录")
;;                "* TODO %?\n创建于：%U\n"))
(add-to-list 'org-capture-templates
             '("l" "Life" entry
               (file+olp+datetree "d:/org/life.org" "Life")
               "* %U - %^{Title}\n %?\n"))
;; (add-to-list 'org-capture-templates
;;              '("b" "记帐" table-line
;;                (file+headline "d:/org/todo.org" "记帐")
;;                "| %U | %^{消费分类} | %^{消费商品} | %^{消费金额} |" :kill-buffer t))
(provide 'init-org)
