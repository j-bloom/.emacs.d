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
 '(evil-intercept-maps nil)
 '(evil-overriding-maps nil)
)

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
