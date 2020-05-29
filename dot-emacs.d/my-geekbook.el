(defun geekbook-open-page ()
 (interactive)
 (message (buffer-name))
 (setq cmd  (concat "open http://127.0.0.1:5000/view/" (replace-in-string ".md" ".html" (buffer-name))))
 (shell-command cmd)
 (message cmd)
 )
(global-set-key (kbd "C-c [") 'geekbook-open-page)

