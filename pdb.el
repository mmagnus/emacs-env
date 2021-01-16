  ;; pdb.el
(load-file "~/.emacs.d/plugins/pdb-mode/pdb-mode.el")
(setq pdb-rasmol-name "/usr/bin/pymol")
(setq auto-mode-alist
       (cons (cons "pdb$" 'pdb-mode)
            auto-mode-alist ) )
(autoload 'pdb-mode "PDB")
;; Need to add
(setq pdb-rasmol-name "open -a PyMOL.app ")

(global-set-key "\C-cn" 'pdb-change-residue)


