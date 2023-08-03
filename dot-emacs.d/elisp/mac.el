;; Mac stuff
;; unset alt
;(setq mac-option-key-is-meta t)

;(setq ns-right-alternate-modifier nil)
;; config for brew install emacs-mac 
 (global-set-key [(hyper a)] 'mark-whole-buffer)
 (global-set-key [(hyper v)] 'yank)
 (global-set-key [(hyper c)] 'kill-ring-save)
 (global-set-key [(hyper s)] 'save-buffer)
 (global-set-key [(hyper l)] 'goto-line)
 (global-set-key [(hyper w)]
                 (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)
(setq mac-right-option-modifier nil)

(setq ns-pop-up-frames nil) ;; open a new file in the same frame
(setq mac-option-key-is-meta t)

