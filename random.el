(defun random ()
  (interactive)
  (insert (shell-command-to-string "/Users/magnus/bin/random")))


(global-set-key
 (kbd "C-c C-s r")
 'random
 )
