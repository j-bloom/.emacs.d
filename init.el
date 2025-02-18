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

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package tangotango-theme)
(load-theme 'tangotango t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5))))

;; Set the title
(setq dashboard-banner-logo-title "Emacs Dashboard")
;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package which-key)
(which-key-mode)
(setq which-key-idle-delay 1)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(setq evil-toggle-key "M-z");why his default CTRL+z? lol
(setq evil-move-cursor-back t
      evil-cross-lines t
      evil-want-fine-undo t
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state nil
      evil-want-C-w-delete t)

(setq evil-emacs-state-modes nil)
(setq evil-insert-state-modes nil)
(setq evil-motion-state-modes nil)

(setq evil-want-fine-undo t)

(global-set-key (kbd "M-v") 'evil-paste-after)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-intercept-maps nil)
 '(evil-overriding-maps nil)
 '(package-selected-packages
   '(web-mode elgot yasnippet yafolding which-key tangotango-theme magit general flycheck exec-path-from-shell evil-escape evil-collection counsel-projectile company)))

;; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

(define-key evil-insert-state-map (kbd "M-h") 'backward-char)
(define-key evil-insert-state-map (kbd "M-j") 'next-line)
(define-key evil-insert-state-map (kbd "M-k") 'previous-line)
(define-key evil-insert-state-map (kbd "M-l") 'forward-char)
(define-key evil-normal-state-map (kbd "M-h") 'backward-char)
(define-key evil-normal-state-map (kbd "M-j") 'next-line)
(define-key evil-normal-state-map (kbd "M-k") 'previous-line)
(define-key evil-normal-state-map (kbd "M-l") 'forward-char)
;;; jump directions
(define-key evil-insert-state-map (kbd "M-H")
  (lambda () (interactive)(cl-loop repeat 10 do (backward-char))))
(define-key evil-insert-state-map (kbd "M-J")
  (lambda () (interactive)(cl-loop repeat 10 do (evil-next-visual-line))))
(define-key evil-insert-state-map (kbd "M-K")
  (lambda () (interactive)(cl-loop repeat 10 do (evil-previous-visual-line))))
(define-key evil-insert-state-map (kbd "M-L")
  (lambda () (interactive)(cl-loop repeat 10 do (forward-char))))
(define-key evil-normal-state-map (kbd "M-H")
  (lambda () (interactive)(cl-loop repeat 10 do (backward-char))))
(define-key evil-normal-state-map (kbd "M-J")
  (lambda () (interactive)(cl-loop repeat 10 do (evil-next-visual-line))))
(define-key evil-normal-state-map (kbd "M-K")
  (lambda () (interactive)(cl-loop repeat 10 do (evil-previous-visual-line))))
(define-key evil-normal-state-map (kbd "M-L")
  (lambda () (interactive)(cl-loop repeat 10 do (forward-char))))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-escape
  :after evil
  :config
  (evil-escape-mode 1)
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  (global-set-key "\C-cqq" 'evil-escape))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package general
  :config
  (general-create-definer jbloom/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))


;;General keybindings
  (jbloom/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "a" '(ansi-term :which-key "ansi-term"))

;;Git keybindings
(jbloom/leader-keys
  "g"   '(:ignore t :which-key "git")
  "gs"  'magit-status
  "gi"  'magit-init
  "gh"  'magit-remote 
  "gd"  'magit-diff-unstaged
  "gc"  'magit-branch-or-checkout
  "gb"  'magit-branch
  "gP"  'magit-push-current
  "gp"  'magit-pull-branch
  "gf"  'magit-fetch
  "gr"  'magit-rebase)


(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))


;;Projectile keybindings
(jbloom/leader-keys
  "pf"  'counsel-projectile-find-file
  "ps"  'counsel-projectile-switch-project
  "pF"  'counsel-projectile-rg
  "pp"  'counsel-projectile
  "pc"  'projectile-compile-project
  "pd"  'projectile-dired
  "pg"  'counsel-ag)

(use-package company
:ensure t
:config
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)
(global-company-mode t))

(use-package flycheck
:ensure t
:init
(global-flycheck-mode t))

(use-package yasnippet
:ensure t
:init
(yas-global-mode 1))

;; Optional: Install a collection of ready-made snippets
(use-package yasnippet-snippets
  :ensure t)

;; Optionally, bind a key for expanding snippets
(global-set-key (kbd "C-c y") 'yas-expand)

(use-package yafolding)

(jbloom/leader-keys
  "f"  '(:ignore t :which-key "yafolding")
  "fb" 'yafolding-toggle-element
  "fa" 'yafolding-toggle-all)

;; Ensure web-mode is installed
(use-package web-mode
  :ensure t
  :mode
  (("\\.phtml\\'" . web-mode)
   ("\\.php\\'" . web-mode)
   ("\\.tpl\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ("\\.html?\\'" . web-mode) ;; Enable for .html files
   ("\\.css\\'" . web-mode) ;; Enable for .css files
   ("\\.jsx\\'" . web-mode)  ;; Enable for JSX files
   ("\\.tsx\\'" . web-mode))) ;; Enable for TSX files)) 

(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)  ;; HTML indentation level
  (setq web-mode-css-indent-offset 2)     ;; CSS indentation level
  (setq web-mode-code-indent-offset 2)    ;; JS/other code indentation level
  (setq web-mode-enable-auto-closing t)   ;; Enable auto-closing tags
  (setq web-mode-enable-auto-pairing t)   ;; Enable auto-pairing of brackets and quotes
  (setq web-mode-auto-close-style 2)      ;; Always auto-close tags (preferred)
  (setq web-mode-enable-auto-quoting t))  ;; Enable auto-quoting for attributes

(add-hook 'web-mode-hook  'my-web-mode-hook)

(defun my-js-mode-hook ()
  (setq js-indent-level 2)) ;; JavaScript indentation level

(add-hook 'js-mode-hook 'my-js-mode-hook)

;; Automatically start eglot for supported modes
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)
(add-hook 'typescript-mode-hook 'eglot-ensure)
(add-hook 'web-mode-hook 'eglot-ensure) ;; For web files (React, HTML, CSS)

;; Enable eglot for C, C++, and C#
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'csharp-mode-hook 'eglot-ensure)

;; Optional: Automatically detect and connect to language servers for eglot
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(web-mode . ("vscode-html-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))   ;; JavaScript
  (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server" "--stdio"))) ;; TypeScript
  (add-to-list 'eglot-server-programs '(web-mode . ("typescript-language-server" "--stdio"))) ;; JSX/TSX files
  (add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(csharp-mode . ("omnisharp")))) ;; Ensure omnisharp is installed

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
