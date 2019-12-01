(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'dashboard-mode 'emacs)
  )

;; (use-package key-chord
;;   :ensure t
;;   :config
;;   (setq key-chord-two-keys-delay 0.2)
;;   (key-chord-define evil-insert-state-map "fd" 'evil-normal-state)
;;   (key-chord-mode 1)
;;   )

(use-package evil-matchit
  :ensure t
  :config
  (setq evilmi-shortcut "m")
  (global-evil-matchit-mode 1)
  )

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
   "f" 'counsel-find-file
   "b" 'switch-to-buffer
   "w" 'save-buffer
   "oc" 'org-capture
   "oa" 'org-agenda
   "k" 'kill-buffer)
  )

(use-package evil-nerd-commenter
  :ensure t
  :config
  (evilnc-default-hotkeys)
  (define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
  )

(use-package evil-escape
  :ensure
  :config
  (evil-escape-mode 1)
  (setq-default evil-escape-key-sequence "fd")
  (setq-default evil-escape-delay 0.2)
  )
(provide 'init-evil)
