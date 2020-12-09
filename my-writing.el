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
