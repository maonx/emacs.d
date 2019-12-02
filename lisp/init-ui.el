(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Hide tool bar
(tool-bar-mode -1)

;; Hide scroll bar
(scroll-bar-mode -1)

;; Hide menu bar
(menu-bar-mode -1)

;; Change the cursor style
(setq-default cursor-type 'bar)

;; Hide welcome buffer
(setq inhibit-startup-screen t)

;; Highlight the current line
(global-hl-line-mode t)

;; Show paren
(show-paren-mode 1)

(use-package doom-themes
	     :ensure t
	     :config
	     (load-theme 'doom-one-light t))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)
  (setq dashboard-set-footer nil)
  (setq dashboard-items '((recents  . 5)
			  (projects . 5)
			  (agenda . 5)
			  (bookmarks . 5)
			  ))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  )

(use-package page-break-lines
  :ensure t)

(setq inhibit-compacting-font-caches t)
(use-package all-the-icons
  :ensure t
  :defer t  
  :init
  (set-frame-font "all-the-icons" t)
  :config
  (set-frame-font "Monaco" t)
  )

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; Setting English Font
(set-face-attribute 'default nil :font "Monaco 10")

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "Microsoft Yahei"
                                       :size 12.0)))


(provide 'init-ui)
