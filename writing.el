;; this is on functions of writing

(setq ac-auto-show-menu 0.8)
(setq ac-cadidate-limit 10)

;; visual mode ;; works! https://www.emacswiki.org/emacs/VisualLineMode
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'org-mode 'turn-on-visual-line-mode)


(require 'langtool)
(setq langtool-java-bin "/usr/bin/java")
(setq langtool-language-tool-jar "/Users/magnus/opt/languagetool/LanguageTool-3.7/languagetool-commandline.jar")
(setq langtool-default-language "en-US")

(global-set-key "\C-c4w" 'langtool-check)
(global-set-key "\C-c4W" 'langtool-check-done)
(global-set-key "\C-c4l" 'langtool-switch-default-language)
(global-set-key "\C-c44" 'langtool-show-message-at-point)
(global-set-key "\C-c4c" 'langtool-correct-buffer)

(defun langtool-autoshow-detail-popup (overlays)
  (when (require 'popup nil t)
    ;; Do not interrupt current popup
    (unless (or popup-instances
                ;; suppress popup after type `C-g` .
                (memq last-command '(keyboard-quit)))
      (let ((msg (langtool-details-error-message overlays)))
        (popup-tip msg)))))

(setq langtool-autoshow-message-function
      'langtool-autoshow-detail-popup)


;; @ENGLISH/SPELLING/@WRITING -----------------------------------------------
;(:name textlint
;    :type git
;    :url "git://github.com/DamienCassou/textlint.git"
;    :website "http://scg.unibe.ch/research/textlint"
;    :description "Allows the integration of TextLint within Emacs"
;    :load "textlint.el")

;(global-set-key (kbd "<f7>") 'dic-lookup-w3m--collocation-weblio-word)
;(global-set-key (kbd "<f8>") 'synonyms-match-more)
;(global-set-key (kbd "<f6>") 'lookup-word-definition)

;; https://github.com/xuchunyang/flyspell-popup
(define-key flyspell-mode-map (kbd "C-;") #'flyspell-popup-correct)
(add-hook 'flyspell-mode-hook #'flyspell-popup-auto-correct-mode)

;; https://github.com/syohex/emacs-ac-ispell
;; Completion words longer than 4 characters
(eval-after-load "auto-complete"
  '(progn
     (ac-ispell-setup)))

;(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
;(add-hook 'text-mode-hook 'ac-ispell-ac-setup)
;(add-hook 'org-mode-hook 'ac-ispell-ac-setup)
;(add-hook 'markdown-mode-hook 'ac-ispell-ac-setup)

;; my darkmode
;(setq darkroom-text-scale-increase 0)
(setq scroll-margin 10)
(setq frame-border-width 10)
(setq set-window-margins 10)


(defun dark()
  (interactive)
  (font-lock-mode)
  (setq-default left-margin-width 60 right-margin-width 60) ; Define new widths.
  (set-face-attribute 'fringe nil :background "#000" :foreground "#2E2920")
  (set-window-buffer nil (current-buffer)) ; Use them now.
  )

(defun undark()
  (interactive)
  (font-lock-mode)
	    (setq-default left-margin-width 1 right-margin-width 1) ; Define new widths.
	    (set-face-attribute 'fringe nil :background "#000" :foreground "#2E2920")
	    (set-window-buffer nil (current-buffer)) ; Use them now.
	    )

(global-set-key "\C-cD" 'dark)
(global-set-key "\C-cU" 'undark)
(global-set-key "\C-cN" 'narrow-to-region)
(global-set-key "\C-cW" 'writeroom-mode)

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


(set-face-attribute 'default nil :font "Monaco 17") ;; :foreground "#00FF00")
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
;  (require 'flycheck-grammarly)
  (flycheck-pos-tip-mode)
  (ispell-change-dictionary "en_US")
)

;; speed up emacs
(use-package auto-complete
	     :ensure t
	     :demand
	     :config
	     (ac-config-default)
	     (ac-flyspell-workaround)
	     (use-package fuzzy
			  :config
			  (setq ac-fuzzy-enable 1)
			  )
	     )



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

;; flyspell
(add-hook 'org-mode-hook 'flyspell-mode)
;(add-hook 'markdown-mode-hook 'flyspell-mode) ;; flyspell off for now
;(add-hook 'python-mode-hook 'flyspell-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode) ;; https://stackoverflow.com/questions/2455062/how-to-spell-check-python-docstring-with-emacs


;; ispell
(global-set-key "\C-ci" 'ispell)
(global-set-key (kbd "<f5>") 'org-capture)



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

