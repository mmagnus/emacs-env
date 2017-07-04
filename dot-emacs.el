(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/"))
;; from Bogus
(add-to-list 'package-archives
       '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;; # load-path
;(add-to-list 'load-path "~/.emacs.d/plugins/")


;; https://github.com/iqbalansari/emacs-emojify
;(add-hook 'after-init-hook #'global-emojify-mode)


;; source https://github.com/wernerandrew/jedi-starter/blob/master/jedi-starter.el
;; https://www.youtube.com/watch?v=6BlTGPsjGJk
(defvar local-packages '(projectile auto-complete epc jedi ido-vertical-mode))

(defun uninstalled-packages (packages)
  (delq nil
        (mapcar (lambda (p) (if (package-installed-p p nil) nil p)) packages)))
;; This delightful bit adapted from:
;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/

(let ((need-to-install (uninstalled-packages local-packages)))
  (when need-to-install
    (progn
      (package-refresh-contents)
      (dolist (p need-to-install)
	(package-install p)))))
;;


; Emacs Notebook
(require 'ein)
(setq ein:use-auto-complete t)
;(add-to-hook 'after-init-hook 'ein:notebooklist-load)
(add-hook 'ein (lambda nil (load-theme-buffer-local 'tango (current-buffer))))
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
(setq ein:notebook-modes '(ein:notebook-python-mode))
;;Or, to enable "superpack" (a little bit hacky improvements):
(setq ein:use-auto-complete-superpack t)


;; flyspell
(add-hook 'org-mode-hook 'flyspell-mode)

;; terminal
(global-set-key "\C-cm" 'ansi-term)
;; fix of missing tab completion http://stackoverflow.com/questions/18278310/emacs-ansi-term-not-tab-completing
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))


;;
(setq inhibit-startup-message t)


;; # let make happy all emacs clients
(server-start)


;; A GNU Emacs library to ensure environment variables inside Emacs look the same as in the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
 (exec-path-from-shell-initialize))


;; # bookmark+ http://www.emacswiki.org/emacs/bookmark%2B-doc.el http://www.cs.cmu.edu/cgi-bin/info2www?%28emacs%29Bookmarks
;'(load "bookmark+.el")
;(require 'bookmark+)
(setq bookmark-save-flag 1)   ;; autosave each change)
(setq inhibit-splash-screen t)
(bookmark-bmenu-list)


;; Mac stuff
;; unset alt
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
(setq ns-right-alternate-modifier nil)


;; Used mostly for my geekbook, reload a file if modified
;; auto revert http://stackoverflow.com/questions/1480572/how-to-have-emacs-auto-refresh-all-buffers-when-files-have-changed-on-disk
(global-auto-revert-mode t)


;; https://www.emacswiki.org/emacs/AlarmBell
(setq ring-bell-function 'ignore)


;; lista
(global-set-key (kbd "C-x C-b") 'buffer-menu)


;; PYTHON -------------------------------------------------------------
;; # yasnippet https://github.com/capitaomorte/yasnippet
  ;(add-to-list 'load-path
  ;              "~/.emacs.d/elpa/yasnippet-20130218.2229")
  (require 'yasnippet)
  (yas/global-mode 1)


;; projectile
(require 'projectile)
(projectile-global-mode)

;; https://github.com/creichert/ido-vertical-mode.el
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)


  ;; # color (set-face-background 'highlight "#FFF498")  ;; orange
  ;(global-hl-line-mode t)


  (add-to-list 'load-path "~/.emacs.d/settings")
  ;(require 'python-el-settings) ;; off this plugin


  ;; # color (set-face-background 'highlight "#FFF498")  ;; orange
  ;(global-hl-line-mode t)


  ;; https://mail.python.org/pipermail/python-list/2002-May/128695.html
  ;; python-outline
  ;(setq outline-start-hidden t)
  ;(load-library "python-outline")
  ;(setq auto-mode-alist (append '(
  ;    ("\\.texi" . texi-outline)
  ;    ("\\.py" . python-outline))
  ;              auto-mode-alist))

  ;; https://github.com/kostafey/sphinx-frontend
  (require 'sphinx-frontend)


  ;; sphinx--X
;  (eval-after-load "rst" '(auto-complete-rst-init))


  ;; sphinx-doc
  (add-hook 'python-mode-hook (lambda ()
                                  (require 'sphinx-doc)
                                  (sphinx-doc-mode t)))


  ;;python-mode.el
  (autoload 'python-mode "python-mode" "Python Mode." t)
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
  (add-to-list 'interpreter-mode-alist '("ipython" . python-mode))


  ;; jedi melpa @jedi
  ;; this should be after python-model.el load
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)                      ; optional
  (setq jedi:complete-on-dot t)                 ; optional
  (setq jedi:tooltip-method '(pos-tip popup))   ; popup window
  (put 'set-goal-column 'disabled nil)


  ;; pylint
  ;(autoload 'pylint "pylint")
  ;(add-hook 'python-mode-hook 'pylint-add-menu-items)
  ;(add-hook 'python-mode-hook 'pylint-add-key-bindings)


  ;; # highlight the import pdb text; anotate pdb http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
  (defun annotate-pdb ()
    (interactive)
    (highlight-lines-matching-regexp "import pdb")
    (highlight-lines-matching-regexp "pdb.set_trace()"))
  (add-hook 'python-mode-hook 'annotate-pdb)


  ;; # python-add-breakpoint http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
  (defun python-add-breakpoint ()
    (interactive)
    ;;(py-newline-and-indent)
    (insert "import ipdb; ipdb.set_trace()")
    (highlight-lines-matching-regexp "^[  ]*import ipdb; ipdb.set_trace()")
    )
  ;;(define-key py-mode-map (kbd "C-c C-b") 'python-add-breakpoint)
  ;;(global-set-key (kbd "<f8>") 'python-add-breakpoint)
  ;;(local-set-key (kbd "<f8>") 'python-add-breakpoint)
(eval-after-load 'python-mode
'(define-key python-mode-map (kbd "<f8>") 'python-add-breakpoint))


;; keybinding for magit status (https://github.com/AndreaCrotti/minimal-emacs-configuration/blob/master/init.el)
;; magit
(require 'magit)
(global-set-key "\C-cg" 'magit-status)


;; C-u C-c # http://stackoverflow.com/questions/12381692/how-to-uncomment-code-block-in-emacs-python-mode
;(global-set-key (kbd "\C-cu")  'uncomment-region)
;  

(require 'flycheck)
(global-flycheck-mode t)


;; RNA -----------------------------------------------------------------
  ;; ralee mode is good for RNA alignment editing # http://personalpages.manchester.ac.uk/staff/sam.griffiths-jones/software/ralee/
  (add-to-list 'load-path "~/.emacs.d/plugins/ralee/elisp")
  (autoload 'ralee-mode "ralee-mode" "Yay! RNA things" t)
  (setq auto-mode-alist (cons '("\\.stk$" . ralee-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.sto$" . ralee-mode) auto-mode-alist))


  ;; pdb.el
  (load-file "~/.emacs.d/plugins/pdb-mode/pdb-mode.el")
  (setq pdb-rasmol-name "/usr/bin/pymol")
  (setq auto-mode-alist
       (cons (cons "pdb$" 'pdb-mode) 
             auto-mode-alist ) )
  (autoload 'pdb-mode "PDB")
;; WEB DEV -----------------------------------------------------------------
  (autoload 'tidy-parse-config-file "tidy" "Parse the `tidy-config-file'" t)
  (autoload 'tidy-save-settings "tidy" "Save settings to `tidy-config-file'" t)
  (autoload 'tidy-build-menu  "tidy" "Install an options menu for HTML Tidy." t)

  ;If you use html-mode to edit HTML files then add something like
  ;this as well

  (defun my-html-mode-hook () "Customize my html-mode."
    (tidy-build-menu html-mode-map)
    (local-set-key [(control c) (control c)] 'tidy-buffer)
    (setq sgml-validate-command "tidy"))

  (add-hook 'html-mode-hook 'my-html-mode-hook)

  ;This will set up a "tidy" menu in the menu bar and bind the key
  ;sequence "C-c C-c" to `tidy-buffer' in html-mode (normally bound to
  ;`validate-buffer').

  ;For other modes (like html-helper-mode) simple change the variables
  ;`html-mode-hook' and `html-mode-map' to whatever is appropriate e.g.

  (defun my-html-mode-hook () "Customize my html-helper-mode."
    (tidy-build-menu html-helper-mode-map)
    (local-set-key [(control c) (control c)] 'tidy-buffer)
    (setq sgml-validate-command "tidy"))

  (add-hook 'html-helper-mode-hook 'my-html-mode-hook)
;; SETTINGS -----------------------------------------------------------------
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/home/magnus/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(display-time-mode t)
 '(fringe-mode (quote (0)) nil (fringe))
 '(markdown-hr-string
   "--------------------------------------------------------------------------------")
 '(org-agenda-category-icon-alist
   (quote
    (("work-curr" "~/Dropbox/curr_dropbox/org_mode_icon/icon.png" nil nil))))
 '(org-agenda-custom-commands
   (quote
    (("o" "Agenda and all TODO's work*.org"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/work-curr.org")))))
       (alltodo ""
		((org-agenda-files
		  (quote
		   ("~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/work-inbox.org")))))))
     ("l" "Agenda life*.org"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/life-curr.org" "~/Dropbox/geekbook/notes/life-today.org")))))))
     (";" "Agenda and all TODO's life*.org"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/life-curr.org" "~/Dropbox/geekbook/notes/life-today.org")))))
       (alltodo ""
		((org-agenda-files
		  (quote
		   ("~/Dropbox/geekbook/notes/life-archive.org" "~/Dropbox/geekbook/notes/life-curr.org" "~/Dropbox/geekbook/notes/life-today.org")))))))
     ("x" "Agenda and all TODO's eXtremal science "
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/science.org")))))
       (alltodo ""
		((org-agenda-files
		  (quote
		   ("~/Dropbox/geekbook/notes/science.org")))))))
     ("k" "Agenda and all TODO's s[k]ills"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/skills-curr.org")))))
       (alltodo ""
		((org-agenda-files
		  (quote
		   ("~/Dropbox/geekbook/notes/skills-curr.org")))))))
     ("w" "Agenda work*.org"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/work-someday.org" "~/Dropbox/geekbook/notes/work-extra.org" "~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/work-archive.org" "~/Dropbox/geekbook/notes/work-inbox.org")))))))
     ("n" "Agenda and all TODO's"
      ((agenda "" nil)
       (alltodo "" nil))
      nil))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/geekbook/notes/work-someday.org" "~/Dropbox/geekbook/notes/work-extra.org" "~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/work-archive.org" "~/Dropbox/geekbook/notes/work-inbox.org")))
 '(org-agenda-span (quote day))
 '(org-indent-indentation-per-level 5)
 '(org-indent-mode-turns-on-hiding-stars f)
 '(package-selected-packages
   (quote
    (ido-vertical-mode ox-gfm auto-org-md sphinx-mode sphinx-frontend sphinx-doc auto-complete-rst ac-helm pylint python jedi-core ipython outline-magic writeroom-mode wanderlust tidy synonyms stem skype python-pylint python-pep8 python-mode projectile powerline multi-term markdown-mode+ magit-tramp jedi jabber hipster-theme helm-ispell helm google-translate git-rebase-mode git-commit-mode focus flyspell-popup flymake-python-pyflakes flymake flycheck fiplr find-file-in-repository exec-path-from-shell ess-smart-underscore ess-R-object-popup eimp ecb dictionary darkroom color-theme cl-generic calfw-gcal calfw auto-yasnippet auto-dictionary ac-slime ac-python ac-php-core ac-ispell ac-R)))
 '(py-keep-windows-configuration t)
 '(tool-bar-mode nil))
  
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 110 :width normal)))))
;; My plugins ----------------------------------------------------------
  ;; Insert curr date use with Geekbook
  ;; http://www.emacswiki.org/emacs/InsertingTodaysDate
  (defun insert-current-date () (interactive)
     (insert (shell-command-to-string "echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
  (global-set-key (kbd "C-c .") 'insert-current-date)
;; OrgMode ----------------------------------------------------------
 ;; hide @toolbar
  (setq org-todo-keywords (quote ((sequence "TODO" "PROG" ">>>>" "WAIT" "DROP" "DONE"))))
  (setq org-todo-keyword-faces
             '(("TODO" . org-warning)
  	     ("PROG" . (:foreground "blue"))
  	     (">>>>" .  "dark orange")
  	     ("WAIT" . "violet")
  	     ("DROP" . "grey")
  	     ))


  ;(setq org-agenda-custom-commands 
  ;      '(("w" "work" ;; (1) (2) (3) (4)
  ;         ((org-agenda-files '("/home/magnus/Dropbox/lb_v2/md/work-curr.org" "/home/magnus/Dropbox/lb_v2/md/work-extra.org")) ;; (5)
  ;          (org-agenda-sorting-strategy '(priority-up effort-down))) ;; (5) cont.
  ;         ) ;; (6)
  ;        ;; ...other commands here
  ;        )
  ;)

  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)

  (lambda ()
  (interactive)
  (org-agenda-refile nil nil t))


  (setq org-directory "~/Dropbox/geekbook/notes/")
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
  (setq org-mobile-files '("~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/life-curr.org" "~/Dropbox/geekbook/notes/life-context.org" "~/Dropbox/geekbook/notes/skills-curr.org"))
  (setq org-mobile-inbox-for-pull "~/Dropbox/geekbook/notes/mobile-org-inbox.org")
  ;;(setq org-mobile-inbox-for-pull "~/Dropbox/inbox.org")
  (put 'upcase-region 'disabled nil)

  (org-mode)
  (org-mobile-pull)
  (add-hook 'after-init-hook 'org-mobile-pull)
  (add-hook 'after-init-hook 'org-mobile-push)
  (add-hook 'kill-emacs-hook 'org-mobile-push)
  (add-hook 'kill-emacs-hook 'org-mobile-pull)
;; ENGLISH/SPELLING/WRITING -----------------------------------------------
  ;; google-translate
  (require 'google-translate)

  (global-set-key "\C-ct" 'google-translate-at-point)
  (global-set-key "\C-cr" 'google-translate-at-point-reverse)
  ;;(global-set-key (kbd "C-c r") 'google-translate-at-point-reverse)
  ;;(global-set-key "\C-c" 'google-translate-at-point-reverse)
  ;;(global-set-key "\C-cT" 'google-translate-query-translate)
  ;;(global-set-key (kbd "C-c R") 'google-translate-query-translate-reverse)
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "pl")
;; MARKDOWN --------------------------------------------------------------------
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (put 'narrow-to-region 'disabled nil)
  ;; duplicate line C-c C-d
  (global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")
;; THEME --------------------------------------------------------------------
(require 'hipster-theme) ;; should be before powerline, otherwise it seems that it overwrites powerline


  ;; powerline
  (require 'cl)
  (require 'powerline)
  (powerline-default-theme)
  (set-face-attribute 'mode-line nil
                      :foreground "Black"
                      :background "DarkOrange"
                      :box nil)  

;;  (old) python-outline
;; -------------------------------------------------------------
;; it has to be at the end, then it works by default!
;; https://mail.python.org/pipermail/python-list/2002-May/128695.html
;;(add-to-list 'load-path "~/.emacs.d/plugins/python-outline/")
(load-file "~/.emacs.d/plugins/python-outline/python-outline.el")
;(setq outline-start-hidden t)
(setq auto-mode-alist (append '(
    ("\\.text" . texi-outline)
    ("\\.py" . python-outline))
             auto-mode-alist))

;; Emacs lips mode <http://ergoemacs.org/emacs/reclaim_keybindings.html>
(define-key emacs-lisp-mode-map (kbd "C-c b") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-c r") 'eval-region)


;;
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)
(put 'downcase-region 'disabled nil)


(scroll-bar-mode -1)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;; tramp
(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;;https://stackoverflow.com/questions/4532024/different-color-themes-per-mode-in-emacs?rq=1
(defun w () 
       (interactive)
         (let ((color-theme-is-global nil))
           ;;(load-theme 'whiteboard t)
          (load-theme-buffer-local 'whiteboard (current-buffer))
          )
         )

(defun b () 
       (interactive)
         (let ((color-theme-is-global nil))
          ;;(load-theme 'wombat t)
          (load-theme-buffer-local 'wombat (current-buffer))
          )
         )
