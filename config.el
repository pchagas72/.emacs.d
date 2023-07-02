(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package doom-themes
  :if window-system
  :ensure t
  :config
  ;;(load-theme 'doom-badger t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config))
(load-theme 'doom-badger t)

;;(set-face-attribute 'default-frame-alist '(font . "terminus-16"))
;;(set-face-attribute 'default nil :font "terminus-16")
(set-face-attribute 'default nil :height 100)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)



(use-package swiper
  :ensure t
  :bind ("C-s" . 'swiper))

(setq use-dialog-box nil)
(setq use-file-dialog nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode -1)
(scroll-bar-mode -1)
(global-subword-mode 1)
;; (defalias 'yes-or-no-p 'y-or-n-p)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.emacs.d/dashboard-pic.png")
  (setq dashboard-items '((recents  . 5)
                         (bookmarks . 5)))
  (setq dashboard-banner-logo-title "I have become comfortably numb.")) ;; Make script for quotes.

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
        '("a" "s" "d" "f" "j" "k" "l"))
  :bind
  ([remap other-window] . switch-window))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(use-package evil
  :ensure t)

(evil-mode 1)

(use-package lsp-mode
  :ensure t
  :hook
  ((python-mode . lsp)))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company
    :ensure t)

(use-package flycheck
  :ensure t)

(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
