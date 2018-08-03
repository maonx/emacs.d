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

(provide 'init-ui)
