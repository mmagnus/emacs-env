;; My plugins ----------------------------------------------------------
  ;; Insert curr date use with Geekbook
  ;; http://www.emacswiki.org/emacs/InsertingTodaysDate
  (defun insert-current-date () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (insert (shell-command-to-string "echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
  (global-set-key (kbd "C-c .") 'insert-current-date)

(defun pull-inbox () (interactive)
       (find-file-other-window "/home/magnus/Dropbox/geekbook/notes/sandbox.org")
       (org-mobile-pull)
       (org-mobile-push)
       )

(define-key global-map "\C-cI" 'pull-inbox)

;;; package --- Summary
