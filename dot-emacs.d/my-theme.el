;; @THEME --------------------------------------------------------------------
(require 'hipster-theme) ;; should be before powerline, otherwise it seems that it overwrites powerline
;; http://stackoverflow.com/questions/4821984/emacs-osx-default-font-setting-does-not-persist


;; powerline
(require 'cl)
(require 'powerline)
(powerline-default-theme)
(set-face-attribute 'mode-line nil
                      :foreground "Black"
                      :background "DarkOrange"
                      :box nil)


;;https://stackoverflow.com/questions/4532024/different-color-themes-per-mode-in-emacs?rq=1
(defun w ()
       (interactive)
         (let ((color-theme-is-global nil))
	   (iimage-mode)
	   ;(set-cursor-color "#000")
	;   (load-theme-buffer-local 'whiteboard (current-buffer))
	   (load-theme-buffer-local 'github (current-buffer))
	   )
	 )

(defun b ()
       (interactive)
         (let ((color-theme-is-global nil))
          ;;(load-theme 'wombat t)
	  ;(set-cursor-color "#fff")
          (load-theme-buffer-local 'wombat (current-buffer))
          )
         )


(scroll-bar-mode -1)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
