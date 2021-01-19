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
