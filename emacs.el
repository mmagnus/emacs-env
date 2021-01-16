(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
(add-to-list 'auto-mode-alist '("\\.el\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.elbak\\'" . emacs-lisp-mode))

;; https://www.emacswiki.org/emacs/AutoSave
;; Save all tempfiles in $TMPDIR/emacs$UID/
    (defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
    (setq backup-directory-alist
        `((".*" . ,emacs-tmp-dir)))
    (setq auto-save-file-name-transforms
        `((".*" ,emacs-tmp-dir t)))
    (setq auto-save-list-file-prefix
          emacs-tmp-dir)
