;; Markdown
;; https://github.com/jrblevin/markdown-mode/issues/147
;; @markdown
(require 'markdown-mode)

  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (put 'narrow-to-region 'disabled nil)
  ;; duplicate line C-c C-d
  (global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")



(define-key markdown-mode-map (kbd "s-<up>") 'markdown-move-subtree-up)
(define-key markdown-mode-map (kbd "s-<down>") 'markdown-move-subtree-down)
(define-key markdown-mode-map (kbd "s-<left>") 'markdown-promote-subtree)
(define-key markdown-mode-map (kbd "s-<right>") 'markdown-demote-subtree)

(require 'markdown-mode)
(define-key markdown-mode-map (kbd "M-<up>") 'markdown-move-up)
(define-key markdown-mode-map (kbd "M-<down>") 'markdown-move-down)
(define-key markdown-mode-map (kbd "M-<left>") 'markdown-promote)
(define-key markdown-mode-map (kbd "M-<right>") 'markdown-demote)

;; markdown-asymmetric-header - set to a non-nil value to use asymmetric header styling, placing header characters only on the left of headers (default: nil). https://jblevins.org/projects/markdown-mode/!
(setq markdown-asymmetric-header t)
