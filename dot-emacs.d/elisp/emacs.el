;; run as a server
;; let make happy all emacs clients
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
(add-to-list 'auto-mode-alist '("\\.el\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.elbak\\'" . emacs-lisp-mode))

(server-start)
; so you will not have bl\<a new line> 
(visual-line-mode)

;; Insert curr date use with Geekbook <http://www.emacswiki.org/emacs/InsertingTodaysDate>
(defun insert-current-date () (interactive)
     ;(insert (shell-command-to-string "echo -n '--' && echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d)
     (insert (shell-command-to-string "echo -n $(date +%y%m%d)"))) ;; echo -n $(date +%y%m%d-%a)
(global-set-key (kbd "C-c .") 'insert-current-date)


(require 'yasnippet)
(yas/global-mode 1)
