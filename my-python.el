; (setenv "PYTHONPATH" "/home/magnus/work/src/rna-pdb-tools")
;; pythonpath add auto
(setenv "PYTHONPATH" (shell-command-to-string "$SHELL --login -c 'echo -n $PYTHONPATH'"))
;;(getenv "PYTHONPATH")


(require 'yasnippet)
(yas/global-mode 1)


;!!!! cause problems with python-mode and switch to python.el !!!!!
;;pyest
;(require 'pytest)
;(add-hook 'python-mode-hook
;          (lambda ()
;            (local-set-key "\C-cA" 'pytest-all)
;            (local-set-key "\C-cm" 'pytest-module)
;            (local-set-key "\C-c." 'pytest-one)
;            (local-set-key "\C-cd" 'pytest-directory)
;            (local-set-key "\C-cpa" 'pytest-pdb-all)
;            (local-set-key "\C-cpm" 'pytest-pdb-module)
;            (local-set-key "\C-cp." 'pytest-pdb-one)))



;; https://www.youtube.com/watch?v=6BlTGPsjGJk
(require 'auto-complete-config)
(ac-config-default)


;; pycoverage
(require 'pycoverage)
(defun my-coverage ()
  (interactive)
  (when (derived-mode-p 'python-mode)
    (progn
      (linum-mode)
      (pycoverage-mode))))
(eval-after-load 'python-mode
'(define-key python-mode-map (kbd "\C-cR") 'pycoverage-refresh))


;; autopep8
; why off?
;  (1) if you comment ## as python code, it will align it all to the #
;  (2) if you open pymol file, it will try to clean it; which will break the code
;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=120 --ignore E265"))
; E265 - Fix spacing after comment hash for block comments.

;https://github.com/jorgenschaefer/elpy/issues/870
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

;;python-mode.el
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("ipython" . python-mode))


;; https://github.com/kostafey/sphinx-frontend
;(require 'sphinx-frontend)


;; sphinx-doc
;(add-hook 'python-mode-hook (lambda ()
;                                 (require 'sphinx-doc)
;                                 (sphinx-doc-mode t)))


;; jedi melpa @jedi
;; this should be after python-model.el load
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
(setq jedi:tooltip-method '(pos-tip popup))   ; popup window
(put 'set-goal-column 'disabled nil)


;;  (old) python-outline
;; -------------------------------------------------------------
;; it has to be at the end, then it works by default!
;; https://mail.python.org/pipermail/python-list/2002-May/128695.html
;;(add-to-list 'load-path "~/.emacs.d/plugins/python-outline/")
(load-file "~/.emacs.d/plugins/python-outline/python-outline.el")

;; (global-set-key (kbd "\C-co")  'python-outline)
(eval-after-load 'python-mode
   '(define-key python-mode-map (kbd "\C-c o") 'python-outline))

;(setq outline-start-hidden t)
(setq auto-mode-alist (append '(
    ("\\.text" . texi-outline)
    ("\\.py" . python-outline))
             auto-mode-alist))


 ;; highlight the import pdb text; anotate pdb http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
 ;; python-add-breakpoint http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
 (defun python-add-breakpoint ()
   (interactive)
    ;;(py-newline-and-indent)
    (insert "import ipdb; ipdb.set_trace()")
    (highlight-lines-matching-regexp "^[  ]*import ipdb; ipdb.set_trace()")
    )
 ;;(define-key py-mode-map (kbd "C-c C-b") 'python-add-breakpoint)
 ;;(global-set-key (kbd "<f8>") 'python-add-breakpoint)
 ;;(local-set-key (kbd "<f8>") 'python-add-breakpoint)
(eval-after-load 'python-mode
'(define-key python-mode-map (kbd "<f8>") 'python-add-breakpoint))




;; C-u C-c # http://stackoverflow.com/questions/12381692/how-to-uncomment-code-block-in-emacs-python-mode
(eval-after-load 'python-mode
'(define-key python-mode-map (kbd "\C-cu") 'uncomment-region))

; https://github.com/flycheck/flycheck-popup-tip/
;(eval-after-load 'flycheck
;  (if (display-graphic-p)
;      (flycheck-pos-tip-mode)
;    (flycheck-popup-tip-mode)))

 ;; pylint
 ;(autoload 'pylint "pylint")
 ;(add-hook 'python-mode-hook 'pylint-add-menu-items)
 ;(add-hook 'python-mode-hook 'pylint-add-key-bindings)


;; https://github.com/creichert/ido-vertical-mode.el
;(require 'ido-vertical-mode)
;(ido-mode 1)
;(ido-vertical-mode 1)
;(setq ido-vertical-define-keys 'C-n-and-C-p-only)
;; ^ i don't like this in geekbook so I don't see the whole list of files
;; and I can't sort etc.

  ;; # color (set-face-background 'highlight "#FFF498")  ;; orange
  ;(global-hl-line-mode t)


;(add-to-list 'load-path "~/.emacs.d/settings")
 ;(require 'python-el-settings) ;; off this plugin


;; # color (set-face-background 'highlight "#FFF498")  ;; orange
;(global-hl-line-mode t)


 ;; https://mail.python.org/pipermail/python-list/2002-May/128695.html
 ;; python-outline
 ;(setq outline-start-hidden t)
 ;(load-library "python-outline")
 ;(setq auto-mode-alist (append '(
 ;    ("\\.texi" . texi-outline)
 ;    ("\\.py" . python-outline))
 ;              auto-mode-alist))


;(require 'realgud)


;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")


;(elpy-enable)
(define-key global-map (kbd "C-c i") 'iedit-mode)

(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
(setq-default flycheck-flake8-maximum-line-length 160)
;;; my-python.el ends here
