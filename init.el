(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(setq package-enable-at-startup nil)
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))
(use-package magit
  :ensure t)
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))
(use-package powerline-evil
  :ensure t)
(use-package ample-theme
  :init (progn (load-theme 'ample t t)
               (load-theme 'ample-flat t t)
               (load-theme 'ample-light t t)
               (enable-theme 'ample))
  :defer t
  :ensure t)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("M-<f5>" . helm-find-files)
         ([f10] . helm-buffers-list)
         ([S-f10] . helm-recentf)))

(use-package cnfonts
  :ensure t
  :config (cnfonts-enable))

(use-package pyim
  :ensure t
  :demand t
  :config
  (use-package pyim-wbdict
    :ensure t
    :config (pyim-wbdict-gbk-enable))

  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'wubi)
  (add-hook 'emacs-startup-hook
            #'(lambda () (pyim-restart-1 t)))
  )

;;Exit insert mode by pressing j and then j quickly
(use-package key-chord
  :ensure t
  :config
    (setq key-chord-two-keys-delay 0.5)
    (key-chord-define evil-insert-state-map "fd" 'evil-normal-state)
    (key-chord-mode 1)
)

(require 'init-org)
(require 'init-ui)
(require 'init-bindkeys)

(set-default-font "Microsoft YaHei Mono 13")
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)





(use-package powerline-evil
  :ensure t)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("M-<f5>" . helm-find-files)
         ([f10] . helm-buffers-list)
         ([S-f10] . helm-recentf)))

(require 'init-org)
(require 'init-ui)
(require 'init-bindkeys)

(set-default-font "Microsoft YaHei Mono 13")
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (key-chord pyim-wbdict pyim cnfonts company projectile magit ample-theme powerline-evil dashboard evil-leader org-bullets use-package monokai-theme helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
