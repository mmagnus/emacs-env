

;; SETTINGS -----------------------------------------------------------------


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(markdown-code-face ((t (:inherit Green :background "Black")))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(ac-ispell-fuzzy-limit 1)
 ;;'(ac-ispell-requires 4)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(bmkp-last-as-first-bookmark-file "/Users/magnus/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(csv-separators '(","))
 '(custom-enabled-themes '(hipster))
 '(custom-safe-themes
   '("3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "5aa819909f6ae87b5425cc94c325aa9fd55e3deb55edb25136bedc6d3eaab6a1" "855eb24c0ea67e3b64d5d07730b96908bac6f4cd1e5a5986493cbac45e9d9636" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "5057614f7e14de98bbc02200e2fe827ad897696bfd222d1bcab42ad8ff313e20" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "9a2dcb3d7c42d508d5bb78eef98c8e9a71ec4ef8bd88a6677e3c237c73fa20eb" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" default))
 '(display-battery-mode nil)
 '(display-time-mode nil)
 '(exec-path-from-shell-check-startup-files nil)
 '(fci-rule-color "#969896")
 '(indicate-empty-lines t)
 '(jedi:tooltip-method nil)
 '(linum-format " %5i ")
 '(magit-git-executable "git")
 '(markdown-fontify-code-blocks-natively t)
 '(markdown-hr-string "****************************************************")
 '(markdown-max-image-size '(800 . 600))
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   '("#183691" "#969896" "#a71d5d" "#969896" "#0086b3" "#795da3" "#a71d5d" "#969896"))
 '(org-agenda-custom-commands
   '(("o" "work*.org Agenda and all TODO's"
      ((agenda ""
	       ((org-agenda-files
		 '("~/iCloud/geekbook/notes/work-curr.org" "~/iCloud/geekbook/notes/inbox.org"))))))
     ("O" "work*.org Agenda and all TODO's "
      ((agenda ""
	       ((org-agenda-files
		 '("~/iCloud/geekbook/notes/work-curr.org" "~/iCloud/geekbook/notes/inbox.org"))))
       (alltodo ""
		((org-agenda-files
		  '("~/iCloud/geekbook/notes/work-curr.org" "~/iCloud/geekbook/notes/inbox.org"))))))
     ("j" "curr*.org A"
      ((agenda ""
	       ((org-agenda-files
		 '("~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/work-curr.org" "~/iCloud/geekbook/notes/orgmode/skills-curr.org"))))))
     (":" "life*.org A+T"
      ((agenda ""
	       ((org-agenda-files
		 '("~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/inbox.org"))))
       (alltodo ""
		((org-agenda-files
		  '("~/iCloud/geekbook/notes/life-archive.org" "~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/orgmode/life-today.org"))))))
     (";" "life*.org Agenda only"
      ((agenda ""
	       ((org-agenda-files
		 '("~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/inbox.org"))))))
     ("k" "s[k]ills Agenda and all TODO's "
      ((agenda ""
	       ((org-agenda-files
		 '("~/iCloud/geekbook/notes/skills-curr.org"))))
       (alltodo ""
		((org-agenda-files
		  '("~/iCloud/geekbook/notes/skills-curr.org"))))))
     ("n" "TODO's Agenda and all"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)))
 '(org-agenda-files
   '("~/iCloud/geekbook/notes/life-curr.org" "~/iCloud/geekbook/notes/inbox.org" "~/iCloud/geekbook/notes/work-curr.org"))
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-span 'day)
 '(org-capture-templates
   '(("t" "Todo Life" entry
      (file+headline "~/iCloud/geekbook/notes/life-curr.org" "#inbox")
      "* %?
  %i
  %a")
     ("x" "Test" entry
      (file+headline "~/iCloud/geekbook/notes/life-curr.org" "#inbox")
      "** TODO %^{Description} [why] %^{why} [why not] %^{why not}
  %?
  :LOGBOOK:
  - Added: %U
  :END:
  %a
")
     ("w" "Todo Work" entry
      (file+headline "~/iCloud/geekbook/notes/work-curr.org" "#inbox")
      "* TODO %?  %i %a")) t) '(org-clock-mode-line-total
  'current) '(org-indent-indentation-per-level 5)
  '(org-indent-mode-turns-on-hiding-stars f)
  '(package-selected-packages '(python-mode git-gutter tj3-mode
  cyphejor olivetti modeline-posn github-notifier company ##
  visual-regexp zen-mode darkroom guess-language ein yaml-mode
  docker-tramp dockerfile-mode ac-anaconda markdown-preview-mode
  markdown-mode paredit org-autolist load-theme-buffer-local
  flycheck-inline org-download monokai-alt-theme sublime-themes
  python-docstring flyspell-correct-popup flyspell-lazy
  dic-lookup-w3m build-status flycheck-color-mode-line flymd
  flycheck-pyflakes django-mode web-narrow-mode jedi github-theme
  color-theme-buffer-local uimage csv-mode w3m org-gcal
  google-this langtool org-random-todo emojify el-pocket
  blank-mode ido-vertical-mode ox-gfm auto-org-md sphinx-mode
  sphinx-frontend sphinx-doc auto-complete-rst ac-helm python
  ipython outline-magic writeroom-mode tidy synonyms stem skype
  python-pylint python-pep8 projectile multi-term markdown-mode+
  magit-tramp jabber hipster-theme helm-ispell helm
  google-translate git-rebase-mode git-commit-mode focus
  flymake-python-pyflakes flymake flycheck fiplr
  exec-path-from-shell ess-smart-underscore ess-R-object-popup
  eimp ecb dictionary color-theme cl-generic calfw-gcal calfw
  auto-dictionary ac-slime ac-python ac-php-core ac-ispell ac-R))
  '(pdf-view-midnight-colors '("#969896" . "#f8eec7") t)
  '(py-keep-windows-configuration t) '(safe-local-variable-values
  '((ispell-dictionary . "polish"))) '(send-mail-function nil)
  '(show-paren-mode t) '(synonyms-cache-file
   "/Users/magnus/iCloud/workspace/emacs-env/dot-emacs.d/synonimous/mthesaur.txt.cache")
 '(synonyms-file
   "/Users/magnus/iCloud/workspace/emacs-env/dot-emacs.d/synonimous/mthesaur.txt")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B" t)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#d01A4E")
     (60 . "#cb4b16")
     (80 . "#b58900")
     (100 . "#b58900")
     (120 . "#b58900")
     (140 . "#7E7D7E")
     (160 . "#7E7D7E")
     (180 . "#9FAA9B")
     (200 . "#9FC59F")
     (220 . "#859900")
     (240 . "#31be67")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#268bd2")
     (320 . "#268bd2")
     (340 . "#00a74e")
     (360 . "#d33682")) t)
 '(vc-annotate-very-old-color "#d33682" t))
