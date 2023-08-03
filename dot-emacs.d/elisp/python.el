(use-package python-mode
  :ensure t
  :custom
  (python-shell-interpreter "python3")
  :hook (python-mode . lsp-deferred))

(use-package tramp
 :ensure nil
 :config
 (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(require 'lsp-mode)
;(with-eval-after-load 'lsp-mode
;  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
(define-key lsp-mode-map (kbd "C-c C-l") lsp-command-map)

(add-to-list 'tramp-remote-path "/n/eddy_lab/users/mmagnus/miniconda3/bin/")

;/n/eddy_lab/users/mmagnus/.local/lib/python3.10/site-packages


(lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection "pyls")
                    :major-modes '(python-mode)
                    :remote? t
                    :server-id 'pyls-remote))

(use-package lsp-ui
    :after lsp
    :hook (lsp-mode . lsp-ui-mode)
    :config
    (setq lsp-ui-sideline-enable t)
    (setq lsp-ui-sideline-show-hover nil)
    (setq lsp-ui-doc-position 'bottom)
    (lsp-ui-doc-show))
