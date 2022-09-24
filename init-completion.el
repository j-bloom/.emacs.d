(load "~/.emacs.d/init-general.el")

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

(use-package yafolding)

(jbloom/leader-keys
  "f"  '(:ignore t :which-key "yafolding")
  "fb" 'yafolding-toggle-element
  "fa" 'yafolding-toggle-all)
