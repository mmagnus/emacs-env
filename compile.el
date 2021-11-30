;;; Shut up compile saves
(setq compilation-ask-about-save nil)
(setq compile-command "chmod +x test.sh && ./test.sh")
;; recompile shorthut
(global-set-key "\C-cc" 'recompile)
(global-set-key "\C-ce" 'compile)
