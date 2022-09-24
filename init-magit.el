(load "~/.emacs.d/init-general.el")

(add-to-list 'load-path "~/.emacs.d/init-general.el")
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))


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
