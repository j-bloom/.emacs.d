;; To use after loading package, us
;; M-x jedi:install-server
(use-package jedi
:ensure t
:init
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup))
