;; @rna
  ;; ralee mode is good for RNA alignment editing # http://personalpages.manchester.ac.uk/staff/sam.griffiths-jones/software/ralee/
  (add-to-list 'load-path "~/.emacs.d/plugins/ralee/elisp")
  (autoload 'ralee-mode "ralee-mode" "Yay! RNA things" t)
  (setq auto-mode-alist (cons '("\\.stk$" . ralee-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.sto$" . ralee-mode) auto-mode-alist))


  ;; pdb.el
  (load-file "~/.emacs.d/plugins/pdb-mode/pdb-mode.el")
  (setq pdb-rasmol-name "/usr/bin/pymol")
  (setq auto-mode-alist
       (cons (cons "pdb$" 'pdb-mode)
             auto-mode-alist ) )
  (autoload 'pdb-mode "PDB")

;; dna mode https://github.com/jhgorrell/dna-mode-el
(load-file "~/.emacs.d/plugins/dna-mode-el/dna-mode.el")

(autoload 'dna-mode "dna-mode" "Major mode for dna" t)
(add-to-list 'magic-mode-alist '("^>\\|ID\\|LOCUS\\|DNA" . dna-mode))
(add-to-list
    'auto-mode-alist
    '("\\.\\(fasta\\|fa\\|exp\\|ace\\|gb\\)\\'" . dna-mode))
(add-hook 'dna-mode-hook 'turn-on-font-lock)
(setq dna-color-bases-auto t)
(global-set-key (kbd "C-c d d") 'dna-color-bases-region)


(load-file "~/.emacs.d/plugins/dna-mode-el/dna-primer.el")

;;bio-seq
(add-to-list 'load-path "~/.emacs.d/plugins/bioseq-mode/")
(autoload 'bioseq-mode "bioseq-mode" "Major mode for biological sequences" t)
(add-to-list 'auto-mode-alist 
 	     '("\\.\\(fas\\|fasta\\|embs\\)\\'" . bioseq-mode))


;; @rna
  ;; ralee mode is good for RNA alignment editing # http://personalpages.manchester.ac.uk/staff/sam.griffiths-jones/software/ralee/
  (add-to-list 'load-path "~/.emacs.d/plugins/ralee/elisp")
  (autoload 'ralee-mode "ralee-mode" "Yay! RNA things" t)
  (setq auto-mode-alist (cons '("\\.stk$" . ralee-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.sto$" . ralee-mode) auto-mode-alist))

