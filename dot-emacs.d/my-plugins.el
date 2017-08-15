;; My plugins ----------------------------------------------------------
  ;; Insert curr date use with Geekbook
  ;; http://www.emacswiki.org/emacs/InsertingTodaysDate
  (defun insert-current-date () (interactive)
     (insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
  (global-set-key (kbd "C-c .") 'insert-current-date)
