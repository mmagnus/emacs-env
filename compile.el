;;; Shut up compile saves
(setq compilation-ask-about-save nil)
(setq compile-command "./test.sh")
;; recompile shorthut
(global-set-key "\C-cc" 'recompile)
