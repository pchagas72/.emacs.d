;; ========================================================================
;; Core
;; ========================================================================
;; Setting up melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/") ;; Scripts

;; ========================================================================
;; Customizing Appearence
;; ========================================================================
;; Removes bullshit
(setq inhibit-startup-message t) ;; Hides startup message
(scroll-bar-mode -1)             ;; No bar
(tool-bar-mode -1)               ;; No tool bullshit
(menu-bar-mode -1)               ;; No menu bullshit

;; Additional window customizations
(set-fringe-mode 10)             ;; Some padding!
(add-to-list 'default-frame-alist '(alpha-background . 85)) ; Opacity

;; Line numbers
(column-number-mode 1)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; Colorscheme
;; Code from https://github.com/cyruseuros/ewal
(use-package ewal
  :init (setq ewal-use-built-in-always-p nil
              ewal-use-built-in-on-failure-p t
              ewal-built-in-palette "sexy-material"))
(use-package ewal-spacemacs-themes
  :init (progn
          (setq spacemacs-theme-underline-parens t
                my:font (font-spec
                              :family "SauceCodePro Nerd Font"
                              :weight 'semi-bold
                              :size 13.0))
          (show-paren-mode +1)
          (global-hl-line-mode)
          (set-frame-font my:font nil t)
          (add-to-list  'default-frame-alist
                        `(font . ,(font-xlfd-name my:font))))
  :config (progn
            (load-theme 'ewal-spacemacs-modern t)
            (enable-theme 'ewal-spacemacs-modern)))

(use-package ewal-evil-cursors
  :after (ewal-spacemacs-themes)
  :config (ewal-evil-cursors-get-colors
           :apply t :spaceline t))

(use-package spaceline
  :after (ewal-evil-cursors winum)
  :init (setq powerline-default-separator nil)
  :config (spaceline-spacemacs-theme))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil ewal-evil-cursors ewal-spacemacs-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ========================================================================
;; Customizing Keybinds
;; ========================================================================
;; Customizing Keybinds

;; Vim keybinds
(setq evil-want-C-u-scroll t)    ;; Enables ctrl-u
(require 'evil)                  ;; Require vim keybinds
(evil-mode 1)                    ;; Enable vim keybinds

;; Zen mode
(require 'zen-mode)
(global-set-key (kbd "C-M-z") 'zen-mode)
