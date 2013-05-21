;;color-theme 
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-tty-dark)


;;dark-room
(defun switch-full-screen (&optional ii)
   (interactive "p")
  (if (> ii 0)
      (shell-command "wmctrl -r :ACTIVE: -badd,fullscreen"))
  (if (< ii 0)
      (shell-command "wmctrl -r :ACTIVE: -bremove,fullscreen"))
  (if (equal ii 0)
      (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen")))


(defun darkroom-mode ()
	"Make things simple-looking by removing decoration 
	 and choosing a simple theme."
        (interactive)
        ;;(switch-full-screen 1)     ;; requires above function ;; wykomentowałem to bo nie mma wmctrl z góry
	(color-theme-retro-green)  ;; requires color-theme
        (setq left-margin 20)
        (menu-bar-mode -1)
        (tool-bar-mode -1)
        (scroll-bar-mode -1)
        (set-face-foreground 'mode-line "gray15")
        (set-face-background 'mode-line "black")
        (auto-fill-mode 1))

(put 'narrow-to-region 'disabled nil)
