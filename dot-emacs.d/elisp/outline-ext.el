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

(setq outline-show-only-headings 1)
(defun python-outline () (interactive)
  "Python outline mode"
  (python-mode)
					;(outline-setup "^class \\|[ 	]*def \\|[ 	]*\"\"\".*\"\"\"\\|^ *#") ;; works for full comments
  ;(outline-setup "^class \\|[ 	]*def \\|[ 	]*\"\"\".*\"\"\"\\|^[ 	]*#")
  (outline-setup "^class \\|[ 	]*def \\|[ 	]*\"\"\"");.*\"\"\"\n") ;; with the second part is only lines with """xxx"""

  ;(outline-setup "^class")
  ;(outline-regexp " *\\(def \\|clas\\|#hea\\)")
  ;(outline-regexp "\"\"\".*\"\"\"") ; ###\\*+\\|\\`")
;  (outline-regexp "^.+#")
  )
  ;(outline-setup "^class |^[ ]*#\\|^[ 	]*\"\"\"$"))

(defun texi-outline () (interactive)
  "Texinfo outline mode"
  (texinfo-mode)

;;   The expression "^@chap\\|@\\(sub\\)*section" is a regular expression, often used in text processing and pattern matching to search for specific patterns within a larger text. Let's break down this regular expression step by step:

;; 1. "^": This symbol at the beginning of the expression signifies the start of a line. It matches the position at the start of a line.

;; 2. "@chap": This part of the expression matches the exact string "@chap." It's looking for occurrences of "@chap" in the text.

;; 3. "\\|": This is an OR operator in the regular expression. It allows you to search for multiple patterns. In this case, it separates two patterns.

;; 4. "@": This matches the character "@".

;; 5. "\\(sub\\)*": This part of the expression is using parentheses to group "sub" and the asterisk "*" after it indicates that the "sub" can appear zero or more times consecutively. So, it's looking for "sub," "subsub," "subsubsub," etc.

;; 6. "section": This part matches the exact string "section."

;; Putting it all together:
;; - "^@chap" matches lines that start with "@chap."
;; - "@\\(sub\\)*section" matches lines that contain "@section," "@subsection," "@subsubsection," and so on.

;; In summary, the regular expression "^@chap\\|@\\(sub\\)*section" is used to find lines in text that start with "@chap" or contain any level of section headings that start with "@section," "@subsection," "@subsubsection," and so forth. It's a versatile pattern for matching chapter and section headers in a document or code.

  (outline-setup "^@chap\\|@\\(sub\\)*section"))

(message "outline-ext.el loaded...")
