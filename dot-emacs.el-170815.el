;; https://github.com/iqbalansari/emacs-emojify
;(add-hook 'after-init-hook #'global-emojify-mode)


;; https://github.com/dimitri/el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


;; source https://github.com/wernerandrew/jedi-starter/blob/master/jedi-starter.el
;; https://www.youtube.com/watch?v=6BlTGPsjGJk
;(defvar local-packages '(projectile auto-complete epc jedi ido-vertical-mode))
;(defun uninstalled-packages (packages)
;  (delq nil
;        (mapcar (lambda (p) (if (package-installed-p p nil) nil p)) packages)))
;; This delightful bit adapted from:
;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
;(let ((need-to-install (uninstalled-packages local-packages)))
;  (when need-to-install
;    (progn
;      (package-refresh-contents)
;      (dolist (p need-to-install)
;	(package-install p)))))
;;;;;;


;; terminal
(global-set-key "\C-cm" 'ansi-term)
;; fix of missing tab completion http://stackoverflow.com/questions/18278310/emacs-ansi-term-not-tab-completing
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))


;; https://stackoverflow.com/questions/25433260/pylint-does-not-work-in-emacs
;; yep, indeed it fixed a problem with pylint!
(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)



(setq org-random-todo-how-often 1500)
(org-random-todo-mode 1)
(global-set-key "\C-c0" 'org-random-todo)


;; @darkroom
(defun darkroom-mode ()
	"Make things simple-looking by removing decoration
	 and choosing a simple theme."
        (interactive)
        ;(switch-full-screen 1)     ;; requires above function
	;(color-theme-retro-green)  ;; requires color-theme
        (setq left-margin 10)
        (menu-bar-mode -1)
        (tool-bar-mode -1)
        (scroll-bar-mode -1)
        (set-face-foreground 'mode-line "gray15")
        (set-face-background 'mode-line "black")
        (auto-fill-mode 1))


