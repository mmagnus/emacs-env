;;
;; load from ~/.emacs.d
;;
(add-to-list 'load-path "~/.emacs.d/USED/")

;;(setq org-todo-keywords '((sequence "TODO" "|" "DONE" "MAYBE" "REF")))

;;time
(display-time)


(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;; save desktop http://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html # siagle sie pyta kur***
;;(desktop-save-mode 1)
;;----------------------------------------
(require 'linum)
(global-linum-mode t)
;;----------------------------------------

;; fullscreen http://www.emacswiki.org/emacs/FullScreen#toc22
(defun toggle-fullscreen (&optional f)
      (interactive)
      (let ((current-value (frame-parameter nil 'fullscreen)))
           (set-frame-parameter nil 'fullscreen
                                (if (equal 'fullboth current-value)
                                    (if (boundp 'old-fullscreen) old-fullscreen nil)
                                    (progn (setq old-fullscreen current-value)
                                           'fullboth)))))

    (global-set-key [f11] 'toggle-fullscreen)

    ; Make new frames fullscreen by default. Note: this hook doesn't do
    ; anything to the initial frame if it's in your .emacs, since that file is
    ; read _after_ the initial frame is created.
    (add-hook 'after-make-frame-functions 'toggle-fullscreen)
;;----------------------------------------


;; yasnippet https://github.com/capitaomorte/yasnippet
(add-to-list 'load-path
              "~/.emacs.d/USED/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
;;----------------------------------------

;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")


;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

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



(add-to-list 'load-path
                     "/home/magnus/.emacs.d/ecb-2.40")
(require 'ecb)



(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))


(require 'sr-speedbar)
;;  (global-set-key (kbd "s-s") 'sr-speedbar-toggle)

;;----------------------------------------

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

;;----------------------------------------




(add-to-list 'load-path "/home/magnus/.emacs.d/USED/magit-1.0.0")  
;;git
(autoload 'magit-status "magit" nil t)

;;----------------------------------------

(add-to-list 'load-path "~/.emacs.d/org-mode/USED/lisp")
(setq org-todo-keywords
       '((sequence "TODO" "IN_PROGRESS" "|" "DONE"  "MAYBE" "INFO")))

;; instalacja moja own
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(setq load-path (cons "~/.emacs.d/org-mode/lisp" load-path))
(setq load-path (cons "~/.emacs.d/org-mode/contrib/lisp" load-path))
(require 'org-install)


;;bookmark+
;;http://www.emacswiki.org/emacs/bookmark%2B-doc.el
;;http://www.cs.cmu.edu/cgi-bin/info2www?%28emacs%29Bookmarks
(setq bookmark-save-flag 1)
(load "bookmark+.el")
(require 'bookmark+)


;; ralee mode is good for RNA alignment editing # http://personalpages.manchester.ac.uk/staff/sam.griffiths-jones/software/ralee/
(add-to-list 'load-path "~/.emacs.d/USED/ralee-0.7/elisp")
(autoload 'ralee-mode "ralee-mode" "Yay! RNA things" t)
(setq auto-mode-alist (cons '("\\.stk$" . ralee-mode) auto-mode-alist))


(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

;; MOINMOIN off
;;(require 'moinmoin-mode)
;;(autoload 'moinmoin-mode "moinmoin" nil t)
;;(setq auto-mode-alist (cons '("localhost\\." . moinmoin-mode) auto-mode-alist))
;; ***


;;(add-to-list 'auto-mode-alist '("\\.mm\\'" . moinmoin-mode))


(require 'auto-complete)
(global-auto-complete-mode t)

;----------------------------------------
; OFF
;(require 'doc-view)
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
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
