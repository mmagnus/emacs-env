(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-fuzzy-limit 2)
 '(ac-ispell-requires 4)
 '(bmkp-last-as-first-bookmark-file "/home/magnus/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(indicate-empty-lines t)
 '(magit-git-executable "git")
 '(markdown-hr-string
   "--------------------------------------------------------------------------------")
 '(menu-bar-mode nil)
 '(org-agenda-category-icon-alist
   (quote
    (("work-curr" "~/Dropbox/curr_dropbox/org_mode_icon/icon.png" nil nil))))
 '(org-agenda-custom-commands
   (quote
    (("o" "Agenda and all TODO's work*.org"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/iCloud/geekbook/notes/work-curr.org")))))
       (alltodo ""
		((org-agenda-files
		  (quote
		   ("~/iCloud/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/work-inbox.org")))))))
     ("l" "Agenda life*.org"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/iCloudx/geekbook/notes/life-curr.org" "~/Dropbox/geekbook/notes/life-today.org")))))))
     (";" "Agenda and all TODO's life*.org"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/life-curr.org" "~/Dropbox/geekbook/notes/life-today.org")))))
       (alltodo ""
		((org-agenda-files
		  (quote
		   ("~/Dropbox/geekbook/notes/life-archive.org" "~/Dropbox/geekbook/notes/life-curr.org" "~/Dropbox/geekbook/notes/life-today.org")))))))
     ("x" "Agenda and all TODO's eXtremal science "
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/science.org")))))
       (alltodo ""
		((org-agenda-files
		  (quote
		   ("~/Dropbox/geekbook/notes/science.org")))))))
     ("k" "Agenda and all TODO's s[k]ills"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/skills-curr.org")))))
       (alltodo ""
		((org-agenda-files
		  (quote
		   ("~/Dropbox/geekbook/notes/skills-curr.org")))))))
     ("w" "Agenda work*.org"
      ((agenda ""
	       ((org-agenda-files
		 (quote
		  ("~/Dropbox/geekbook/notes/work-someday.org" "~/Dropbox/geekbook/notes/work-extra.org" "~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/work-archive.org" "~/Dropbox/geekbook/notes/work-inbox.org")))))))
     ("n" "Agenda and all TODO's"
      ((agenda "" nil)
       (alltodo "" nil))
      nil))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/geekbook/notes/work-someday.org" "~/Dropbox/geekbook/notes/work-extra.org" "~/Dropbox/geekbook/notes/work-curr.org" "~/Dropbox/geekbook/notes/work-archive.org" "~/Dropbox/geekbook/notes/work-inbox.org")))
 '(org-agenda-span (quote day))
 '(org-indent-indentation-per-level 5)
 '(org-indent-mode-turns-on-hiding-stars f)
 '(package-selected-packages
   (quote
    (realgud python-docstring flyspell-correct-popup flyspell-lazy dic-lookup-w3m build-status flycheck-color-mode-line flycheck-pos-tip flymd flycheck-pyflakes django-mode web-narrow-mode web-mode jedi github-theme color-theme-buffer-local uimage csv-mode w3m org-gcal darkroom google-this langtool org-random-todo emojify el-pocket blank-mode ido-vertical-mode ox-gfm auto-org-md sphinx-mode sphinx-frontend sphinx-doc auto-complete-rst ac-helm python ipython outline-magic writeroom-mode wanderlust tidy synonyms stem skype python-pylint python-pep8 python-mode projectile powerline multi-term markdown-mode+ magit-tramp jabber hipster-theme helm-ispell helm google-translate git-rebase-mode git-commit-mode focus flyspell-popup flymake-python-pyflakes flymake flycheck fiplr exec-path-from-shell ess-smart-underscore ess-R-object-popup eimp ecb dictionary color-theme cl-generic calfw-gcal calfw auto-yasnippet auto-dictionary ac-slime ac-python ac-php-core ac-ispell ac-R)))
 '(py-keep-windows-configuration t)
 '(show-paren-mode t)
 '(synonyms-cache-file
   "/Users/magnus/Dropbox/workspace/emacs-env/dot-emacs.d/synonimous/mthesaur.txt.cache")
 '(synonyms-file
   "/Users/magnus/Dropbox/workspace/emacs-env/dot-emacs.d/synonimous/mthesaur.txt")
 '(tool-bar-mode nil))
