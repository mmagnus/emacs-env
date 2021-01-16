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
