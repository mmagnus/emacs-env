(require 'subr-x)
(defun insert-safari ()
  (interactive)
  (insert (string-trim-right (shell-command-to-string "/Users/magnus/bin/insert-safari.sh")))
  (backward-word)
  ) ;; or without f 
(global-set-key (kbd "C-c o s") 'insert-safari)
;;https://emacs.stackexchange.com/questions/51097/how-to-execute-a-shell-script-inside-of-emacs
