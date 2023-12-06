;;; Shut up compile saves
(setq compilation-ask-about-save nil)
(setq compile-command "chmod +x test.sh && ./test.sh")

(defun c-w-c ()
  (interactive)
  (setq current-prefix-arg '(4))
  (call-interactively 'recompile))

(defun toggle-comint-compilation ()
  "Restart compilation with (or without) `comint-mode'."
  (interactive)
  (cl-callf (lambda (mode) (if (eq mode t) nil t))
      (elt compilation-arguments 1))
  (recompile))

(add-hook 'compile-mode-hook 'toggle-comint-compilation)


;#(global-set-key (kbd "C-x c") 'c-w-c)
(global-set-key "\C-cc" 'recompile);toggle-comint-compilation);;brecompile)
(global-set-key "\C-ce" 'compile)

;(add-to-list 'compilation-error-regexp-alist '("^\\(.*?\\):\\([0-9]+\\) " 1 2))
(require 'compile)
(add-to-list 'compilation-error-regexp-alist-alist
'(tasking . ("^\\(.*?\\):\\([0-9]+\\) " ; REGEXP
1 ; FILE
2 ; LINE
)))

;;https://emacs.stackexchange.com/questions/19465/m-x-compile-always-runs-the-same-command
(setq compilation-read-command t)

(add-to-list 'compilation-error-regexp-alist 'tasking)
;(setq compilation-scroll-output 'first-error)
(setq compilation-always-kill t)
(print compilation-error-regexp-alist)


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

;https://endlessparentheses.com/provide-input-to-the-compilation-buffer.html



;https://github.com/abo-abo/helm-make					;
;(setq helm-make-comint t)

(message "reload compile")


					;https://stackoverflow.com/questions/3610114/how-can-i-bind-compile-using-comint-to-a-key-combination
(define-key comint-mode-map (kbd "C-c f")
  (lambda (command)
    (interactive
     (list
      (let ((command (eval compile-command)))
        (if (or compilation-read-command current-prefix-arg)
            (compilation-read-command command)
          command))))
    (compile command t)))
