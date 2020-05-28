(defvar orgmode-clocking-bar-tempfile "/Users/magnus/task.txt")
;(defvar org-clock-get-clock-string "")

(defun orgmode-clocking-bar-save-tempfile ()
  "Save region to a tempfile and run Grammarly on it."
  (if org-clock-current-task
      (write-region (org-clock-get-clock-string) nil orgmode-clocking-bar-tempfile nil 'quiet)
    (write-region "Idle?" nil orgmode-clocking-bar-tempfile nil 'quiet))
  )

(defvar org-mode-clock-timer)

(defun orgmode-clocking-in ()
  ""
  (setq org-mode-clock-timer (run-with-timer 10 10 'orgmode-clocking-bar-save-tempfile)))

(defun orgmode-clocking-out ()
  "xxx"
  (write-region "Idle?" nil orgmode-clocking-bar-tempfile nil 'quiet))

(provide 'org-mode-clock-bar)
;;; org-mode-clock-bar.el ends here

