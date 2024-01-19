;;; dot-emacs.el --- Magnus Env
;;; Commentary:
;;;  https://github.com/mmagnus/emacs-env
;;; Code:
; keep this simple to speed up my system ;-)


;; https://stackoverflow.com/questions/24196020/how-to-stop-emacs-from-contaminating-the-clipboard
;(setq x-select-enable-clipboard nil)

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq python-python-command "/Users/magnus/miniconda3/bin/python")

(load-file "~/.emacs.d/elisp/markdown.el")
(load-file "~/.emacs.d/elisp/emacs.el")
(load-file "~/.emacs.d/elisp/bucket/pdb.el")
(load-file "~/.emacs.d/elisp/bucket/random.el") 
(load-file "~/.emacs.d/elisp/dnd.el")
(load-file "~/.emacs.d/elisp/temp.el")
(load-file "~/.emacs.d/elisp/git.el")
(load-file "~/.emacs.d/plugins/calendar-add-events/calendar-add-events.el")
(load-file "/Users/magnus/workspace/OrgModeClockingXBar/OrgModeClockingXBar.el")

;(with-eval-after-load 'flycheck
;  '(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode))


(add-to-list 'load-path "~/.emacs.d/plugins/Highlight-Indentation-for-Emacs")
(require 'highlight-indentation)

;(global-visual-line-mode t) this fucks bookmarks etc
(setq visible-bell 1)
(global-auto-revert-mode 1)
(load-file "~/.emacs.d/plugins/diff-hl/diff-hl.el")
(require 'modeline-posn)
(size-indication-mode 1)
(global-diff-hl-mode)
(setq locate-command "fx")
;; http://pragmaticemacs.com/emacs/dired-human-readable-sizes-and-sort-by-size/
;(setq dired-listing-switches "-alhs")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(bmkp-last-as-first-bookmark-file "/Users/magnus/.emacs.d/bookmarks")
 '(bookmark-save-flag t)
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(csv-separators '(";"))
 '(custom-enabled-themes '(hipster))
 '(custom-safe-themes
   '("58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d1ede12c09296a84d007ef121cd72061c2c6722fcb02cb50a77d9eae4138a3ff" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "5aa819909f6ae87b5425cc94c325aa9fd55e3deb55edb25136bedc6d3eaab6a1" "855eb24c0ea67e3b64d5d07730b96908bac6f4cd1e5a5986493cbac45e9d9636" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "5057614f7e14de98bbc02200e2fe827ad897696bfd222d1bcab42ad8ff313e20" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "9a2dcb3d7c42d508d5bb78eef98c8e9a71ec4ef8bd88a6677e3c237c73fa20eb" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" default))
 '(desktop-save-mode 1)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(linum-format " %7i ")
 '(magit-git-executable "git")
 '(markdown-fontify-code-blocks-natively t)
 '(markdown-hr-string "------------------------")
 '(markdown-max-image-size '(800 . 600))
 '(menu-bar-mode 1)
 '(nrepl-message-colors
   '("#183691" "#969896" "#a71d5d" "#969896" "#0086b3" "#795da3" "#a71d5d" "#969896"))
 '(org-clock-mode-line-total 'current)
 '(org-duration-format 'h:mm)
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(org-indent-indentation-per-level 5)
 '(org-indent-mode-turns-on-hiding-stars f)
 '(org-remove-property-drawers-from-render-output t)
 '(org-startup-truncated t)
 '(org-todo-repeat-to-state "")
 '(org-use-property-inheritance '("Effort"))
 '(package-selected-packages
   '(git-gutter-fringe vscode-dark-plus-theme editorconfig 2bit quelpa-leaf tramp fancy-compilation powerline sr-speedbar zen-mode web-narrow-mode visual-regexp uuidgen uimage tramp-auto-auth tj3-mode tidy test-simple synonyms sublime-themes spotlight sphinx-mode sphinx-frontend sphinx-doc spacemacs-theme skype skewer-mode semi request-deferred rainbow-mode quelpa-use-package python-pylint python-pep8 python-mode python-docstring pytest pyenv-mode pycoverage paredit ox-gfm outline-magic org-random-todo org-ql org-download org-bullets org-autolist multi-term monokai-alt-theme modeline-posn markdown-toc markdown-preview-mode markdown-mode+ lsp-ui lsp-pyright lsp-grammarly load-theme-buffer-local langtool keytar keycast jabber ipython ido-vertical-mode hipster-theme helm-ispell guess-language gptel google-translate google-this github-theme github-notifier gif-screencast general forge focus flyspell-lazy flyspell-correct-popup flymd flymake-python-pyflakes flymake-aspell flymake flycheck-pyflakes flycheck-pos-tip flycheck-popup-tip flycheck-inline flycheck-grammarly flycheck-grammalecte flycheck-color-mode-line flycheck-aspell fiplr exec-path-from-shell ess-smart-underscore ess-R-object-popup eshell-git-prompt emojify el-pocket ein eimp ecb django-mode disk-usage dictionary dic-lookup-w3m demo-it dashboard darkroom dap-mode cyphejor csv-mode company-jedi color-theme-buffer-local cl-generic chatgpt camcorder calfw-gcal calfw build-status blank-mode auto-yasnippet auto-org-md auto-dictionary auto-correct auto-complete-rst ac-slime ac-python ac-php-core ac-ispell ac-helm ac-anaconda ac-R))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(projectile-mode t nil (projectile))
 '(size-indication-mode t)
 '(sr-speedbar-right-side nil)
 '(tool-bar-mode nil)
 '(tool-tab-mode nil)
 '(vc-annotate-very-old-color "#d33682" t)
 '(visual-line-mode 1 t))
 '(size-indication-mode t)
 '(show-paren-mode t)
	  ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(markdown-pre-face ((t (:inherit font-lock-string-face :foreground "gray50"))))
 '(markdown-url-face ((t (:inherit font-lock-string-face :foreground "gray20"))))
	  
;https://stackoverflow.com/questions/445873/how-can-i-make-emacs-mouse-scrolling-slower-and-smoother
(setq mouse-wheel-progressive-speed nil) ; could be too fast
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq scroll-step 2)

(set-cursor-color "#00ccff")

					; https://emacs.stackexchange.com/questions/47597/tramp-with-ssh-not-asking-for-password-too-many-authentication-failures
;(load-file "/Users/magnus/workspace/emacs-env/ssh.el")

	  
(load-file "~/.emacs.d/elisp/insert-safari.el")
(load-file "~/.emacs.d/elisp/compile.el")

(global-set-key (kbd "C-c s") 'eshell)
(define-key org-mode-map "\M-q" 'toggle-truncate-lines)
;(require 'sr-speedbar)

;(setq helm-projectile-fuzzy-match nil)
;(require 'helm-projectile)
;(helm-projectile-on)


;(load-file "~/.emacs.d/plugins/zen-mode/zen-mode.el")
;(require 'zen-mode)

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

;;/n/eddy_lab/users/mmagnus/.local/lib/python3.10/site-packages
;(lsp-register-client
;   (make-lsp-client :new-connection (lsp-tramp-connection "pyls")
;                    :major-modes '(python-mode)
;                    :remote? t
;                    :server-id 'pyls-remote))

(load-file "~/.emacs.d/elisp/outline-ext.el")
(global-set-key (kbd "C-c C-o") 'python-outline)

; lsp-mode

;; (with-eval-after-load 'lsp-mode
;;   (setq lsp-file-watch-ignored-directories
;;         '("[/\\\\]\\rna_tools/opt\\'"
;;           "[/\\\\]\\.dir2\\'"
;;           "[/\\\\]OpenRNAFold/data'"
;;           "[/\\\\]\\.git\\'"
;;           "[/\\\\]build\\"
;;           "[/\\\\]dist\\"
;; 	  "[/\\\\]params\\"
;; 	  "[/\\\\]flash-attention"
;;           ;; Add more directories as needed
;;           )))

;; (setq lsp-file-watch-ignored '("[/\\\\]\\.git$"
;; 			       "[/\\\\]OpenRNAFold/data$"
;;                                "[/\\\\]node_modules$"
;;                                "[/\\\\]build$"
;; 			       ))
;;;; 
;(outline-minor-mode)
;(load-file "~/.emacs.d/elisp/python-mode-outline-mode.el")
;; -- python ---



;(load-file "~/.emacs.d/theme.el")
;(load-file "~/.emacs.d/theme2.el")
; https://emacs-lsp.github.io/lsp-mode/page/performance/
;; (setq read-process-output-max (* 1024 1024)) ;; 1mb
;; (setq lsp-log-io nil) ; if set to true can cause a performance hit

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

;; # python-add-breakpoint http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
(defun python-add-breakpoint ()
    (interactive)
    ;;(py-newline-and-indent)
    (insert "import ipdb; ipdb.set_trace()")
    (highlight-lines-matching-regexp "^[  ]*import ipdb; ipdb.set_trace()")
    )

(require 'ein)
(require 'ein-notebook)
;(require 'ein-subpackages)
;;


(global-set-key (kbd "C-c b") 'python-add-breakpoint)
;(global-set-key (kbd "<backspace>") 'python-add-breakpoint)


;(add-to-list 'load-path (concat user-emacs-directory "elisp/elgantt/")) ;; Or wherever it is located
;(require 'elgantt)
;(setq elgantt-header-column-offset 10)
;	  (setq elgantt-timestamps-to-display '(deadline timestamp scheduled timestamp-range))
;	  (setq elgantt-agenda-files (concat user-emacs-directory "elisp/elgantt/test.org"))
;(setq elgantt-insert-blank-line-between-top-level-header nil)
;(setq elgantt-agenda-files "/Users/magnus/workspace/emacs-env/dot-emacs.d/elisp/elgantt/test.org");/Users/magnus/geekbook/notes/life-curr.org")
	  ;(setq elgantt-insert-header-even-if-no-timestamp 1)



;;(global-set-key
;(eval-after-load 'outline
;  '(progn
;    (require 'outline-magic)
;    (define-key outline-minor-mode-map (kbd "<backtab>") 'outline-cycle)))
;;


;; from chatgpt
(defun open-file-at-point ()
  "Open the file path under the cursor."
  (interactive)
  (let ((file (thing-at-point 'filename)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-c O") 'open-file-at-point)

;; you really only need one of these
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; also for .el231207
(add-to-list 'auto-mode-alist '("\\.el" . emacs-lisp-mode))


;; <https://github.com/rksm/org-ai>
(use-package org-ai
  :ensure t
  :commands (org-ai-mode
             org-ai-global-mode)
  :init
  (add-hook 'org-mode-hook #'org-ai-mode) ; enable org-ai in org-mode
  (org-ai-global-mode) ; installs global keybindings on C-c M-a
  :config
  (setq org-ai-default-chat-model "gpt-4") ; if you are on the gpt-4 beta:
  (org-ai-install-yasnippets)) ; if you are using yasnippet and want `ai` snippets

(global-set-key (kbd "C-c q s") 'org-ai-summarize)
(global-set-key (kbd "C-c q R") 'org-ai-on-region)
(load-file "~/.emacs.d/tokens.el")
(load-file "~/workspace/emacs-send-to-chatgpt/emacs-send-to-chatgpt.el")


;;
(require 'eshell)
(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell/alias "ls" "ls --color=auto")))

;(use-package helm
;  :ensure t
;  :config
;  (helm-mode 1))

; ;; projectile
 (require 'projectile)
 (projectile-mode)
 (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
 (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; (require 'helm-projectile)
;; (helm-projectile-on)

;; (use-package projectile
;;   :ensure t
;;   :config
;;   (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
;;   (projectile mode 1))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))

(global-set-key (kbd "C-c #") 'comment-or-uncomment-region)

;for markdown i dont really need this;
;(global-display-line-numbers-mode)


(defun load-all-files-from-directory (dir)
  "Load all Emacs Lisp files in the directory DIR."
  (dolist (file (directory-files dir t "\\.el$"))
    (load file)))
;(load-all-files-from-directory "~/.emacs.d/elisp")

(add-to-list 'load-path "~/workspace/emacs-env/dot-emacs.d/elisp")
(add-to-list 'load-path "~/workspace/emacs-env/")

(require 'tramp)
;; this config works with eddy ;;
(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)
(setq tramp-connection-timeout 60)
(setq tramp-debug-buffer t)

;(load "my-tramp")
(load "my-theme")


;; (unless (package-installed-p 'quelpa)
;;   (with-temp-buffer
;;     (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
;;     (eval-buffer)
;;     (quelpa-self-upgrade)))

;; (use-package copilot
;;   :quelpa (copilot :fetcher github
;;                    :repo "zerolfx/copilot.el"
;;                    :branch "main"
;;                    :files ("dist" "*.el")))
;; ;; you can utilize :map :hook and :config to customize copilot



;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name
;;         "straight/repos/straight.el/bootstrap.el"
;;         (or (bound-and-true-p straight-base-dir)
;;             user-emacs-directory)))
;;       (bootstrap-version 7))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

;; (setq package-enable-at-startup nil)

;; (use-package copilot
;;   :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
;;   :ensure t)
;; ;; you can utilize :map :hook and :config to customize copilot

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

;;;
(message ".. loaded!")

(menu-bar-mode 1)

;;flyspell 
 (add-hook 'org-mode-hook 'flyspell-mode)
 (add-hook 'python-mode-hook 'flyspell-prog-mode)

;;
;(set-face-attribute 'default nil :family "Cascadia Code" :foundry "nil" :slant normal :weight light :height 150 :width ;normal)
;(set-face-attribute 'default nil :font "Cascadia Code 14" :weight light)
;(set-face-attribute 'default nil :font "Monospace" :height 140 :weight light)
;(set-frame-font "Cascadia Code Light 14" nil t)

(load-file "~/.emacs.d/elisp/writing.el")
(set-frame-font "Menlo 13" nil t)
(set-frame-font "Monaco 13" nil t)
(set-frame-font "Cascadia Code 13" nil t)

(set-mouse-color "fff")
(add-hook 'org-mode-hook
          (lambda ()
            (set-face-attribute 'default nil :font "Menlo-13")))
;(set-frame-font "Cascadia Code 14" nil t)
;(write) ;; to reset font size
;(set-frame-font "Menlo 12" nil t)
;

;; (use-package vscode-dark-plus-theme
;;   :ensure t
;;   :config
;;   (load-theme 'vscode-dark-plus t))

;(defun apply-theme-for-python-mode ()
;  "Apply the 'vscode-dark-plus' theme only in Python mode."
;  (when (equal major-mode 'python-mode)
;    (load-theme 'vscode-dark-plus t)))
;(add-hook 'python-mode-hook 'apply-theme-for-python-mode)

;(require 'git-gutter-fringe)
;(global-git-gutter-mode t)
;(setq git-gutter-fr:side 'right-fringe)


(defun insert-specific-file ()
  "Insert the contents of a specific file at the current cursor position."
  (interactive)
  (let ((file "/Users/magnus/workspace/orgmode-collect-snippets/done.txt"))
    (insert-file-contents file)))


(defun show-current-file-and-position ()
  "Show the current file name and cursor position."
  (interactive)
  (call-process-shell-command "osascript /Users/magnus/workspace/orgmode-collect-snippets/insert.applescript")
  (let ((file (buffer-file-name))
        (position (point)))
    (if file
        (message "File: %s, Position: %d" file position)
      (message "Not in a file buffer"))))

(require 'make-mode)
(add-to-list 'auto-mode-alist '("Snakefile" . python-mode))
