;;; dot-emacs.el --- Magnus Env
;;; Commentary:
;;;  https://github.com/mmagnus/emacs-env
;;; Code:
(global-set-key "\C-cR" 'rename-buffer)
(global-set-key "\C-cl" 'locate)
(global-set-key "\C-cq" 'grep)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;; Emacs lips mode <http://ergoemacs.org/emacs/reclaim_keybindings.html>
(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-c r") 'eval-region)


(define-key emacs-lisp-mode-map (kbd "C-c D") 'darkroom-mode)

(global-set-key "\C-xt" 'term)

;; https://github.com/realgud/realgud/wiki/ANSI-Terminal-Escape-appearing-in-Buffers
(setenv "TERM" "dumb")

;; let make happy all emacs clients
(server-start)
(setq inhibit-startup-message t)

;; Emacs Lisp Package Archive
(require 'package)
;; Add the user-contributed repository
(add-to-list 'package-archives
       '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
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
(projectile-mode)


;; keybinding for magit status (https://github.com/AndreaCrotti/minimal-emacs-configuration/blob/master/init.el)
;; magit
(require 'magit)
(global-set-key "\C-cg" 'magit-status)


;; flycheck
(require 'flycheck)
(global-flycheck-mode t)
;; flycheck-pos-tip
;(with-eval-after-load 'flycheck
;  (flycheck-pos-tip-mode))
;;
(setq-default flycheck-flake8-maximum-line-length 100)
;;
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))


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
 '(markdown-code-face ((t (:inherit Green :background "Black")))))

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
(setq org-mobile-files '("~/Dropbox/geekbook/notes/sandbox.org" "~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/life-curr.org"  "~/Dropbox/geekbook/notes/skills-curr.org"))
(setq org-mobile-inbox-for-pull "~/Dropbox/geekbook/notes/sandbox.org")
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-fuzzy-limit 2)
 '(ac-ispell-requires 4)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(bmkp-last-as-first-bookmark-file "/home/magnus/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(csv-separators (quote (",")))
 '(custom-safe-themes
   (quote
    ("eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "9a2dcb3d7c42d508d5bb78eef98c8e9a71ec4ef8bd88a6677e3c237c73fa20eb" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(exec-path-from-shell-check-startup-files nil)
 '(indicate-empty-lines t)
 '(jedi:tooltip-method nil t)
 '(linum-format " %5i ")
 '(magit-git-executable "git")
 '(markdown-fontify-code-blocks-natively t)
 '(markdown-hr-string "****************************************************")
 '(markdown-max-image-size (quote (600 . 400)))
 '(menu-bar-mode nil)
 '(org-agenda-custom-commands
   (quote
    (("o" "Agenda and all TODO's work*.org"
      ((agenda ""
               ((org-agenda-files
                 (quote
                  ("~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/sandbox.org")))))
       (alltodo ""
                ((org-agenda-files
                  (quote
                   ("~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/sandbox.org")))))))
     ("l" "Agenda life*.org"
      ((agenda ""
               ((org-agenda-files
                 (quote
                  ("~/Dropbox/geekbook/notes/life-curr.org" "~/Dropbox/geekbook/notes/sandbox.org")))))))
     (";" "Agenda and all TODO's life*.org"
      ((agenda ""
               ((org-agenda-files
                 (quote
                  ("~/Dropbox/geekbook/notes/life-curr.org" "~/Dropbox/geekbook/notes/sandbox.org")))))
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
                  ("~/Dropbox/geekbook/notes/work-someday.org" "~/Dropbox/geekbook/notes/work-extra.org" "~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/work-archive.org" "~/Dropbox/geekbook/notes/sandbox.org")))))))
     ("n" "Agenda and all TODO's"
      ((agenda "" nil)
       (alltodo "" nil))
      nil))))
 '(org-agenda-files
   (quote
    (
     "~/iCloud/geekbook/notes/sandbox.org"
     "~/iCloud/geekbook/notes/life-curr.org"
     "~/iCloud/geekbook/notes/work-curr.org"
     "~/iCloud/geekbook/notes/work-someday.org"
     "~/iCloud/geekbook/notes/work-extra.org"
     "~/iCloud/geekbook/notes/work-archive.org"
     )))
 '(org-agenda-span (quote day))
 '(org-indent-indentation-per-level 5)
 '(org-indent-mode-turns-on-hiding-stars f)
 '(package-selected-packages
   (quote
    (markdown-preview-mode markdown-mode paredit org-autolist load-theme-buffer-local flycheck-inline org-download monokai-alt-theme sublime-themes realgud python-docstring flyspell-correct-popup flyspell-lazy dic-lookup-w3m build-status flycheck-color-mode-line flymd flycheck-pyflakes django-mode web-narrow-mode web-mode jedi github-theme color-theme-buffer-local uimage csv-mode w3m org-gcal darkroom google-this langtool org-random-todo emojify el-pocket blank-mode ido-vertical-mode ox-gfm auto-org-md sphinx-mode sphinx-frontend sphinx-doc auto-complete-rst ac-helm python ipython outline-magic writeroom-mode wanderlust tidy synonyms stem skype python-pylint python-pep8 python-mode projectile powerline multi-term markdown-mode+ magit-tramp jabber hipster-theme helm-ispell helm google-translate git-rebase-mode git-commit-mode focus flyspell-popup flymake-python-pyflakes flymake flycheck fiplr exec-path-from-shell ess-smart-underscore ess-R-object-popup eimp ecb dictionary color-theme cl-generic calfw-gcal calfw auto-yasnippet auto-dictionary ac-slime ac-python ac-php-core ac-ispell ac-R)))
 '(pdf-view-midnight-colors (quote ("#969896" . "#f8eec7")) t)
 '(py-keep-windows-configuration t t)
 '(send-mail-function nil)
 '(show-paren-mode t)
 '(synonyms-cache-file
   "/Users/magnus/Dropbox/workspace/emacs-env/dot-emacs.d/synonimous/mthesaur.txt.cache")
 '(synonyms-file
   "/Users/magnus/Dropbox/workspace/emacs-env/dot-emacs.d/synonimous/mthesaur.txt")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B" t)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#d01A4E")
     (60 . "#cb4b16")
     (80 . "#b58900")
     (100 . "#b58900")
     (120 . "#b58900")
     (140 . "#7E7D7E")
     (160 . "#7E7D7E")
     (180 . "#9FAA9B")
     (200 . "#9FC59F")
     (220 . "#859900")
     (240 . "#31be67")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#268bd2")
     (320 . "#268bd2")
     (340 . "#00a74e")
     (360 . "#d33682"))) t)
 '(vc-annotate-very-old-color "#d33682" t))


;; https://www.emacswiki.org/emacs/AutoSave
;; Save all tempfiles in $TMPDIR/emacs$UID/
    (defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
    (setq backup-directory-alist
        `((".*" . ,emacs-tmp-dir)))
    (setq auto-save-file-name-transforms
        `((".*" ,emacs-tmp-dir t)))
    (setq auto-save-list-file-prefix
          emacs-tmp-dir)

(message "Emacs temp:")
(message emacs-tmp-dir)


;; org-mode to markdown
(require 'ox-md)


;; OrgMode download
(require 'org-download)
(setq-default org-download-image-dir "/Users/magnus/Dropbox/geekbook/notes/imgs/")


;; images in emacs
;(define-key markdown-mode-map (kbd "C-c R") 'markdown-display-inline-images)

(add-to-list 'load-path "~/Dropbox/geekbook/notes-debugger/")
(require 'markdown-notes-style-checker)


(load-file "~/.emacs.d/plugins/emacs-grammarly/emacs-grammarly.el")
(global-set-key (kbd "C-c C-g") 'grammarly-save-region-and-run)

;;
(load-file "~/.emacs.d/plugins/emacs-toggl/emacs-toggl.el")

;; markdown: drag and drop; but not always this is what I want
(defun dnd ()
  "Turn on markdown-dnd-images, and turn on on demand.

  It's not perfect when it's on because
  I can't move files to the cluster and virtual machines"
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/plugins/markdown-dnd-images")
  (require 'markdown-dnd-images)
  (add-hook 'markdown-mode-hook 'flyspell-mode)
)

; i tired to revert back overwrite functon, but I can;t
;(load-file "/Applications/Emacs.app/Contents/Resources/lisp/term/ns-win.elc")

;; autolist
(add-hook 'org-mode-hook (lambda () (org-autolist-mode)))

(provide 'dot-emacs)
;;; dot-emacs.el ends here


(defun owb (n)
  "Select Nth previous windows."
  (interactive "P\nbFrobnicate buffer: ")
  (other-window (- n)))


(set-face-attribute 'default nil :font "Monaco 12")
 (custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))


;(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;(add-hook 'lisp-mode-hook             'enable-paredit-mode)
;(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;(add-hook 'scheme-mode-hook           #'enable-paredit-mode)


(defun pl ()
  (interactive)
  (ispell-change-dictionary "pl")
)

(defun en ()
  (interactive)
  (ispell-change-dictionary "en_US")
)


;; jupyter
(global-set-key (kbd "C-c C-j") 'ein:notebooklist-open)


(defun print-to-pdf ()
 (interactive)
 (ps-spool-buffer-with-faces)
 (switch-to-buffer "*PostScript*")
 (write-file "tmp.ps")
 (kill-buffer "tmp.ps")
 (setq cmd (concat "ps2pdf14 tmp.ps " (buffer-name) ".pdf"))
 (shell-command cmd)
 (shell-command "rm tmp.ps")
 (message (concat "File printed in : "(buffer-name) ".pdf"))
 )

(load-file "~/.emacs.d/plugins/calendar-add-events/calendar-add-events.el")


(setq remember-data-file "~/Dropbox/geekbook/notes/sandbox.org")
(set-cursor-color "#8b8989")

;; Mac stuff
;; unset alt
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
(setq ns-right-alternate-modifier nil)


(defun geekbook-open-page ()
 (interactive)
 (message (buffer-name))
 (setq cmd  (concat "open http://127.0.0.1:5000/view/" (replace-in-string ".md" ".html" (buffer-name))))
 (shell-command cmd)
 (message cmd)
 )
(global-set-key (kbd "C-c o") 'geekbook-open-page)

(setq locate-command "mdfind")


;; https://www.masteringemacs.org/article/introduction-to-ido-mode
;(setq ido-enable-flex-matching t)
;(setq ido-everywhere t)
;(ido-mode 1)


