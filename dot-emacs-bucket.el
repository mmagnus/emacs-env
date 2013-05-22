;;(setq org-todo-keywords '((sequence "TODO" "|" "DONE" "MAYBE" "REF")))






;; # cedet
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
(load-file "~/.emacs.d/plugins/cedet-1.0/common/cedet.el")


;; # ?????? - MM
;; Enable EDE (Project Management) features
(global-ede-mode 1)


;; # ecb
(add-to-list 'load-path
                     "/home/magnus/.emacs.d/plugins/ecb-2.40")
;;(require 'ecb)
;; not it is super fast !!!
(require 'ecb-autoloads)




;;(autoload 'python-mode "python-mode" "Python Mode." t)
;;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(add-to-list 'interpreter-mode-alist '("python" . python-mode))







;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)




;; # mysql
;;mysql
;; (require 'mysql)

(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))

;;----------------------------------------





;;----------------------------------------

(add-to-list 'load-path "~/.emacs.d/org-mode/plugins/lisp")
(setq org-todo-keywords
       '((sequence "TODO" "IN_PROGRESS" "|" "DONE"  "MAYBE" "INFO")))

;; instalacja moja org
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(setq load-path (cons "~/.emacs.d/org-mode/lisp" load-path))
(setq load-path (cons "~/.emacs.d/org-mode/contrib/lisp" load-path))
(require 'org-install)



(require 'anki)








(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

;; MOINMOIN off
(require 'moinmoin-mode)
(autoload 'moinmoin-mode "moinmoin" nil t)
;;(setq auto-mode-alist (cons '("localhost\\." . moinmoin-mode) auto-mode-alist))
;; ***


;;(add-to-list 'auto-mode-alist '("\\.mm\\'" . moinmoin-mode))



;----------------------------------------

;----------------------------------------


;; SCROLL-ALL OFF
;;(load "scroll-all.el")

;----------------------------------------

;;django-mode OFF
;;; (load "django-mode.el")
;;django-mode-html
;;;(load "django-html-mode.el")

;----------------------------------------

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;; 







;; Outline mode extension
;; ----------------------
;;
;; Author: Ronny Wikh <rw at strakt.com>, May 2002
;;
;; A simple extension of the outline mode with functions provided
;; for python and texi modes.
;;
;; The mode simply adds toggles for outline/show everything and
;; outline/show paragraph, where the 'paragraph' concept is
;; modified to mean classes and function definitions in python
;; and chapters and subsections in texi.
;;
;; Toggle entry is bound to C-c C-e
;; Toggle all is bound to C-c C-a
;;
;; The default is that a buffer is started in outline mode. This
;; behaviour is controlled by the variable 'outline-start-hidden'
;; which can be set in your .emacs:
;; 
;; (setq outline-start-hidden t) to start in outline (default) or
;; (setq outline-start-hidden nil) to start showing everything
;;
;; Activation of the mode can be done manually by calling the function
;;
;; 'python-outline' for python mode,
;; 'texi-outline' for texi mode
;;
;; or automatically by inserting the following lines into your .emacs file:
;;
;; (setq auto-mode-alist (append '(
;;		("\\.texi" . texi-outline)
;;		("\\.py" . python-outline))
;;              auto-mode-alist))
;;
;; Modes for other languages can easily be added by providing suitable
;; regexp expressions for that specific language in new functions.
;;

(defvar outline-start-hidden t "Start outline hidden")

(defun outline-setup (regexp)
  "Setup outline mode"
  (defvar outline-toggle-all-flag nil "toggle all flag")
  (make-variable-buffer-local 'outline-toggle-all-flag)
  (defvar cpos_save nil "current cursor position")
  (outline-minor-mode)
  (setq outline-regexp regexp)
  (define-key outline-minor-mode-map "\C-c\C-e" 'outline-toggle-entry)
  (define-key outline-minor-mode-map "\C-c\C-a" 'outline-toggle-all)
  (if outline-start-hidden
      (progn
	(setq outline-toggle-all-flag t)
	(hide-body)))

  (defun outline-toggle-entry () (interactive)
    "Toggle outline hiding for the entry under the cursor"
    (if (progn
	  (setq cpos_save (point))
	  (end-of-line)
	  (get-char-property (point) 'invisible))
	(progn 
	  (show-subtree)
	  (goto-char cpos_save))
      (progn 
	(hide-leaves)
	(goto-char cpos_save))))
	
  (defun outline-toggle-all () (interactive)
    "Toggle outline hiding for the entire file"
    (if outline-toggle-all-flag
	(progn
	  (setq outline-toggle-all-flag nil)
	  (show-all))
      (progn 
	(setq outline-toggle-all-flag t)
	(hide-body))))
)

(defun python-outline () (interactive)
  "Python outline mode"
  (python-mode)
  (outline-setup "^class \\|[ 	]*def \\|^#"))

(defun texi-outline () (interactive)
  "Texinfo outline mode"
  (texinfo-mode)
  (outline-setup "^@chap\\|@\\(sub\\)*section"))

;;end outline
(setq load-path  (cons (expand-file-name "~/.emacs.d/elisp/") load-path))



(setq-default transient-mark-mode t)
(global-font-lock-mode t)
(setq inhibit-startup-message t)

(global-hl-line-mode t)
 
(global-set-key "\M-RET" 'tempo-complete-tag)

;; To customize the background color
;;(set-face-background 'hl-line "#FFF498")  ;; Emacs 22 Only
;;(set-face-foreground 'highlight "#000000")   ;; font color fontu, czarny
(set-face-background 'highlight "#FFF498")  ;; pomaranczoyw
;;(set-face-background 'highlight "#464545")    ;; 
;;(set-face-background 'highlight "#330000") 
;; To customize the background color330")  ;; Emacs 21 Only

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; turn on font-lock mode
(global-font-lock-mode t)
;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; enable wheelmouse support by default
;(when window-system
;  (mwheel-install))

;; set a font
(when window-system
(set-face-font 
      'default '
      "-misc-fixed-medium-r-normal--11-*-*-*-*-*-iso10646-1"))

;; a few useful key bindings; ok, one for a good start
(global-set-key "\C-x\C-g" 'goto-line)
 
;; let make happy all emacs clients
(server-start)

;; surfing USA, sort of..
;; w3m settings
(setq w3m-use-cookies t)
;; Keep the w3m-el stuff separate from the .w3m preferences
(setq w3m-profile-directory       "~/.w3m/w3m-el-profile")
(setq w3m-arrived-file            "~/.w3m/w3m-el-profile/.arrived")
(setq w3m-cookie-file             "~/.w3m/w3m-el-profile/.cookie")
(setq w3m-form-textarea-directory "~/.w3m/w3m-el-profile/.textarea")

;; unicode stuff
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc-1345")
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(org-agenda-files (quote ("~/Documents/GTD/gtd.org"))))

;; http://interglacial.com/~sburke/pub/emacs/sburke_dot_emacs.config
;--------------------------------------------------------------------------
; Un-fillers:

(defun unfill-paragraph ()
  "Unfill the current paragraph."
  (interactive) (with-unfilling 'fill-paragraph))
(defalias 'unwrap-paragraph 'unfill-paragraph)

(defun unfill-region ()
  "Unfill the current region."
  (interactive) (with-unfilling 'fill-region))
(defalias 'unwrap-region 'unfill-region)

(defun unfill-individual-paragraphs ()
  "Unfill individual paragraphs in the current region."
  (interactive) (with-unfilling 'fill-individual-paragraphs))
(defalias 'unwrap-individual-paragraphs 'unfill-individual-paragraphs)

(defun with-unfilling (fn)
  (let ((fill-column 10000000)) (call-interactively fn)))

(put 'narrow-to-region 'disabled nil)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "Liberation Mono")))))


;; Magnus extra
;; http://www.enigmacurry.com/2009/01/21/autocompleteel-python-code-completion-in-emacs/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
;;; Auto-completion                                                                                            
;;;  Integrates:                                                                                               
;;;   1) Rope                                                                                                  
;;;   2) Yasnippet                                                                                             
;;;   all with AutoComplete.el                                                                                 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
(defun prefix-list-elements (list prefix)
  (let (value)
    (nreverse
     (dolist (element list value)
      (setq value (cons (format "%s%s" prefix element) value))))))
(defvar ac-source-rope
  '((candidates
     . (lambda ()
         (prefix-list-elements (rope-completions) ac-target))))
  "Source for Rope")
(defun ac-python-find ()
  "Python `ac-find-function'."
  (require 'thingatpt)
  (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
    (if (null symbol)
        (if (string= "." (buffer-substring (- (point) 1) (point)))
            (point)
          nil)
      symbol)))
(defun ac-python-candidate ()
  "Python `ac-candidates-function'"
  (let (candidates)
    (dolist (source ac-sources)
      (if (symbolp source)
          (setq source (symbol-value source)))
      (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
             (requires (cdr-safe (assq 'requires source)))
             cand)
        (if (or (null requires)
                (>= (length ac-target) requires))
            (setq cand
                  (delq nil
                        (mapcar (lambda (candidate)
                                  (propertize candidate 'source source))
                                (funcall (cdr (assq 'candidates source)))))))
        (if (and (> ac-limit 1)
                 (> (length cand) ac-limit))
            (setcdr (nthcdr (1- ac-limit) cand) nil))
        (setq candidates (append candidates cand))))
    (delete-dups candidates)))
(add-hook 'python-mode-hook
          (lambda ()
                 (auto-complete-mode 1)
                 (set (make-local-variable 'ac-sources)
                      (append ac-sources '(ac-source-rope) '(ac-source-yasnippet)))
                 (set (make-local-variable 'ac-find-function) 'ac-python-find)
                 (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
                 (set (make-local-variable 'ac-auto-start) nil)))
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
http://hide1713.wordpress.com/2009/01/30/setup-perfect-python-environment-in-emacs/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; http://www.enigmacurry.com/2009/01/21/autocompleteel-python-code-completion-in-emacs/ ;;

(require 'python)
(require 'auto-complete)
(require 'yasnippet)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; Initialize Pymacs                                                                                           
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; Initialize Rope                                                                                             
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; Initialize Yasnippet                                                                                        
;Don't map TAB to yasnippet                                                                                    
;In fact, set it to something we'll never use because                                                          
;we'll only ever trigger it indirectly.                                                                        
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
;;; Auto-completion                                                                                            
;;;  Integrates:                                                                                               
;;;   1) Rope                                                                                                  
;;;   2) Yasnippet                                                                                             
;;;   all with AutoComplete.el                                                                                 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
(defun prefix-list-elements (list prefix)
  (let (value)
    (nreverse
     (dolist (element list value)
      (setq value (cons (format "%s%s" prefix element) value))))))
(defvar ac-source-rope
  '((candidates
     . (lambda ()
         (prefix-list-elements (rope-completions) ac-target))))
  "Source for Rope")
(defun ac-python-find ()
  "Python `ac-find-function'."
  (require 'thingatpt)
  (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
    (if (null symbol)
        (if (string= "." (buffer-substring (- (point) 1) (point)))
            (point)
          nil)
      symbol)))
(defun ac-python-candidate ()
  "Python `ac-candidates-function'"
  (let (candidates)
    (dolist (source ac-sources)
      (if (symbolp source)
          (setq source (symbol-value source)))
      (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
             (requires (cdr-safe (assq 'requires source)))
             cand)
        (if (or (null requires)
                (>= (length ac-target) requires))
            (setq cand
                  (delq nil
                        (mapcar (lambda (candidate)
                                  (propertize candidate 'source source))
                                (funcall (cdr (assq 'candidates source)))))))
        (if (and (> ac-limit 1)
                 (> (length cand) ac-limit))
            (setcdr (nthcdr (1- ac-limit) cand) nil))
        (setq candidates (append candidates cand))))
    (delete-dups candidates)))
(add-hook 'python-mode-hook
          (lambda ()
                 (auto-complete-mode 1)
                 (set (make-local-variable 'ac-sources)
                      (append ac-sources '(ac-source-rope) '(ac-source-yasnippet)))
                 (set (make-local-variable 'ac-find-function) 'ac-python-find)
                 (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
                 (set (make-local-variable 'ac-auto-start) nil)))

;;Ryan's python specific tab completion                                                                        
(defun ryan-python-tab ()
  ; Try the following:                                                                                         
  ; 1) Do a yasnippet expansion                                                                                
  ; 2) Do a Rope code completion                                                                               
  ; 3) Do an indent                                                                                            
  (interactive)
  (if (eql (ac-start) 0)
      (indent-for-tab-command)))

(defadvice ac-start (before advice-turn-on-auto-start activate)
  (set (make-local-variable 'ac-auto-start) t))
(defadvice ac-cleanup (after advice-turn-off-auto-start activate)
  (set (make-local-variable 'ac-auto-start) nil))

(define-key python-mode-map "\t" 'ryan-python-tab)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
;;; End Auto Completion                                                                                        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; http://www.emacswiki.org/emacs/SentenceHighlight
(require 'sentence-highlight)


;;(when (load "flymake" t)
;;  (defun flymake-pylint-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;                       'flymake-create-temp-inplace))
;           (local-file (file-relative-name
;                        temp-file
;                        (file-name-directory buffer-file-name))))
;      (list "~/.emacs.d/plugins/flymake-python/pyflymake.py" (list local-file))))
;      ;;     check path
;
;  (add-to-list 'flymake-allowed-file-name-masks
;               '("\\.py\\'" flymake-pylint-init)))
;
;(add-hook 'find-file-hook 'flymake-find-file-hook)



;;(add-to-list 'load-path "~/.emacs.d/plugins/flymake/emacs-flymake")
;;(load "flymake")

; # flymake
(when (load "flymake" t) 
     (defun flymake-pyflakes-init () 
       (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                          'flymake-create-temp-inplace)) 
     (local-file (file-relative-name 
               temp-file 
               (file-name-directory buffer-file-name)))) 
         (list "pyflakes" (list local-file))))

    (add-to-list 'flymake-allowed-file-name-masks 
         '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)


;; this part is off
;; # flymake-python https://github.com/akaihola/flymake-python
;;(add-to-list 'load-path "~/.emacs.d/plugins/flymake-python")
