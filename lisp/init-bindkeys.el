(use-package evil-leader
  :ensure t
  )
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
"R" 'eval-buffer
"b" 'switch-to-buffer
"d" 'kill-buffer)

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(provide 'init-bindkeys)
