(setq org-capture-templates
      '(
        ("i" "inbox" entry
         (file "~/geekbook/notes/inbox.org")
         "* TODO %?\n  %i\n  %a")

        ("t" "Todo Life" entry
         (file+headline "~/geekbook/notes/life-curr.org" "#inbox")
         "* TODO %?\n  %i\n  %a")

        ("x" "Test" entry
         (file+headline "~/geekbook/notes/life-curr.org" "#inbox")
        "** TODO %^{Description} [why] %^{why} [why not] %^{why not}
  %?
  :LOGBOOK:
  - Added: %U
  :END:
  %a
")

        ("w" "Todo Work" entry (file+headline "~/iCloud/geekbook/notes/work-curr.org" "#inbox")
         "* TODO %?\n  %i\n  %a")
        ))

