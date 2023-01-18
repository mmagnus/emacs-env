(require 'subr-x)
(defun random ()
  (interactive)
  (insert (string-trim-right (shell-command-to-string "/Users/magnus/bin/random")))
  (backward-word)
  ) ;; or without f 

(global-set-key (kbd "C-c o r") 'random)

;; emacs-orgmode-issue
;; echo "emacs-orgmode-issue::`openssl rand -base64 5 |  sed 's/=//'`"% in randomf
(defun randomf ()
  (interactive)
  (insert (shell-command-to-string "/Users/magnus/bin/randomf")))

(global-set-key (kbd "C-c o R") 'randomf)
