;; My plugnins ----------------------------------------------------------

(defun insert-current-date-orgmode () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (insert (shell-command-to-string "echo -n '<'`date '+%Y-%m-%d %a'`'>'"))) ;; echo -n $(date +%y%m%d)
(global-set-key (kbd "C-c ,") 'insert-current-date-orgmode)


(defun git-notes () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (insert (shell-command-to-string "cd /Users/magnus/iCloud/geekbook/notes && git gui &"))) ;; echo -n $(date +%y%m%d)
(global-set-key (kbd "C-c o g") 'git-notes)


(defun update-to-calendar () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (shell-command-to-string "up"))  ;; echo -n $(date +%y%m%d)
(global-set-key (kbd "C-c o u") 'update-to-calendar)


(defun pull-inbox () (interactive)
       (find-file-other-window "/Users/magnus/iCloud/geekbook/notes/inbox.org")
       (end-of-buffer)
       (org-mobile-pull)
       (org-mobile-push)
       )

;(define-key global-map "\C-cI" 'pull-inbox)
(global-set-key (kbd "C-c o i") 'pull-inbox)

(defun work-open () (interactive)
       (find-file-other-window "/Users/magnus/iCloud/geekbook/notes/work-curr.org")
       )
(global-set-key (kbd "C-c o w") 'work-open)

(defun today-open () (interactive)
       (find-file-other-window "/Users/magnus/iCloud/geekbook/notes/week.md")
       )
(global-set-key (kbd "C-c o t") 'today-open)

(defun life-open () (interactive)
       (find-file-other-window "/Users/magnus/iCloud/geekbook/notes/life-curr.org")
       )
(global-set-key (kbd "C-c o l") 'life-open)


;;; package --- Summary

;(echo org-clock-current-task)
;;org-mode

