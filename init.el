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
    (magit ample-theme powerline-evil dashboard evil-leader org-bullets use-package monokai-theme helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
