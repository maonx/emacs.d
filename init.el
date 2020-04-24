;; Tsinghua ELPA package manager
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; disable automatic loading of packages after the init file
(setq package-enable-at-startup nil)

(package-initialize)
:q
;; refresh package descriptions
(unless package-archive-contents
   (package-refresh-contents))

;;; use-package initialization
;;; install use-package if not already done
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
;;; use-package for all others
(require 'use-package)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load custom-file)

(setq inhibit-splash-screen t)

(global-hl-line-mode t)

;; 自动刷新更改的缓冲区
(global-auto-revert-mode t)

(setq make-backup-files nil)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f5> 键上
(global-set-key (kbd "<f5>") 'open-init-file)

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package php-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(?:php\\|phtml\\)\\'" . php-mode))
  )

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  )

(use-package ivy
	     :ensure t
	     :config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume))

(use-package swiper
	     :ensure t
	     :config
	     (global-set-key "\C-s" 'swiper))

(use-package counsel
	     :ensure t
	     :config
	     (global-set-key (kbd "M-x") 'counsel-M-x)
	     (global-set-key (kbd "C-M-p") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )
;; (use-package projectile
;;   :ensure t
;;   )
(use-package pyim
  :ensure nil
  :demand t
  :config
  ;; 激活 basedict 拼音词库，五笔用户请继续阅读 README
  (use-package pyim-basedict
    :ensure nil
    :config (pyim-basedict-enable))

  (setq default-input-method "pyim")

  ;; 我使用全拼
  (setq pyim-default-scheme 'xiaohe-shuangpin)

  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  ;; 开启拼音搜索功能
  (pyim-isearch-mode 1)
  ;; 设置模糊音
  (setq pyim-fuzzy-pinyin-alist '(("en" "eng")
				  ("in" "ing")
				  ("z" "zh")
				  ("s" "sh")
				  ("c" "ch")
				  ))

  ;; 使用 popup-el 来绘制选词框, 如果用 emacs26, 建议设置
  ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
  ;; 手动安装 posframe 包。
  (setq pyim-page-tooltip 'popup)

  ;; 选词框显示5个候选词
  (setq pyim-page-length 5)

  :bind
  (("M-j" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer)))

(use-package beancount
  :load-path "lisp"
  :ensure nil
  :bind
  ("C-M-b" . (lambda ()
	       (interactive)
	       (find-file "~/myBeanCount/main.bean")))
  :mode
  ("\\.bean\\(?:count\\)?\\'" . beancount-mode)
  :config
  (setq beancount-accounts-files
	(directory-files "~/myBeanCount/"
			 'full
			 (rx ".bean" eos)))
  )

(require 'init-org)
(require 'init-evil)
(require 'init-ui)
