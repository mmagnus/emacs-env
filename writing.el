;(require 'predictive)
; https://company-mode.github.io
(add-hook 'after-init-hook 'global-company-mode)

(global-set-key "\C-c+" 'write)
(global-set-key "\C-c_" 'darkroom-mode)

(defun write()
  (interactive)
  (darkroom-mode)
  (narrow-to-region (region-beginning) (region-end))
  )
  
(defun write-normal()
  (interactive)
  (darkroom-mode)
  )
(defun iawriter ()
  (interactive)
  (call-process-shell-command (concat "open -a iAwriter ~/geekbook/notes/" (buffer-name)))
  (message (concat "open -a iAwriter ~/geekbook/notes/" (buffer-name)))
  )

(global-set-key "\C-cw" 'iawriter)

(defun typora ()
  (interactive)
  (call-process-shell-command (concat "open -a Typora ~/geekbook/notes/" (buffer-name)))
  (message (concat "open -a Typora ~/geekbook/notes/" (buffer-name)))
  )

(global-set-key "\C-ct" 'typora)
;;
