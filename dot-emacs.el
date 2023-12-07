;;; dot-emacs.el --- Magnus Env
;;; Commentary:
;;;  https://github.com/mmagnus/emacs-env
;;; Code:
; keep this simple to speed up my system ;-)

;(set-face-attribute 'default nil :family "Cascadia Code" :foundry "nil" :slant normal :weight light :height 150 :width normal)
;(set-face-attribute 'default nil :font "Cascadia Code 14" :weight light)
;(set-face-attribute 'default nil :font "Monospace" :height 140 :weight light)
(set-frame-font "Cascadia Code Light 14" nil t)
;(set-frame-font "Menlo 14" nil t)
(set-mouse-color "fff")

;; https://stackoverflow.com/questions/24196020/how-to-stop-emacs-from-contaminating-the-clipboard
;(setq x-select-enable-clipboard nil)

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq python-python-command "/Users/magnus/miniconda3/bin/python")

(load-file "~/.emacs.d/elisp/shortcuts.el")
(load-file "~/.emacs.d/elisp/mac.el")
;(load-file "~/.emacs.d/theme.el")
(load-file "~/.emacs.d/elisp/writing.el")
(load-file "~/.emacs.d/elisp/markdown.el")
(load-file "~/.emacs.d/elisp/emacs.el")
(load-file "~/.emacs.d/elisp/bucket/pdb.el")
(load-file "~/.emacs.d/elisp/bucket/random.el") 
(load-file "~/.emacs.d/elisp/bucket/projectile.el")
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
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   '("#183691" "#969896" "#a71d5d" "#969896" "#0086b3" "#795da3" "#a71d5d" "#969896"))
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
      "* %?
  %i
  %a")
     ("x" "Test" entry
      (file+headline "~/geekbook/notes/life-curr.org" "#inbox")
      "** TODO %^{Description} [why] %^{why} [why not] %^{why not}
  %?
  :LOGBOOK:
  - Added: %U
  :END:
  %a
")
     ("w" "Todo Work" entry
      (file+headline "~/geekbook/notes/work-curr.org" "#inbox")
      "* TODO %?  %i %a")))
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
   '(fancy-compilation powerline sr-speedbar zen-mode web-narrow-mode visual-regexp uuidgen uimage tramp-auto-auth tj3-mode tidy test-simple synonyms sublime-themes spotlight sphinx-mode sphinx-frontend sphinx-doc spacemacs-theme skype skewer-mode semi request-deferred rainbow-mode quelpa-use-package python-pylint python-pep8 python-mode python-docstring pytest pyenv-mode pycoverage paredit ox-gfm outline-magic org-random-todo org-ql org-download org-bullets org-autolist multi-term monokai-alt-theme modeline-posn markdown-toc markdown-preview-mode markdown-mode+ lsp-ui lsp-pyright lsp-grammarly load-theme-buffer-local langtool keytar keycast jabber ipython ido-vertical-mode hipster-theme helm-projectile helm-ispell guess-language gptel google-translate google-this github-theme github-notifier gif-screencast general forge focus flyspell-lazy flyspell-correct-popup flymd flymake-python-pyflakes flymake-aspell flymake flycheck-pyflakes flycheck-pos-tip flycheck-popup-tip flycheck-inline flycheck-grammarly flycheck-grammalecte flycheck-color-mode-line flycheck-aspell fiplr exec-path-from-shell ess-smart-underscore ess-R-object-popup eshell-git-prompt emojify el-pocket ein eimp ecb dockerfile-mode docker-tramp django-mode disk-usage dictionary dic-lookup-w3m demo-it dashboard darkroom dap-mode cyphejor csv-mode company-jedi color-theme-buffer-local cl-generic chatgpt camcorder calfw-gcal calfw build-status blank-mode auto-yasnippet auto-org-md auto-dictionary auto-correct auto-complete-rst ac-slime ac-python ac-php-core ac-ispell ac-helm ac-anaconda ac-R))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(projectile-mode t nil (projectile))
 '(size-indication-mode t)
 '(sr-speedbar-right-side nil)
 '(tool-bar-mode nil)
 '(tool-tab-mode nil)
 '(tramp-use-ssh-controlmaster-options nil)
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
(require 'tramp)
(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)
;;#(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
	  
(load-file "~/.emacs.d/elisp/insert-safari.el")
(load-file "~/.emacs.d/elisp/compile.el")
(load-file "~/.emacs.d/elisp/orgmode.el")


(global-set-key (kbd "C-c s") 'shell)
(define-key org-mode-map "\M-q" 'toggle-truncate-lines)
;;(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;(require 'sr-speedbar)

;; (setq helm-projectile-fuzzy-match nil)
;(require 'helm-projectile)
;(helm-projectile-on)


;(load-file "~/.emacs.d/plugins/zen-mode/zen-mode.el")
;(require 'zen-mode)

; 2023 new python toys
(load-file "~/.emacs.d/elisp/python.el")
;(load-file "~/.emacs.d/theme.el")
;(load-file "~/.emacs.d/theme2.el")
; https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-log-io nil) ; if set to true can cause a performance hit
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


; lsp-mode
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\rna_tools/opt\\'")
  ;; or
  (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\rna_tools/opt\\'"))


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

