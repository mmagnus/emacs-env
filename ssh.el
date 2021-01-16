(require 'tramp)
(setq tramp-default-method "ssh")
;; tramp
                                        ;(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;; compression https://oremacs.com/2015/10/23/dired-compress/
(defvar dired-compress-files-alist
  '(("\\.tar\\.gz\\'" . "tar -c %i | gzip -c9 > %o")
    ("\\.zip\\'" . "zip %o -r --filesync %i"))
  "Control the compression shell command for `dired-do-compress-to'.

Each element is (REGEXP . CMD), where REGEXP is the name of the
archive to which you want to compress, and CMD the the
corresponding command.

Within CMD, %i denotes the input file(s), and %o denotes the
output file. %i path(s) are relative, while %o is absolute.")

