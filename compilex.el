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
