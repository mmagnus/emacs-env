;;; Shut up compile saves
(setq compilation-ask-about-save nil)
(setq compile-command "chmod +x test.sh && ./test.sh")
;; recompile shorthut
(global-set-key "\C-cc" 'recompile)
(global-set-key "\C-ce" 'compile)

;(add-to-list 'compilation-error-regexp-alist '("^\\(.*?\\):\\([0-9]+\\) " 1 2))
(require 'compile)
(add-to-list 'compilation-error-regexp-alist-alist
'(tasking . ("^\\(.*?\\):\\([0-9]+\\) " ; REGEXP
1 ; FILE
2 ; LINE
)))
(add-to-list 'compilation-error-regexp-alist 'tasking)
;(setq compilation-scroll-output 'first-error)
(setq compilation-always-kill t)
(print compilation-error-regexp-alist)

(provide 'compilex)
;(require 'compilation-mode)
(add-to-list 'auto-mode-alist '("\\.compile\\'" . compilation-mode))

(fancy-compilation-mode) ; Activate for future compilation.

;;https://endlessparentheses.com/provide-input-to-the-compilation-buffer.html
(require 'cl-lib)
(defun endless/toggle-comint-compilation ()
  "Restart compilation with (or without) `comint-mode'."
  (interactive)
  (cl-callf (lambda (mode) (if (eq mode t) nil t))
      (elt compilation-arguments 1))
  (recompile))

(define-key compilation-mode-map (kbd "C-c i")
  #'endless/toggle-comint-compilation)
(define-key compilation-minor-mode-map (kbd "C-c i")
  #'endless/toggle-comint-compilation)
(define-key compilation-shell-minor-mode-map (kbd "C-c i")
  #'endless/toggle-comint-compilation)
