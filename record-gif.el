
(load "/Users/magnus/workspace/emacs-env/dot-emacs.d/plugins/emacs-gif-screencast/gif-screencast.el")
(with-eval-after-load 'gif-screencast
  (define-key gif-screencast-mode-map (kbd "<f8>") 'gif-screencast-toggle-pause)
  (define-key gif-screencast-mode-map (kbd "<f9>") 'gif-screencast-stop))

