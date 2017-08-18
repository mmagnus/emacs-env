;; my binding
(global-set-key "\C-cR" 'rename-buffer)
(global-set-key "\C-cl" 'locate)
(global-set-key "\C-cq" 'grep)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;; Emacs lips mode <http://ergoemacs.org/emacs/reclaim_keybindings.html>
(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-c r") 'eval-region)

(global-set-key "\C-xt" 'term)

;; https://github.com/realgud/realgud/wiki/ANSI-Terminal-Escape-appearing-in-Buffers
(setenv "TERM" "dumb")

;; let make happy all emacs clients
(server-start)
(setq inhibit-startup-message t)

;; Emacs Lisp Package Archive
(require 'package)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
       '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; Ipython Notebook
; Emacs Notebook
(require 'ein)
(setq ein:use-auto-complete t)
;(add-to-hook 'after-init-hook 'ein:notebooklist-load)
(add-hook 'ein (lambda nil (load-theme-buffer-local 'tango (current-buffer))))
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
(setq ein:notebook-modes '(ein:notebook-python-mode))
;;Or, to enable "superpack" (a little bit hacky improvements):
(setq ein:use-auto-complete-superpack t)
;(global-set-key "\C-cn" 'ein:notebooklist-open)



;; flyspell
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)
;(add-hook 'python-mode-hook 'flyspell-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode) ;; https://stackoverflow.com/questions/2455062/how-to-spell-check-python-docstring-with-emacs


;; ispell
(global-set-key "\C-ci" 'ispell)


;; # bookmark+ http://www.emacswiki.org/emacs/bookmark%2B-doc.el http://www.cs.cmu.edu/cgi-bin/info2www?%28emacs%29Bookmarks
;'(load "bookmark+.el")
;(require 'bookmark+)
(setq bookmark-save-flag 1)   ;; autosave each change)
(setq inhibit-splash-screen t)
(bookmark-bmenu-list)


;; A GNU Emacs library to ensure environment variables inside Emacs look the same as in the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
 (exec-path-from-shell-initialize))


;; Mac stuff
;; unset alt
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
(setq ns-right-alternate-modifier nil)


;; https://www.emacswiki.org/emacs/AlarmBell
(setq ring-bell-function 'ignore)


;; used mostly for my geekbook, reload a file if modified
;; auto revert http://stackoverflow.com/questions/1480572/how-to-have-emacs-auto-refresh-all-buffers-when-files-have-changed-on-disk
(global-auto-revert-mode t)


;;https://www.emacswiki.org/emacs/DeletingWhitespace#toc3
(add-hook 'python-mode-hook
	    (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))


;; https://www.emacswiki.org/emacs/ShowWhiteSpace
(require 'blank-mode)


;; projectile
(require 'projectile)
(projectile-global-mode)


;; keybinding for magit status (https://github.com/AndreaCrotti/minimal-emacs-configuration/blob/master/init.el)
;; magit
(require 'magit)
(global-set-key "\C-cg" 'magit-status)


;; flycheck
(require 'flycheck)
(global-flycheck-mode t)
;; flycheck-pos-tip
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
;;
(setq-default flycheck-flake8-maximum-line-length 100)
;;
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
;;
;; flymake
(require 'flymake-cursor)


;; @rna
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


;; @markdown
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (put 'narrow-to-region 'disabled nil)
  ;; duplicate line C-c C-d
  (global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")


;; @csv
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)
(put 'downcase-region 'disabled nil)


;; @google-this-mode
;(google-this-mode 1)
;(global-set-key (kbd "C-x g") 'google-this-mode-submap)
;(global-set-key (kbd "C-c g w") 'google-word)
;(global-set-key (kbd "C-c g t") 'google-this)
;(global-set-key (kbd "C-c g l") 'google-line)
;(global-set-key (kbd "C-c g r") 'google-region)

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


;; tramp
(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)


;; SETTINGS -----------------------------------------------------------------


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 110 :width normal)))))

;; OrgMode ----------------------------------------------------------
;; hide @toolbar
(setq org-todo-keywords (quote ((sequence "TODO" "INPROGRESS" ">>>>" "WAITING" "DONE"))))
(setq org-todo-keyword-faces
             '(("TODO" . org-warning)
  	     ("INPROGRESS" . (:foreground "orange"))
  	     (">>>>" .  "dark orange")
  	     ("WAITING" . "violet")
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
(setq org-mobile-files '("~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/life-curr.org"  "~/Dropbox/geekbook/notes/skills-curr.org"))
(setq org-mobile-inbox-for-pull "~/Dropbox/geekbook/notes/inbox.org")
;;(setq org-mobile-inbox-for-pull "~/Dropbox/inbox.org")
(put 'upcase-region 'disabled nil)

(org-mode)
(org-mobile-pull)
(add-hook 'after-init-hook 'org-mobile-pull)
(add-hook 'after-init-hook 'org-mobile-push)
(add-hook 'kill-emacs-hook 'org-mobile-push)
(add-hook 'kill-emacs-hook 'org-mobile-pull)


;; @plugins
(load "~/.emacs.d/my-plugins.el")

;; @writing
(load "~/.emacs.d/my-writing.el")

;; @writing
(load "~/.emacs.d/my-theme.el")

;; @writing
(load "~/.emacs.d/my-web-dev.el")

;; config
(load "~/.emacs.d/my-config.el")

;; @writing
(load "~/.emacs.d/my-python.el")


;; https://stackoverflow.com/questions/2020941/how-can-i-hide-the-backup-files-that-emacs-creates
;; Don't clutter up directories with files~
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;(setq dotfiles-dir (file-name-directory (or load-file-name (buffer-file-name))))
;(setq backup-directory-alist `(("." . ,(expand-file-name
 ;                                   (concat dotfiles-dir "backups")))))

;; Don't clutter with #files either
;(setq auto-save-file-name-transforms
;      `((".*" ,(expand-file-name (concat dotfiles-dir "backups")))))


;; https://www.emacswiki.org/emacs/NoTabs
(setq-default indent-tabs-mode nil)
