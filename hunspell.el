;; trying to get the dictionary
(add-to-list 'ispell-local-dictionary-alist
     '("pl"
        "[a-zA-Z]"
        "[^a-zA-Z]"
        "[']"
        nil
        ("-d" "pl")
        nil
        utf-8))

(add-to-list 'ispell-local-dictionary-alist
     '("en_US"
        "[a-zA-Z]"
        "[^a-zA-Z]"
        "[']"
        nil
        ("-d" "en_US")
        nil
        utf-8))

(with-eval-after-load "ispell"
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "pl")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,pl"))
;; end



(add-to-list 'ispell-local-dictionary-alist '("pl-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "pl"); Dictionary file name
                                              nil
                                              utf-8))

(add-to-list 'ispell-local-dictionary-alist '("english-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "en_US")
                                              nil
                                              utf-8))


(with-eval-after-load "ispell"
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_US,pl")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,pl"))
