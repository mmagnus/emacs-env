
;; # load-path
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/")

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;; from Bogus
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(setq inhibit-startup-message t)
(setq-default transient-mark-mode t)

;; # save desktop http://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html # siagle sie pyta kur***
;;(desktop-save-mode 1)


;; # color (set-face-background 'highlight "#FFF498")  ;; orange
(global-hl-line-mode t)


(setq mode-line-format
          (list
           ;; value of `mode-name'
           "%m: "
           ;; value of current buffer name
           "buffer %b, "
           ;; value of current line number
           "line %l "
           "-- user: "
           ;; value of user
           (getenv "USER")))


(setq frame-title-format
  '("emacs%@" (:eval (system-name)) ": " (:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b")) " [%*]"))


;; # let make happy all emacs clients
(server-start)


;; # linum
;;(require 'linum)
;;(global-linum-mode t)



;; # bookmark+ http://www.emacswiki.org/emacs/bookmark%2B-doc.el http://www.cs.cmu.edu/cgi-bin/info2www?%28emacs%29Bookmarks
(setq bookmark-save-flag 1)
(load "bookmark+.el")
(require 'bookmark+)


;; # frame-title-format
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
       '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;; # time
(display-time)


;; ralee mode is good for RNA alignment editing # http://personalpages.manchester.ac.uk/staff/sam.griffiths-jones/software/ralee/
(add-to-list 'load-path "~/.emacs.d/plugins/ralee-0.7/elisp")
(autoload 'ralee-mode "ralee-mode" "Yay! RNA things" t)
(setq auto-mode-alist (cons '("\\.stk$" . ralee-mode) auto-mode-alist))

(add-to-list 'load-path "~/.emacs.d/plugins/helm")
    (require 'helm-config)


;; # markdown-mode: automatically load it # work
(add-to-list 'load-path "~/.emacs.d/plugins/markdown/1.8.1")
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; # lisp-mode: automatically load it # work
(add-to-list 'auto-mode-alist '("\\dot-emacs\\'" . lisp-mode))

;; doc-view
(require 'doc-view)

;; unicode stuff
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; sql.el
(require 'sql)


;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
;; different way to change pymacs paths
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path "/home/magnus/Dropbox/lb_v2/pymacs-plugins"))

;;(setq pymacs-load-path '("/home/magnus/Dropbox/workspace/magnus-emacs-env/dot-emacs.d/pymacs-plugins"))

;; pymacs
;;(setenv "PYTHONPATH"
;;	(concat
;;	 "/home/magnus/Dropbox/workspace/magnus-emacs-env/dot-emacs.d/pymacs-plugins" ";"
;;	 )
;;	)
;;
(pymacs-load "manglers")
(pymacs-load "preview")
(pymacs-load "add-task")
(pymacs-load "insert")

;;org-mode
(setq load-path (cons "/home/magnus/.emacs.d/plugins/org-7.8.11/lisp" load-path))
(require 'org-install)

;; Set to the location of your Org files on your local system
(setq org-directory "/home/magnus/Dropbox/Sandbox/Org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "/home/magnus/Dropbox/INBOX-HTC.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "/home/magnus/Dropbox/MobileOrg")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(fringe-mode (quote (0)) nil (fringe))
 '(line-number-mode nil)
 '(markdown-hr-string "--------------------------------------------------------------------------------")
 '(org-indent-indentation-per-level 5)
 '(org-indent-mode-turns-on-hiding-stars t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(speedbar-default-position (quote left))
 '(speedbar-use-images t)
 '(sr-speedbar-right-side nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq org-todo-keywords (quote ((sequence "TODO" "IN_PROGRESS" "CANCELED" "DONE"))))
(setq org-todo-keyword-faces
           '(("TODO" . org-warning) ("IN_PROGRESS" . "yellow")
             ("CANCELED" . (:foreground "blue" :weight bold))))

;; org-mode installation for repo
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "/home/magnus/Dropbox/Sandbox/tutorials/tutorials/Emacs-org-mode/test.org" "/home/magnus/Dropbox/Sandbox/TODO.org"))


;; http://code.google.com/p/emacs-nav/
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-nav/emacs-nav-49/")
(require 'nav)
(global-set-key [f8] 'nav-toggle)


;; javascript http://joost.zeekat.nl/wp-content/javascript.el
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))


;;; thanks to http://www.emacswiki.org/emacs/AnsiColor
;;(add-hook ‘shell-mode-hook ‘ansi-color-for-comint-mode-on)

;;
;;(setq term-default-bg-color "#211E1E")
;;(setq term-default-fg-color "#AAAAAA")


;; # python el

;; http://stackoverflow.com/questions/268088/how-to-remove-the-prompt-for-killing-emacsclient-buffers
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)


;; @todo
;; (load "buff-menu+.el")
;; (require 'buff-menu+)


;;grepplus
(load "grep+.el")
(require 'grep+)


;; lista
(global-set-key (kbd "C-x C-b") 'buffer-menu)


;; pdb.el
(load-file "~/.emacs.d/plugins/pdb-mode.el")
(setq pdb-rasmol-name "/usr/bin/pymol")
(setq auto-mode-alist
     (cons (cons "pdb$" 'pdb-mode) 
            auto-mode-alist ) )
(autoload 'pdb-mode "PDB")


;;color-theme 
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-tty-dark)

;;ifind-mode
(defvar workspace-dir "~/Dropbox/")
(load "~/.emacs.d/plugins/ifind-mode.el")


;;ifind-mode
(load "~/.emacs.d/plugins/mmfinder-mode.el")


;;keybinding
(global-set-key (kbd "C-c i") 'insert-screenshotfromclipboard)
(global-set-key (kbd "C-c p") 'preview-preview)

;; set a font
(when window-system
(set-default-font "Monospace-10"))
;;(set-default-font "-misc-fixed-medium-r-normal--11-*-*-*-*-*-iso8859-1"))
;;(set-default-font "-misc-fixed-medium-r-normal--12-*-*-*-*-*-iso10646-1"))

(autoload 'iimage-mode "iimage" "SUpport Inline image minor mode." t)

;; google-translate
(require 'google-translate)

(global-set-key "\C-ct" 'google-translate-at-point)
;;(global-set-key (kbd "C-c r") 'google-translate-at-point-reverse)
;;(global-set-key "\C-c" 'google-translate-at-point-reverse)
;;(global-set-key "\C-cT" 'google-translate-query-translate)
;;(global-set-key (kbd "C-c R") 'google-translate-query-translate-reverse)
(setq google-translate-default-source-language "pl")
(setq google-translate-default-target-language "en")

;; ac-slime
;;(require 'ac-slime)
;;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;;(eval-after-load "auto-complete"
;;  '(add-to-list 'ac-modes 'slime-repl-mode))

(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(require 'ac-python)

;; --** PYTHON **-- ;;
(setq py-install-directory "~/.emacs.d/plugins/python-mode/6.1.1")
(add-to-list 'load-path py-install-directory)
(setq py-shell-name "python")
(setq py-shell-name "/usr/bin/python")
(setq py-force-py-shell-name-p t)
(require 'python-mode)

(setenv "PYTHONPATH" "/home/magnus/Dropbox/workspace/magnus-emacs-env/dot-emacs.d/pymacs-plugins/")

;; # general
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; # python-mode options
(setq
 py-python-command "ipython"
 py-indent-offset 4
 py-block-comment-prefix "##"
 py-temp-directory "/tmp"
 py-beep-if-tab-change t
 )

(add-to-list 'interpreter-mode-alist '("python" . python-mode))



;; # popup
(add-to-list 'load-path "/home/magnus/.emacs.d/plugins/popup-el")
(require 'popup)


;; # Initialize Rope                                                                                             
(setq ropemacs-global-prefix "C-c r") ;; fix https://groups.google.com/forum/?fromgroups#!topic/rope-dev/PgLNS02hcnM
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)


;; # auto-complete
(add-to-list 'load-path "/home/magnus/.emacs.d/plugins/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/magnus/.emacs.d/plugins/ac-dict")
(ac-config-default)

(setq ac-use-comphist nil)

;; # yasnippet https://github.com/capitaomorte/yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)


(require 'sr-speedbar)
;;(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
;;(sr-speedbar-mode 1)
;;(sr-set-global-key (kbd "<f1>") "F1" 'sr-speedbar-toggle "sr-speedbar-toggle")
(global-set-key [f9] 'sr-speedbar-toggle)

;; # highlight the import pdb text; anotate pdb http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
(defun annotate-pdb ()
  (interactive)
  (highlight-lines-matching-regexp "import pdb")
  (highlight-lines-matching-regexp "pdb.set_trace()"))
(add-hook 'python-mode-hook 'annotate-pdb)


;; # python-add-breakpoint http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
(defun python-add-breakpoint ()
  (interactive)
  (py-newline-and-indent)
  (insert "import ipdb; ipdb.set_trace()")
  (highlight-lines-matching-regexp "^[ 	]*import ipdb; ipdb.set_trace()")
  ;;(define-key py-mode-map (kbd "C-c C-b") 'python-add-breakpoint)
  )
  
;;  (defvar py-mode-map python-mode-map)
;;(setq py-mode-map python-mode-map)
;;(define-key python-mode-map "\t" 'python-add-breakpoint)
;;(global-define-key (kbd "C-c C-t") 'python-add-breakpoint)

;; autopair
;(require 'autopair)
;(autopair-global-mode) 

;; # fix for problem w pair mode http://lukeshu.ath.cx/1/wordpress/2011/08/fixing-wrong-type-argument-characterp-return-in-emacs/
;(add-hook 'term-mode-hook
;  #'(lambda () (setq autopair-dont-activate t)))


;; # magit
(autoload 'magit-status "magit" nil t)


;; # ipython is out of data # block it
;;(require 'ipython)

;; python-pylint
(require 'python-pylint)

;; python-pep8
(require 'python-pep8)


;; python-outline
(load-library "python-outline")
(setq auto-mode-alist (append '(
		("\\.texi" . texi-outline)
		("\\.py" . python-outline))
              auto-mode-alist))

;; django-html-mumamo-mode # works
;;(autoload 'django-html-mumamo-mode "~/.emacs.d/plugins/nxhtml/autostart.el")
;;(setq auto-mode-alist
;;      (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
;;(setq mumamo-background-colors nil) 
;;(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))


(add-to-list 'load-path "/home/magnus/.emacs.d/plugins/django-mode")
(require 'django-html-mode)
(require 'django-mode)
(yas/load-directory "~/.emacs.d/plugins/django-mode/snippets")
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

;; powerline
(require 'cl)
(require 'powerline)
;;(powerline-default)


(define-key global-map "\C-xg" 'goto-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   EMACS DISTRACTED EDITOR  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun toggle-minimal-mode (fs)
  (interactive "P")
  (defun fullscreen-margins nil
    (if (and (window-full-width-p) (not (minibufferp)))
	(set-window-margins nil (/ (- (frame-width) 120) 2) (/ (- (frame-width) 120) 2))
      (mapcar (lambda (window) (set-window-margins window nil nil)) (window-list))))

  (cond (menu-bar-mode
	 (menu-bar-mode -1) (tool-bar-mode -1) (scroll-bar-mode -1)
	 (set-frame-height nil (+ (frame-height) 4))
	 (if fs (progn (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
					      '(1 "_NET_WM_STATE_FULLSCREEN" 0))
		       (add-hook 'window-configuration-change-hook 'fullscreen-margins))))
	(t (menu-bar-mode 1) (tool-bar-mode 1) (scroll-bar-mode 1)
	   (when (frame-parameter nil 'fullscreen)
	     (remove-hook 'window-configuration-change-hook 'fullscreen-margins)
	     (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
				    '(0 "_NET_WM_STATE_FULLSCREEN" 0))
	     (set-window-buffer (selected-window) (current-buffer)))
	   (set-frame-width nil (assoc-default 'width default-frame-alist)))))

(global-set-key [f12] 'toggle-minimal-mode)


;; # fullscreen http://www.emacswiki.org/emacs/FullScreen#toc22
(defun toggle-fullscreen (&optional f)
      (interactive)
      (let ((current-value (frame-parameter nil 'fullscreen)))
           (set-frame-parameter nil 'fullscreen
                                (if (equal 'fullboth current-value)
                                    (if (boundp 'old-fullscreen) old-fullscreen nil)
                                    (progn (setq old-fullscreen current-value)
                                           'fullboth)))))

    (global-set-key [f11] 'toggle-fullscreen)

    ; Make new frames fullscreen by default. Note: this hook doesn't do
    ; anything to the initial frame if it's in your .emacs, since that file is
    ; read _after_ the initial frame is created.
    (add-hook 'after-make-frame-functions 'toggle-fullscreen)

;;;;;;;;; end ;;;;;;;;;;;;;;
;; https://github.com/ioreshnikov/.emacs.d/blob/master/modes/focus-mode.el
(require 'focus-mode)

(set-face-attribute 'default nil :font "Monaco 10")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
'(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 100 :width normal)))))

;; dark-room
(load-library "dark-room-mode")


;; jedi melpa
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
(put 'set-goal-column 'disabled nil)


;; flymake-python ;; from MELPA
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;;To use "flake8" instead of "pyflakes", add this line:
(setq flymake-python-pyflakes-executable "flake8")


;; # flymake-cursor
;; enhancements for displaying flymake errors http://www.emacswiki.org/emacs/FlymakeCursor
(require 'flymake-cursor)

