;; WEB DEV -----------------------------------------------------------------
  (autoload 'tidy-parse-config-file "tidy" "Parse the `tidy-config-file'" t)
  (autoload 'tidy-save-settings "tidy" "Save settings to `tidy-config-file'" t)
  (autoload 'tidy-build-menu  "tidy" "Install an options menu for HTML Tidy." t)

  ;If you use html-mode to edit HTML files then add something like
  ;this as well

  (defun my-html-mode-hook () "Customize my html-mode."
    (tidy-build-menu html-mode-map)
    (local-set-key [(control c) (control c)] 'tidy-buffer)
    (setq sgml-validate-command "tidy"))

  (add-hook 'html-mode-hook 'my-html-mode-hook)

  ;This will set up a "tidy" menu in the menu bar and bind the key
  ;sequence "C-c C-c" to `tidy-buffer' in html-mode (normally bound to
  ;`validate-buffer').

  ;For other modes (like html-helper-mode) simple change the variables
  ;`html-mode-hook' and `html-mode-map' to whatever is appropriate e.g.

  (defun my-html-mode-hook () "Customize my html-helper-mode."
    (tidy-build-menu html-helper-mode-map)
    (local-set-key [(control c) (control c)] 'tidy-buffer)
    (setq sgml-validate-command "tidy"))

(add-hook 'html-helper-mode-hook 'my-html-mode-hook)

(add-hook 'html-mode-hook 'web-mode)

