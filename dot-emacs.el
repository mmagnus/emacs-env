;;; Intro
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


(require 'tramp)
;; this config works with eddy ;;
(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)
(setq tramp-connection-timeout 60)
(setq tramp-debug-buffer t)


;; run as a server
;; let make happy all emacs clients
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
(add-to-list 'auto-mode-alist '("\\.el\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.elbak\\'" . emacs-lisp-mode))

(server-start)
; so you will not have bl\<a new line> 
(visual-line-mode)

;; Insert curr date use with Geekbook <http://www.emacswiki.org/emacs/InsertingTodaysDate>
(defun insert-current-date () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (insert (shell-command-to-string "echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d-%a)
(global-set-key (kbd "C-c .") 'insert-current-date)


(require 'yasnippet)
(yas/global-mode 1)

;(set-frame-font "Monaco 14" nil t)

;(set-face-attribute 'default nil :family "Cascadia Code Light 14" :height 140)
(set-face-attribute 'default nil :family "Menlo" :height 140)

(load-file "~/.emacs.d/elisp/shortcuts.el")
(load-file "~/.emacs.d/elisp/mac.el")
(global-set-key (kbd "C-x C-b") 'buffer-menu)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil :family "Menlo" :foundry "nil" :slant normal :weight regular :height 200 :width normal))))
 '(custom-enabled-themes '(hipster))
 '(custom-safe-themes
   '("ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" default))
 '(desktop-save-mode 1)
 '(org-agenda-custom-commands
   '(("o" "work*.org Agenda and all TODO's"
      ((agenda ""
	       ((org-agenda-files
		 '("~//geekbook/notes/work-curr.org" "~//geekbook/notes/inbox.org"))))))
     ("O" "work*.org Agenda and all TODO's "
      ((agenda ""
	       ((org-agenda-files
		 '("~//geekbook/notes/work-curr.org" "~//geekbook/notes/inbox.org"))))
       (alltodo ""
		((org-agenda-files
		  '("~//geekbook/notes/work-curr.org" "~//geekbook/notes/inbox.org"))))))
     ("j" "curr*.org A"
      ((agenda ""
	       ((org-agenda-files
		 '("~//geekbook/notes/life-curr.org" "~//geekbook/notes/work-curr.org" "~//geekbook/notes/orgmode/skills-curr.org"))))))
     (":" "life*.org A+T"
      ((agenda ""
	       ((org-agenda-files
		 '("~//geekbook/notes/life-curr.org" "~//geekbook/notes/inbox.org"))))
       (alltodo ""
		((org-agenda-files
		  '("~//geekbook/notes/life-archive.org" "~//geekbook/notes/life-curr.org" "~//geekbook/notes/orgmode/life-today.org"))))))
     (";" "life*.org Agenda only"
      ((agenda ""
	       ((org-agenda-files
		 '("~/geekbook/notes/life-curr.org" "~/geekbook/notes/inbox.org"))))))
     ("k" "s[k]ills Agenda and all TODO's "
      ((agenda ""
	       ((org-agenda-files
		 '("~/geekbook/notes/skills-curr.org"))))
       (alltodo ""
		((org-agenda-files
		  '("~/geekbook/notes/skills-curr.org"))))))
     ("n" "TODO's Agenda and all"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)))
 '(org-agenda-files
   '("~/geekbook/notes/work-curr.org" "~/geekbook/notes/life-curr.org" "~/geekbook/notes/inbox.org"))
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-span 'day)
 '(org-capture-templates
   '(("t" "Todo Life" entry
      (file+headline "~/geekbook/notes/life-curr.org" "#inbox")
      "* %?\12  %i\12  %a")
     ("x" "Test" entry
      (file+headline "~/geekbook/notes/life-curr.org" "#inbox")
      "** TODO %^{Description} [why] %^{why} [why not] %^{why not}\12  %?\12  :LOGBOOK:\12  - Added: %U\12  :END:\12  %a\12")
     ("w" "Todo Work" entry
      (file+headline "~/geekbook/notes/work-curr.org" "#inbox")
      "* TODO %?  %i %a")))
 '(package-selected-packages
   '(bicycle zen-mode web-narrow-mode vscode-dark-plus-theme visual-regexp uuidgen uimage tj3-mode tidy test-simple synonyms sublime-themes sr-speedbar spotlight sphinx-mode sphinx-frontend sphinx-doc spacemacs-theme skype skewer-mode semi request-deferred rainbow-mode quelpa-use-package quelpa-leaf python-pylint python-pep8 python-mode python-docstring pytest pyenv-mode pycoverage powerline paredit ox-gfm outline-magic org-random-todo org-ql org-download org-bullets org-autolist org-ai multi-term monokai-alt-theme modeline-posn markdown-toc markdown-preview-mode markdown-mode+ lsp-ui lsp-pyright lsp-grammarly load-theme-buffer-local langtool keytar keycast jabber ipython ido-vertical-mode hipster-theme helm-projectile helm-ispell guess-language gptel google-translate google-this github-theme github-notifier gif-screencast general fringe-helper forge focus flyspell-lazy flyspell-correct-popup flymd flymake-python-pyflakes flymake-aspell flymake flycheck-pyflakes flycheck-pos-tip flycheck-popup-tip flycheck-inline flycheck-grammarly flycheck-grammalecte flycheck-color-mode-line flycheck-aspell fiplr fancy-compilation exec-path-from-shell ess-smart-underscore ess-R-object-popup eshell-git-prompt emojify emacsql-sqlite el-pocket ein eimp editorconfig ecb django-mode disk-usage dictionary dic-lookup-w3m demo-it dashboard darkroom dap-mode cyphejor csv-mode company-jedi color-theme-buffer-local cl-generic chatgpt-shell chatgpt camcorder calfw-gcal calfw build-status blank-mode auto-yasnippet auto-org-md auto-dictionary auto-correct auto-complete-rst applescript-mode ac-slime ac-python ac-php-core ac-ispell ac-helm ac-anaconda ac-R 2bit)))

;; (use-package copilot
;;   :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
;;   :ensure t)
;; ;; you can utilize :map :hook and :config to customize copilot

;;; copilot
(add-to-list 'load-path "~/.emacs.d/plugins/copilot.el")
(require 'copilot)
(with-eval-after-load 'company
  ;; disable inline previews
  (delq 'company-preview-if-just-one-frontend company-frontends))
  
(with-eval-after-load 'copilot
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "C-TAB") 'copilot-accept-completion-by-word)
  (define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion-by-word))

(add-hook 'prog-mode-hook 'copilot-mode)

;;; compile
(load-file "~/.emacs.d/elisp/compile.el")
;;; from chatgpt
(defun open-file-at-point ()
  "Open the file path under the cursor."
  (interactive)
  (let ((file (thing-at-point 'filename)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-c O") 'open-file-at-point)

;;; PYTHON
; 2023 new python toys
(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))


;; critical for python-lsp running remotely!
(use-package tramp
 :ensure nil
 :config
 (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
;(add-to-list 'tramp-remote-path "/n/eddy_lab/users/mmagnus/miniconda3/bin/")
 )

(setq lsp-log-io t)

(use-package lsp-mode
  :hook
  ((python-mode . lsp)))

(use-package lsp-ui
  :commands lsp-ui-mode)


(require 'lsp-mode)
;(with-eval-after-load 'lsp-mode
;  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
(define-key lsp-mode-map (kbd "C-c C-l") lsp-command-map)
;;fix for lsp-mode on cluster????

;; END
;(set-frame-font "Cascadia Code 20" nil t)

(load-file "~/.emacs.d/elisp/outline-ext.el")
(global-set-key (kbd "C-c C-o") 'python-outline)

;;; elips
(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)


;;; orgmode
(load-file "~/.emacs.d/elisp/orgmode.el")

;;; writing
(load-file "~/.emacs.d/elisp/writing.el")

(use-package bicycle
  :after outline
  :bind (:map outline-minor-mode-map
              ([S-tab] . bicycle-cycle)
              ([C-tab] . bicycle-cycle-global)))

(use-package prog-mode
  :config
  (add-hook 'prog-mode-hook 'outline-minor-mode)
  (add-hook 'prog-mode-hook 'hs-minor-mode))

;;; git
(load-file "~/.emacs.d/elisp/git.el")
;;; Insert Safari
(load-file "~/.emacs.d/elisp/insert-safari.el")

;;; Shell
(global-set-key (kbd "C-c s") 'eshell)

;;; geekbook
(load-file "~/.emacs.d/elisp/dnd.el")
;(load-file "~/.emacs.d/elisp/geekbook.el")
;;; Random
(load-file "~/.emacs.d/elisp/bucket/random.el") 
