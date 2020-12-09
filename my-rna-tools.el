;; rna-tools-compile
(defun rna-docs ()
  "Run rna_docs to compile docs of rna-tools."
  (interactive)
  (call-process-shell-command (concat "rna_docs"))
  )
(global-set-key (kbd "C-c d r") 'rna-docs)

