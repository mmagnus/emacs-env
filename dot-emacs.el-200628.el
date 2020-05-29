;; https://stackoverflow.com/questions/13242165/emacs-auto-complete-popup-menu-broken
(setq popup-use-optimized-column-computation nil)
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

(global-set-key "\C-xt" 'term)

;; https://github.com/realgud/realgud/wiki/ANSI-Terminal-Escape-appearing-in-Buffers
(setenv "TERM" "dumb")

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
;(add-hook 'markdown-mode-hook 'flyspell-mode) ;; flyspell off for now
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


;;https://www.emacswiki.org/emacs/DeletingWhitespace#toc3
;(add-hook 'python-mode-hook
;	    (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))


;; https://www.emacswiki.org/emacs/ShowWhiteSpace
(require 'blank-mode)




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



;; @csv
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)
(put 'downcase-region 'disabled nil)


;; @google-this-mode off because there is a problem with OrgMode Tab View
;(google-this-mode 1)
;(global-set-key (kbd "C-c g") 'google-this-mode-submap)
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
(setq-default org-download-image-dir "/Users/magnus/iCloud/geekbook/notes/imgs/")


;; images in emacs
;(define-key markdown-mode-map (kbd "C-c R") 'markdown-display-inline-images)

(add-to-list 'load-path "~/iCloud/geekbook/notes-debugger/")
(require 'markdown-notes-style-checker)


(load-file "~/.emacs.d/plugins/emacs-grammarly/emacs-grammarly.el")
;;(global-set-key (kbd "C-c C-g") 'grammarly-save-region-and-run)

;;
;; (load-file "~/.emacs.d/plugins/emacs-toggl/emacs-toggl.el")

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

(defun owb (n)
  "Select Nth previous windows."
  (interactive "P\nbFrobnicate buffer: ")
  (other-window (- n)))

;; ispell
(defun f12 ()
  (interactive)
  (set-face-attribute 'default nil :font "Monaco 12")
)
(defun fbig ()
  (interactive)
  ;(toggle-frame-fullscreen)
  (set-face-attribute 'default nil :font "Monaco 18")
  ;(writeroom-mode)
  ;(olivetti-mode)
  ;(darkroom-mode)
)

(defun fnormal ()
  (interactive)
  ;(writeroom-mode)
  ;(darkroom-mode)
  ;(toggle-frame-fullscreen)
  (set-face-attribute 'default nil :font "Monaco 13")
  ;(olivetti-mode)
  
)

(defun fsmall ()
  (interactive)
  (set-face-attribute 'default nil :font "Monaco 12")
)

(global-set-key "\C-c+" 'fbig)
(global-set-key "\C-c_" 'fnormal)
(global-set-key "\C-c)" 'fsmall)

;(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;(add-hook 'lisp-mode-hook             'enable-paredit-mode)
;(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;(add-hook 'scheme-mode-hook           #'enable-paredit-mode)


;; ispell
(defun pl ()
  (interactive)
  (flyspell-mode)
  (ispell-change-dictionary "pl")
)

;; en my own flycheck config english
(defun en ()
  (interactive)
  (flyspell-mode)
  (require 'flycheck-grammarly)
  (flycheck-pos-tip-mode)
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

(load-file "~/.emacs.d/plugins/zen-mode/zen-mode.el")
(require 'zen-mode)


(setq remember-data-file "~/iCloud/geekbook/notes/inbox.org")


(load "~/.emacs.d/org-mode-clock-bar.el")
(add-hook 'org-clock-in-hook (lambda () (orgmode-clocking-in))) ;;))
;                                     (call-process "/usr/bin/osascript" nil 0 nil "-e" (concat "tell application \"org-clock-statusbar\" to clock in \"" (replace-regexp-in-string "\"" "\\\\\"" org-clock-current-task) "\""))))

(add-hook 'org-clock-out-hook (lambda () (orgmode-clocking-out)))
;(call-process "/usr/bin/osascript" nil 0 nil "-e" "tell application \"org-clock-statusbar\" to clock out")))

;; Mac stuff
;; unset alt
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
(setq ns-right-alternate-modifier nil)


;;
(defun replace-in-string (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))


(setq locate-command "fx")

;;
;(require 'smooth-scrolling)
;(smooth-scrolling-mode 1)
;(setq smooth-scroll-margin 5)

;(add-to-list 'ispell-local-dictionary-alist
;     '("pl"
;        "[a-zA-Z]"
;        "[^a-zA-Z]"
;        "[']"
;        nil
;        ("-d" "pl,en_US")
;        nil
;        utf-8))


;(with-eval-after-load "ispell"
;  (setq ispell-program-name "hunspell")
;  (setq ispell-dictionary "pl")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  ;;(ispell-set-spellchecker-params)
  ;;(ispell-hunspell-add-multi-dic "pl"))
;; end

;; https://www.masteringemacs.org/article/introduction-to-ido-mode
;(setq ido-enable-flex-matching t)
;(setq ido-everywhere t)
;(ido-mode 1)



(setq darkroom-text-scale-increase 0)
(global-set-key "\C-cD" 'darkroom-mode)
(global-set-key "\C-cN" 'narrow-to-region)

(setq ns-pop-up-frames nil) ;; open a new file in the same frame
(setq mac-option-key-is-meta t)

;; my darkmode
(setq scroll-margin 6)
(setq frame-border-width 10)
(setq set-window-margins 10)

;(set-face-attributes 'header nil :background color)
;(setq header-line-format " ")
;(set-frame-parameter nil 'internal-border-width 10)

(defun mk-flyspell-correct-previous (&optional words)
  "Correct word before point, reach distant words.

WORDS words at maximum are traversed backward until misspelled
word is found.  If it's not found, give up.  If argument WORDS is
not specified, traverse 12 words by default.

Return T if misspelled word is found and NIL otherwise.  Never
move point."
  (interactive "P")
  (let* ((Δ (- (point-max) (point)))
         (counter (string-to-number (or words "12")))
         (result
          (catch 'result
            (while (>= counter 0)
              (when (cl-some #'flyspell-overlay-p
                             (overlays-at (point)))
                (flyspell-correct-word-before-point)
                (throw 'result t))
              (backward-word 1)
              (setq counter (1- counter))
              nil))))
    (goto-char (- (point-max) Δ))
    result))

;(setq header-line-format " ")
;(toggle-frame-fullscreen)

; Set cursor color to white
(set-cursor-color "#00ccff")


(require 'modeline-posn)
(size-indication-mode 1)

;; https://stackoverflow.com/questions/8095715/emacs-auto-complete-mode-at-startup
;(global-auto-complete-mode nil)
;(auto-complete-mode '(not markdown-mode))
;; remove auto-fill mode
(remove-hook 'markdown-mode-hook 'auto-complete-mode t)
;(auto-complete-mode)
(defadvice auto-complete-mode (around disable-auto-complete-for-python)
  (unless (eq major-mode 'markdown-mode) ad-do-it))
(ad-activate 'auto-complete-mode)
; https://stackoverflow.com/questions/24814988/emacs-disable-auto-complete-in-python-mode
;;

;(add-to-list 'load-path "~/.emacs.d/plugins/org-taskjuggler/elisp/")
;(require 'org-taskjuggler)

;(add-hook 'org-agenda-finalize-hook 'org-timeline-insert-timeline :append)

;;bio-seq
(add-to-list 'load-path "~/.emacs.d/plugins/bioseq-mode/")
(autoload 'bioseq-mode "bioseq-mode" "Major mode for biological sequences" t)
(add-to-list 'auto-mode-alist 
 	     '("\\.\\(fas\\|fasta\\|embs\\)\\'" . bioseq-mode))

;; https://stackoverflow.com/questions/15390178/emacs-and-symbolic-links
(setq vc-follow-symlinks t)

;; auto-load
;(find-file-other-window "~/workspace/emacs-env/dot-emacs.d/org-mode-clock-bar.el")
;(find-file-other-window "~/iCloud/geekbook/notes/life-curr.org")
;(org-clock-get-clock-string)
;(find-file-other-window "~/.emacs")

(smart-mode-line-enable)
;;(load "~/.emacs.d/org-mode-clock-bar.el")

;(setq org-clock-mode-line-total 'current)
;(message org-clock-mode-line-total)

;; https://emacs.stackexchange.com/questions/16545/make-names-of-major-modes-shorter-in-the-mode-line
(setq
 cyphejor-rules
 '(:upcase
   ("bookmark"    "→")
   ("buffer"      "β")
   ("diff"        "Δ")
   ("dired"       "δ")
   ("emacs"       "ε")
   ("fundamental" "Ⓕ")
   ("projectile"  "P" :prefix)
   ("inferior"    "i" :prefix)
   ("interaction" "i" :prefix)
   ("interactive" "i" :prefix)
   ("lisp"        "λ" :postfix)
   ("menu"        "▤" :postfix)
   ("mode"        "")
   ("package"     "↓")
   ("python"      "π")
   ("shell"       "sh" :postfix)
   ("text"        "ξ")
   ("FlyC"        "FC")
   ("eldoc"        "Doc" :prefix)
   ("Git:master"        "master")
   ("wdired"      "↯δ")))

(cyphejor-mode 1)

;; hide project name
;(diminish 'projectile-mode)

;;;;;;; https://www.masteringemacs.org/article/hiding-replacing-modeline-strings
(defvar mode-line-cleaner-alist
  `((auto-complete-mode . " α")
    (yas/minor-mode . " υ")
    (paredit-mode . " π")
    (eldoc-mode . "")
    (abbrev-mode . "")
    ;; Major modes
    (lisp-interaction-mode . "λ")
    (hi-lock-mode . "")
    (Projectile . "P")
    (emacs-lisp-mode . "EL")
    (nxhtml-mode . "nx"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")


(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                 (mode-str (cdr cleaner))
                 (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
                 (setcar old-mode-str mode-str))
               ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))


(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;;; alias the new `flymake-report-status-slim' to
;;; `flymake-report-status'
(defalias 'flymake-report-status 'flymake-report-status-slim)
(defun flymake-report-status-slim (e-w &optional status)
  "Show \"slim\" flymake status in mode line."
  (when e-w
    (setq flymake-mode-line-e-w e-w))
  (when status
    (setq flymake-mode-line-status status))
  (let* ((mode-line " Φ"))
    (when (> (length flymake-mode-line-e-w) 0)
      (setq mode-line (concat mode-line ":" flymake-mode-line-e-w)))
    (setq mode-line (concat mode-line flymake-mode-line-status))
    (setq flymake-mode-line mode-line)
    (force-mode-line-update)))


(require 'tramp)
(setq tramp-default-method "ssh")

;;; Shut up compile saves
(setq compilation-ask-about-save nil)

;(require 'grammarly)
;(add-hook 'markdown-mode-hook 'flyspell-grammarly)
;;;;;;;;;
