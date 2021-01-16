;; rna-tools-compile
(defun rna-docs ()
  "Run rna_docs to compile docs of rna-tools."
  (interactive)
  (call-process-shell-command (concat "rna_docs"))
  )
(global-set-key (kbd "C-c d r") 'rna-docs)

;; rna-tools-compiled
(defun compile-dock ()
  "Run rna_docs to compile docs of rna-tools."
  (interactive)
  (call-process-shell-command (concat "cd .. && make clean && sphinx-build -P -b html -d build/doctrees source build/html"))
  )
(global-set-key (kbd "C-c d m") 'compile-dock)
