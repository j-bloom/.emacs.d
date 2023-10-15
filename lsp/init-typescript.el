
(use-package typescript-mode
  :mode (
	 "\\.ts\\'"
	 "\\.tsx\\'")
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))
