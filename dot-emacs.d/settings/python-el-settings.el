;; https://www.emacswiki.org/emacs/ProgrammingWithPythonDotEl
  (defadvice python-send-region (around advice-python-send-region-goto-end)
      "Fix a little bug if the point is not at the prompt when you do
    C-c C-[rc]"
      (let ((oldpoint (with-current-buffer (process-buffer (python-proc)) (point)))
    	(oldinput
    	 (with-current-buffer (process-buffer (python-proc))
    	   (goto-char (point-max))
    	   ;; Do C-c C-u, but without modifying the kill ring:
    	   (let ((pmark (process-mark (get-buffer-process (current-buffer)))))
    	     (when (> (point) (marker-position pmark))
    	       (let ((ret (buffer-substring pmark (point))))
    		 (delete-region pmark (point))
    		 ret))))))
        ad-do-it
        (with-current-buffer (process-buffer (python-proc))
          (when oldinput (insert oldinput))
          (goto-char oldpoint))))
    (ad-enable-advice 'python-send-region 'around 'advice-python-send-region-goto-end)
(ad-activate 'python-send-region)


;; https://emacswiki.org/emacs/PythonProgrammingInEmacs#toc32
(setq python-shell-interpreter "ipython"
         python-shell-interpreter-args "--simple-prompt -i")
;; https://emacs.stackexchange.com/questions/24453/weird-shell-output-when-using-ipython-5

(provide 'python-el-settings)