;; markdown: drag and drop; but not always this is what I want
(defun dnd ()
  "Turn on markdown-dnd-images, and turn on on demand.
  It's not perfect when it's on because
  I can't move files to the cluster and virtual machines"
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/plugins/markdown-dnd-images")
  (require 'markdown-dnd-images)
  (add-hook 'markdown-mode-hook 'flyspell-mode)
)

; off opening html
(setq dnd-protocol-alist nil)
; https://emacs.stackexchange.com/questions/54453/dont-open-a-html-link-if-drag-and-dropped-to-emacs
(setq dnd-protocol-alist '(
                           ("^file:///.*.py" . dnd-open-local-file)
      )
      )

