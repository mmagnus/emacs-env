;;; dot-emacs.el --- Magnus Env
;;; Commentary:
;;;  https://github.com/mmagnus/emacs-env
;;; Code:
; keep this simple to speed up my system ;-)
	  
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq python-python-command "/Users/magnus/miniconda3/bin/python")


(load-file "/Users/magnus/workspace/emacs-env/shortcuts.el")
(load-file "/Users/magnus/workspace/emacs-env/mac.el")
(load-file "/Users/magnus/workspace/emacs-env/orgmode.el")
(load-file "/Users/magnus/workspace/emacs-env/theme.el")
(load-file "/Users/magnus/workspace/emacs-env/writing.el")
(load-file "/Users/magnus/workspace/emacs-env/markdown.el")
(load-file "/Users/magnus/workspace/emacs-env/emacs.el")
(load-file "/Users/magnus/workspace/OrgModeClockingXBar/OrgModeClockingXBar.el")
(load-file "/Users/magnus/workspace/emacs-env/dot-emacs.d/plugins/calendar-add-events/calendar-add-events.el")

;(with-eval-after-load 'flycheck
;  '(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode))

;(global-visual-line-mode t) this fucks bookmarks etc
(setq visible-bell 1)
(global-auto-revert-mode 1)
(load-file "/Users/magnus/.emacs.d/plugins/diff-hl/diff-hl.el")
(require 'modeline-posn)
(size-indication-mode 1)
(global-diff-hl-mode)
(setq locate-command "fx")
;; http://pragmaticemacs.com/emacs/dired-human-readable-sizes-and-sort-by-size/
;(setq dired-listing-switches "-alhs")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(org-agenda-custom-commands
   '(("o" "work*.org Agenda and all TODO's"
      ((agenda ""
	       ((org-agenda-files
		 '("~//geekbook/notes/work-curr.org" "~//geekbook/notes/inbox.org"))))))
     ("O" "work*.org Agenda and all TODO's "
      ((agenda ""
	       ((org-agenda-files
		 '("~//geekbook/notes/work-curr.org" "~//geekbook/notes/inbox.org"))))
       (alltodo ""
		((org-agenda-files
		  '("~//geekbook/notes/work-curr.org" "~//geekbook/notes/inbox.org"))))))
     ("j" "curr*.org A"
      ((agenda ""
	       ((org-agenda-files
		 '("~//geekbook/notes/life-curr.org" "~//geekbook/notes/work-curr.org" "~//geekbook/notes/orgmode/skills-curr.org"))))))
     (":" "life*.org A+T"
      ((agenda ""
	       ((org-agenda-files
		 '("~//geekbook/notes/life-curr.org" "~//geekbook/notes/inbox.org"))))
       (alltodo ""
		((org-agenda-files
		  '("~//geekbook/notes/life-archive.org" "~//geekbook/notes/life-curr.org" "~//geekbook/notes/orgmode/life-today.org"))))))
     (";" "life*.org Agenda only"
      ((agenda ""
	       ((org-agenda-files
		 '("~/geekbook/notes/life-curr.org" "~/geekbook/notes/inbox.org"))))))
     ("k" "s[k]ills Agenda and all TODO's "
      ((agenda ""
	       ((org-agenda-files
		 '("~/geekbook/notes/skills-curr.org"))))
       (alltodo ""
		((org-agenda-files
		  '("~/geekbook/notes/skills-curr.org"))))))
     ("n" "TODO's Agenda and all"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)))
 '(org-agenda-files
   '("~/geekbook/notes/work-curr.org" "~/geekbook/notes/life-curr.org" "~/geekbook/notes/inbox.org"))
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-span 'day)
 '(org-capture-templates
   '(("t" "Todo Life" entry
      (file+headline "~/geekbook/notes/life-curr.org" "#inbox")
      "* %?
  %i
  %a")
     ("x" "Test" entry
      (file+headline "~/geekbook/notes/life-curr.org" "#inbox")
      "** TODO %^{Description} [why] %^{why} [why not] %^{why not}
  %?
  :LOGBOOK:
  - Added: %U
  :END:
  %a
")
     ("w" "Todo Work" entry
      (file+headline "~/geekbook/notes/work-curr.org" "#inbox")
      "* TODO %?  %i %a")))
 '(org-clock-mode-line-total 'current)
 '(org-duration-format 'h:mm)
 '(org-indent-indentation-per-level 5)
 '(org-indent-mode-turns-on-hiding-stars f)
 '(org-remove-property-drawers-from-render-output t)
 '(org-startup-truncated t)
 '(org-use-property-inheritance '("Effort"))

 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(bmkp-last-as-first-bookmark-file "/Users/magnus/.emacs.d/bookmarks")
 '(desktop-save-mode 1)
 '(bookmark-save-flag t)
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(csv-separators '(";"))
 '(custom-enabled-themes '(hipster))
 '(custom-safe-themes
   '("3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "5aa819909f6ae87b5425cc94c325aa9fd55e3deb55edb25136bedc6d3eaab6a1" "855eb24c0ea67e3b64d5d07730b96908bac6f4cd1e5a5986493cbac45e9d9636" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "5057614f7e14de98bbc02200e2fe827ad897696bfd222d1bcab42ad8ff313e20" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "9a2dcb3d7c42d508d5bb78eef98c8e9a71ec4ef8bd88a6677e3c237c73fa20eb" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" default))
 '(vc-annotate-very-old-color "#d33682" t)
 '(visual-line-mode 1 t))
 '(size-indication-mode t)
 '(show-paren-mode t)
	  ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(markdown-pre-face ((t (:inherit font-lock-string-face :foreground "gray50"))))
 '(markdown-url-face ((t (:inherit font-lock-string-face :foreground "gray20"))))
	  
;https://stackoverflow.com/questions/445873/how-can-i-make-emacs-mouse-scrolling-slower-and-smoother
(setq mouse-wheel-progressive-speed nil) ; could be too fast
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq scroll-step 2)

(set-cursor-color "#00ccff")

(load-file "/Users/magnus/workspace/emacs-env/insert-safari.el")
