;(echo org-clock-current-task)
;;org-mode

(defvar orgmode-clocking-bar-tempfile "/Users/magnus/task.txt")
(defun orgmode-clocking-bar-save-tempfile ()
  "Save region to a tempfile and run Grammarly on it."
  (if org-clock-current-task
      (write-region (org-clock-get-clock-string) nil orgmode-clocking-bar-tempfile nil 'quiet)
    (write-region "Idle?" nil orgmode-clocking-bar-tempfile nil 'quiet))
  )
(orgmode-clocking-bar-save-tempfile)
(run-with-timer 10 1 'orgmode-clocking-bar-save-tempfile)
