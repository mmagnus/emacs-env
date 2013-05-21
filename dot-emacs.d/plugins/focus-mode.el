(defgroup focus nil
  "Distraction free mode."
  :group 'convinience)

(defcustom focus-working-area-width 640
  "Width of the working area of the frame."
  :type 'integer
  :group 'focus)

(defcustom focus-hide-faces '(mode-line
                              mode-line-inactive
                              mode-line-buffer-id
                              fringe)
  "List of faces to hide in the focus-mode."
  :type 'list
  :group 'focus)

;; Memory mechanism

(setq focus-memory nil)

(defun focus-remember (var val)
  (push `(,var ,val) focus-memory))

(defun focus-recall (var)
  (cadr (assoc var focus-memory)))

;; Hide-show mechanism

(defun symbol-postfix (sym postfix)
  (let ((symbol-name-string (symbol-name sym)))
    (intern (concat symbol-name-string "-" postfix))))

(defun focus-fringe-width ()
  (/ (- (frame-pixel-width)
        focus-working-area-width)
     2))

(defun focus-hide (face)
  (let ((default-background (face-attribute 'default :background)))

    (focus-remember (symbol-postfix face "foreground")
                    (face-attribute face :foreground))
    (focus-remember (symbol-postfix face "background")
                    (face-attribute face :background))
    (focus-remember (symbol-postfix face "box")
                    (face-attribute face :box))

    (set-face-attribute face nil :foreground default-background
                                 :background default-background
                                 :box nil)))

(defun focus-show (face)
  (let ((face-name-string (symbol-name face))
        (face-foreground nil)
        (face-background nil)
        (face-box nil))

    (setq face-foreground (focus-recall (symbol-postfix face "foreground")))
    (setq face-background (focus-recall (symbol-postfix face "background")))
    (setq face-box (focus-recall (symbol-postfix face "box")))

    (set-face-attribute face nil :foreground face-foreground
                                 :background face-background
                                 :box face-box)))


;; Entering and exiting mode.

(defun focus-enter ()
  ;; Hide everything from hide-faces
  (mapc 'focus-hide focus-hide-faces)
  ;; Set fringes
  (focus-remember 'left-fringe-width left-fringe-width)
  (focus-remember 'right-fringe-width right-fringe-width)
  (set-fringe-style `(,(focus-fringe-width) . ,(focus-fringe-width)))
  ;; Enable auto-fill-mode if not running
  (if auto-fill-function
      (focus-remember 'auto-fill-mode-enabled-by-user t)
    (auto-fill-mode 1))
  ;; Mark mode as running.
  (focus-remember 'focus-running t))


(defun focus-leave ()
  (tabbar-mode 1)
  (menu-bar-mode 1)
  (setq mode-line-format 1)
  ;; Show everything from show-faces
  (mapc 'focus-show focus-hide-faces)
  ;; Set fringes
  (set-fringe-style `(,(focus-recall 'left-fringe-width) .
                      ,(focus-recall 'right-fringe-width)))
  ;; Disable auto-fill-mode if it was not started by user.
  (if (focus-recall 'auto-fill-mode-enabled-by-user)
      nil
    (auto-fill-mode -1))
  ;; Clean memory.
  (setq focus-memory nil))

(defun focus-mode ()
  (interactive)
  (tabbar-mode -1)
  (menu-bar-mode -1)
  ;;(setq mode-line-format nil) ;; nie wiem jak to włączyć na nowo!
  ;;(narrow-to-region) ;; nie dziala
  (cond ((focus-recall 'focus-running)
         (focus-leave)
         (message "Focus mode disabled"))
        (t
         (focus-enter)
         (message "Focus mode enabled"))))

(provide 'focus-mode)
