;; My plugnins ----------------------------------------------------------

(defun insert-current-date-orgmode () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (insert (shell-command-to-string "echo -n '<'`date '+%Y-%m-%d %a %H:%M'`'>'"))) ;; echo -n $(date +%y%m%d)

(defun insert-current-date-time () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (insert (shell-command-to-string "echo -n ''`date '+%y%m%d %a %H:%M'`''"))) ;; echo -n $(date +%y%m%d)

(global-set-key (kbd "C-c ,") 'insert-current-date-time)


(defun git-notes () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (insert (shell-command-to-string "cd /Users/magnus/iCloud/geekbook/notes && git gui &"))) ;; echo -n $(date +%y%m%d)
(global-set-key (kbd "C-c o g") 'git-notes)


(defun update-to-calendar () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (shell-command-to-string "up"))  ;; echo -n $(date +%y%m%d)
(global-set-key (kbd "C-c o u") 'update-to-calendar)

;;; package --- Summary

;(echo org-clock-current-task)
;;org-mode

