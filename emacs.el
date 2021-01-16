;; run as a server
;; let make happy all emacs clients
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
(add-to-list 'auto-mode-alist '("\\.el\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.elbak\\'" . emacs-lisp-mode))

(server-start)
