;;; dot-emacs.el --- Magnus Env
;;; Commentary:
;;;  https://github.com/mmagnus/emacs-env
;;; Code:

;; https://www.emacswiki.org/emacs/AlarmBell
(setq ring-bell-function 'ignore)

(global-set-key "\C-cR" 'rename-buffer)
(global-set-key "\C-cl" 'locate)
(global-set-key "\C-cq" 'grep)
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; Emacs lips mode <http://ergoemacs.org/emacs/reclaim_keybindings.html>
(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-c r") 'eval-region)

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


;; let make happy all emacs clients
(server-start)
(setq inhibit-startup-message t)

;; my dirty hack to get -i in grep
(load-file "~/.emacs.d/plugins/grep.el")

;; recompile shorthut
(global-set-key "\C-cc" 'recompile)

(desktop-save-mode 1)

; off opening html
; (setq dnd-protocol-alist nil)
; https://emacs.stackexchange.com/questions/54453/dont-open-a-html-link-if-drag-and-dropped-to-emacs
(setq dnd-protocol-alist '(("^file:///" . dnd-open-local-file)
 ("^file://" . dnd-open-file)
 ("^file:" . dnd-open-local-file)))

;; Markdown
;; https://github.com/jrblevin/markdown-mode/issues/147
(require 'markdown-mode)
(define-key markdown-mode-map (kbd "s-<up>") 'markdown-move-subtree-up)
(define-key markdown-mode-map (kbd "s-<down>") 'markdown-move-subtree-down)
(define-key markdown-mode-map (kbd "s-<left>") 'markdown-promote-subtree)
(define-key markdown-mode-map (kbd "s-<right>") 'markdown-demote-subtree)

(require 'markdown-mode)
(define-key markdown-mode-map (kbd "M-<up>") 'markdown-move-up)
(define-key markdown-mode-map (kbd "M-<down>") 'markdown-move-down)
(define-key markdown-mode-map (kbd "M-<left>") 'markdown-promote)
(define-key markdown-mode-map (kbd "M-<right>") 'markdown-demote)

;; OrgMode https://stackoverflow.com/questions/11670654/how-to-resize-images-in-org-mode
(setq org-image-actual-width nil)

;; for evoclust mapping in python mode to see comments more clearly
(add-to-list 'auto-mode-alist '("ref\\.txt\\'" . python-mode))
(add-to-list 'auto-mode-alist '(".recipe" . python-mode))

;;
(set-cursor-color "#8b8989")

;; used mostly for my geekbook, reload a file if modified
;; auto revert http://stackoverflow.com/questions/1480572/how-to-have-emacs-auto-refresh-all-buffers-when-files-have-changed-on-disk
(global-auto-revert-mode t)


;; projectile
(require 'projectile)
(projectile-mode)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; #orgmode
(load "~/.emacs.d/my-orgmode.el")

;; @plugins
(load "~/.emacs.d/my-plugins.el")

;; @writing
;(load "~/.emacs.d/my-writing.el")

;; @writing
(load "~/.emacs.d/my-theme.el")

;; @writing
(load "~/.emacs.d/my-web-dev.el")

;; #geekbook
(load "~/.emacs.d/my-geekbook.el")

;; @writing
(load "~/.emacs.d/my-python.el")

;; @markdown
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (put 'narrow-to-region 'disabled nil)
  ;; duplicate line C-c C-d
  (global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;; markdown-asymmetric-header - set to a non-nil value to use asymmetric header styling, placing header characters only on the left of headers (default: nil). https://jblevins.org/projects/markdown-mode/!
(setq markdown-asymmetric-header t)

;; SETTINGS -----------------------------------------------------------------
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-code-face ((t (:inherit Green :background "Black")))))

; '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 110 :width normal)))))



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
 '(ac-ispell-fuzzy-limit 3)
 '(ac-ispell-requires 4)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(bmkp-last-as-first-bookmark-file "/Users/magnus/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(csv-separators (quote (",")))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "5057614f7e14de98bbc02200e2fe827ad897696bfd222d1bcab42ad8ff313e20" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "9a2dcb3d7c42d508d5bb78eef98c8e9a71ec4ef8bd88a6677e3c237c73fa20eb" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" default)))
 '(display-battery-mode nil)
 '(display-time-mode nil)
 '(exec-path-from-shell-check-startup-files nil)
 '(indicate-empty-lines t)
 '(jedi:tooltip-method nil)
 '(linum-format " %5i ")
 '(magit-git-executable "git")
 '(markdown-fontify-code-blocks-natively t)
 '(markdown-hr-string "****************************************************")
 '(markdown-max-image-size (quote (800 . 600)))
 '(menu-bar-mode t)
 '(org-agenda-custom-commands
   (quote
    (("o" "work*.org Agenda and all TODO's"
      ((agenda ""
               ((org-agenda-files
                 (quote
                  ("~/iCloud/geekbook/notes/work-curr.org" "~/iCloud/geekbook/notes/inbox.org")))))))
     ("O" "work*.org Agenda and all TODO's "
      ((agenda ""
               ((org-agenda-files
                 (quote
                  ("~/iCloud/geekbook/notes/work-curr.org" "~/iCloud/geekbook/notes/inbox.org")))))
       (alltodo ""
                ((org-agenda-files
                  (quote
                   ("~/iCloud/geekbook/notes/work-curr.org" "~/iCloud/geekbook/notes/inbox.org")))))))
     ("j" "curr*.org A"
      ((agenda ""
               ((org-agenda-files
                 (quote
                  ("~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/work-curr.org" "~/iCloud/geekbook/notes/orgmode/skills-curr.org")))))))
     (":" "life*.org A+T"
      ((agenda ""
               ((org-agenda-files
                 (quote
                  ("~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/inbox.org")))))
       (alltodo ""
                ((org-agenda-files
                  (quote
                   ("~/iCloud/geekbook/notes/life-archive.org" "~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/orgmode/life-today.org")))))))
     (";" "life*.org Agenda only"
      ((agenda ""
               ((org-agenda-files
                 (quote
                  ("~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/inbox.org")))))))
     ("k" "s[k]ills Agenda and all TODO's "
      ((agenda ""
               ((org-agenda-files
                 (quote
                  ("~/iCloud/geekbook/notes/skills-curr.org")))))
       (alltodo ""
                ((org-agenda-files
                  (quote
                   ("~/iCloud/geekbook/notes/skills-curr.org")))))))
     ("n" "TODO's Agenda and all"
      ((agenda "" nil)
       (alltodo "" nil))
      nil))))
 '(org-agenda-files
   (quote
    ("~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/inbox.org" "~/iCloud/geekbook/notes/work-curr.org")))
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-span (quote day))
 '(org-capture-templates
   (quote
    (("t" "Todo Life" entry
      (file+headline "~/iCloud/geekbook/notes/life-curr.org" "#inbox")
      "* %?
  %i
  %a")
     ("x" "Test" entry
      (file+headline "~/iCloud/geekbook/notes/life-curr.org" "#inbox")
      "** TODO %^{Description} [why] %^{why} [why not] %^{why not}
  %?
  :LOGBOOK:
  - Added: %U
  :END:
  %a
")
     ("w" "Todo Work" entry
      (file+headline "~/iCloud/geekbook/notes/work-curr.org" "#inbox")
      "* TODO %?
  %i
  %a"))) t)
 '(org-clock-mode-line-total (quote current))
 '(org-indent-indentation-per-level 5)
 '(org-indent-mode-turns-on-hiding-stars f)
 '(package-selected-packages
   (quote
    (smart-mode-line-atom-one-dark-theme smart-mark org-timeline tj3-mode cyphejor olivetti modeline-posn github-notifier company ## visual-regexp zen-mode darkroom guess-language ein yaml-mode docker-tramp dockerfile-mode ac-anaconda markdown-preview-mode markdown-mode paredit org-autolist load-theme-buffer-local flycheck-inline org-download monokai-alt-theme sublime-themes python-docstring flyspell-correct-popup flyspell-lazy dic-lookup-w3m build-status flycheck-color-mode-line flymd flycheck-pyflakes django-mode web-narrow-mode jedi github-theme color-theme-buffer-local uimage csv-mode w3m org-gcal google-this langtool org-random-todo emojify el-pocket blank-mode ido-vertical-mode ox-gfm auto-org-md sphinx-mode sphinx-frontend sphinx-doc auto-complete-rst ac-helm python ipython outline-magic writeroom-mode tidy synonyms stem skype python-pylint python-pep8 python-mode projectile multi-term markdown-mode+ magit-tramp jabber hipster-theme helm-ispell helm google-translate git-rebase-mode git-commit-mode focus flymake-python-pyflakes flymake flycheck fiplr exec-path-from-shell ess-smart-underscore ess-R-object-popup eimp ecb dictionary color-theme cl-generic calfw-gcal calfw auto-yasnippet auto-dictionary ac-slime ac-python ac-php-core ac-ispell ac-R)))
 '(pdf-view-midnight-colors (quote ("#969896" . "#f8eec7")) t)
 '(py-keep-windows-configuration t)
 '(safe-local-variable-values (quote ((ispell-dictionary . "polish"))))
 '(send-mail-function nil)
 '(show-paren-mode t)
 '(synonyms-cache-file
   "/Users/magnus/iCloud/workspace/emacs-env/dot-emacs.d/synonimous/mthesaur.txt.cache")
 '(synonyms-file
   "/Users/magnus/iCloud/workspace/emacs-env/dot-emacs.d/synonimous/mthesaur.txt")
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

;; keybinding for magit status (https://github.com/AndreaCrotti/minimal-emacs-configuration/blob/master/init.el)
;; magit
(require 'magit)
(global-set-key "\C-cg" 'magit-status)

;; 
(load "~/.emacs.d/org-mode-clock-bar.el")
(add-hook 'org-clock-in-hook (lambda () (orgmode-clocking-in))) ;;))
;                                     (call-process "/usr/bin/osascript" nil 0 nil "-e" (concat "tell application \"org-clock-statusbar\" to clock in \"" (replace-regexp-in-string "\"" "\\\\\"" org-clock-current-task) "\""))))

(add-hook 'org-clock-out-hook (lambda () (orgmode-clocking-out)))
;(call-process "/usr/bin/osascript" nil 0 nil "-e" "tell application \"org-clock-statusbar\" to clock out")))
;;; dot-emacs.el ends here
