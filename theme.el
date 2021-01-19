(set-face-attribute 'default nil :font "iA Writer Mono S 15")
(set-cursor-color "#00ccff")
(setq left-margin 10)
(global-set-key "\C-cf" 'font-lock-mode)

;; https://emacs.stackexchange.com/questions/16545/make-names-of-major-modes-shorter-in-the-mode-line
(setq
 cyphejor-rules
 '(:upcase
   ("bookmark"    "→")
   ("buffer"      "β")
   ("diff"        "Δ")
   ("dired"       "δ")
   ("emacs"       "ε")
   ("fundamental" "Ⓕ")
   ("projectile"  "P" :prefix)
   ("inferior"    "i" :prefix)
   ("interaction" "i" :prefix)
   ("interactive" "i" :prefix)
   ("lisp"        "λ" :postfix)
   ("menu"        "▤" :postfix)
   ("mode"        "")
   ("package"     "↓")
   ("python"      "π")
   ("shell"       "sh" :postfix)
   ("text"        "ξ")
   ("FlyC"        "FC")
   ("eldoc"        "Doc" :prefix)
   ("Git:master"        "master")
   ("wdired"      "↯δ")))
(cyphejor-mode 1)
;; 
(require 'modeline-posn)
;;
(size-indication-mode 0)
