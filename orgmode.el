;;
(setq org-todo-keywords (quote ((sequence "TODO" "INPROGRESS" "WAITING" "IDEA" "DONE"))))
(setq org-todo-keyword-faces
      '(
        ("TODO" . org-warning)
  	("INPROGRESS" . (:foreground "orange"))
  	("WAITING" . "violet")
  	("IDEA" . "blue")
        ("DONE" . org-done)
  	))

  ;(setq org-agenda-custom-commands
  ;      '(("w" "work" ;; (1) (2) (3) (4)
  ;         ((org-agenda-files '("/Users/magnus/iCloud/lb_v2/md/work-curr.org" "/Users/magnus/iCloud/lb_v2/md/work-extra.org")) ;; (5)
  ;          (org-agenda-sorting-strategy '(priority-up effort-down))) ;; (5) cont.
  ;         ) ;; (6)
  ;        ;; ...other commands here
  ;        )
  ;)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(lambda ()
   (interactive)
     (org-agenda-refile nil nil t))
