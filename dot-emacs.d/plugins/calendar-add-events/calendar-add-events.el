;; install package-install f
;; change paths to your needs
;; change iCloud to a name of your calendar
(require 'f)

(defvar calendar-tempfile "/tmp/calendar.scpt")
(defvar calendar-cmd "osascript /tmp/calendar.scpt")

(defun calendar-add-event()
  "Save region as an event to a calendar."
  (interactive)
  (setq event 
     (string-trim-left
      (s-replace "INPROGRESS" ""
            (s-replace "TODO" ""
                       (s-replace "*" ""
                                  (s-replace "[#C]" ""
                                             (s-replace "[#B]" ""
                                                        (s-replace "[#A]" ""
                                                                   (buffer-substring-no-properties
                                                                    (line-beginning-position)
                                                                    (line-end-position))))))))))

  ;; (setq event (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
  (setq contents (concat "tell application \"Calendar\"
	activate
	tell calendar \"iCloud\"
		set theCurrentDate to current date
		make new event at end with properties {summary:\"" event "\", start date:theCurrentDate, end date:theCurrentDate + 15 * minutes}
	end tell
	reload calendars
end tell"))

  (f-write-text contents 'utf-8 calendar-tempfile)
  (call-process-shell-command calendar-cmd))

;(calendar-add-event)
(global-set-key (kbd "C-c A") 'calendar-add-event)
