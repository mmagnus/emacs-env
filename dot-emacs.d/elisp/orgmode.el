;; https://stackoverflow.com/questions/61684949/time-formatting-for-org-clocktable-report
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


(setq org-duration-format 'h:mm)
(setq org-agenda-start-on-weekday 1)
;;
(setq org-todo-keywords (quote ((sequence "TODO" "INPROGRESS" "WAITING" "HIGHLIGHT" "CANCELLED" "DONE"))))
(setq org-todo-keyword-faces
      '(
        ("TODO" . org-warning)
  	("INPROGRESS" . (:foreground "orange"))
  	("WAITING" . "violet")
  	("HIGHLIGHT" . (:foreground "black" :background "yellow"))
  	("CANCELLED" . (:foreground "gray" :background "black"))
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

;;
(setq geekbook_path "/Users/magnus/geekbook/")
(setq org-directory (concat geekbook_path "notes"))
;(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;(setq org-mobile-directory "~/Library/Mobile Documents/iCloud~com~mobileorg~mobileorg/Documents")
;(setq org-mobile-files '( "~/geekbook/notes/work-curr.org" "~/geekbook/notes/inbox.org" "~/geekbook/notes/life-curr.org"  "~/geekbook/notes/skills-curr.org"))
;; "~/iCloud/geekbook/notes/inbox.org"
;(setq org-mobile-inbox-for-pull "~/geekbook/notes/inbox.org")
(put 'upcase-region 'disabled nil)

;(org-mobile-pull)
; org-mobile update
;(add-hook 'after-init-hook 'org-mobile-pull)
;(add-hook 'after-init-hook 'org-mobile-push)
;(add-hook 'kill-emacs-hook 'org-mobile-push)
;(add-hook 'kill-emacs-hook 'org-mobile-pull)
;(define-key global-map "\C-cI" 'org-mobile-pull)
;(define-key global-map "\C-cU" 'org-mobile-push)


(defun pull-inbox () (interactive)
       (find-file-other-window "~/geekbook/notes/inbox.org")
       (end-of-buffer)
       (org-mobile-pull)
       (org-mobile-push)
       )

;(define-key global-map "\C-cI" 'pull-inbox)
;(global-set-key (kbd "C-c o i") 'pull-inbox)
(setq remember-data-file "/Users/magnus/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/orgmode/inbox.org")
(global-set-key (kbd "C-c o i") 'org-capture) ;#remember)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(defun open-inbox () (interactive)
       (find-file-other-window "/Users/magnus/geekbook/notes/inbox.org")
       )
(global-set-key (kbd "C-c o I") 'open-inbox)

(defun work-open () (interactive)
       (find-file-other-window "/Users/magnus/geekbook/notes/work-curr.org")
       )
(global-set-key (kbd "C-c o w") 'work-open)

(defun today-open () (interactive)
       (find-file-other-window "/Users/magnus/geekbook/notes/week.md")
       )
(global-set-key (kbd "C-c o t") 'today-open)

(defun life-open () (interactive)
       (find-file-other-window "/Users/magnus/geekbook/notes/life-curr.org")
       )
(global-set-key (kbd "C-c o l") 'life-open)
