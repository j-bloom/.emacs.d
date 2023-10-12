(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; store all backup and autosave files in ~/.emacs.d.saves
(setq backup-directory-alist `(("." . "~/.emacs.d.saves")))
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      backup-by-copying t
      create-lockfiles nil)

;; Transparent background
(set-frame-parameter nil 'alpha-background 75)
(add-to-list 'default-frame-alist '(alpha-background . 75))

;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts

(use-package all-the-icons)

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;(use-package smartparens
;  :hook (prog-mode . smartparens-mode))

;;init packages
(load "~/.emacs.d/init-packages.el")
(load "~/.emacs.d/init-ivy.el")
(load "~/.emacs.d/init-doom.el")
(load "~/.emacs.d/init-color-theme.el")
(load "~/.emacs.d/init-which-key.el")
(load "~/.emacs.d/init-evil.el")
(load "~/.emacs.d/init-rainbow-delimeters.el")
(load "~/.emacs.d/init-magit.el")
(load "~/.emacs.d/init-projectile.el")
;(load "~/.emacs.d/init-general.el")
(load "~/.emacs.d/init-completion.el")
(load "~/.emacs.d/lsp/init-lsp.el")
(load "~/.emacs.d/lsp/init-web-mode.el")
(load "~/.emacs.d/lsp/init-python.el")
(load "~/.emacs.d/lsp/init-typescript.el")
(load "~/.emacs.d/lsp/init-cpp.el")
(load "~/.emacs.d/lsp/init-go.el")
(load "~/.emacs.d/lsp/init-prettier.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-intercept-maps nil)
 '(evil-overriding-maps nil)
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(smartparens exec-path-from-shell prettier-js ggtags yasnippet flycheck eglot typescript-mode company web-mode evil-magit magit evil-escape rainbow-delimiters all-the-icons doom-themes doom-modeline counsel ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
