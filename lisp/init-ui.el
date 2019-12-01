(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (set-frame-font "等距更纱黑体 SC 13" nil t)
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

;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (dashboard-setup-startup-hook)
;;   ;; Content is not centered by default. To center, set
;;   (setq dashboard-center-content t)
;;   (setq dashboard-set-footer nil)
;;   (setq dashboard-items '((recents  . 5)
;; 			  (projects . 5)
;; 			  (agenda . 5)
;; 			  (bookmarks . 5)
;; 			  (registers . 5)))
;;   (setq dashboard-set-heading-icons t)
;;   (setq dashboard-set-file-icons t)
;;   )

(use-package page-break-lines
  :ensure t)

(provide 'init-ui)
