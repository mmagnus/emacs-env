;;; anki.el --- an emacs interface for anki/emacs.py

;; Copyright (C) 2006  Damien Elmes <emacs@repose.cx>

;; Author: Damien Elmes <damien@repose.cx>
;; Keywords: flashcard

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;;; Code:

;; User vars

(defvar anki-path "/home/resolve/Lib/code/libanki"
  "*The path to the anki library directory.")

(defvar anki-server-cmd "from anki.emacs import Server; Server().mainLoop()"
  "*The command to start the server.")

(defvar anki-default-lang 'en
  "*The default interface language to use.
Currently `en' and `ja' are supported.")

(defvar anki-target-lang 'ja
  "*The language you want to learn.
Currently `en' and `ja' are supported.")

(defvar anki-sync-username nil
  "*A username to use when synchronizing a deck.
If nil, disable server synchronizing.")

(defvar anki-sync-password nil
  "*A password to use when synchronizing a deck.")

(defvar anki-sync-on-load nil
  "*Sync the deck when opening.")

(defvar anki-sync-on-load nil
  "*Sync the deck when saving.")

(defvar anki-sync-on-close nil
  "*Sync the deck when closing.")

(defvar anki-debug-startup nil
  "Echo startup to the buffer instead of the filter.")

(defface anki-question-face '((t (:foreground "#ffffaa"
                                             :height 1.5)))
  "The face to use for questions.")

(defface anki-answer-face '((t (:foreground "#ff9999"
                                                 :height 1.5)))
  "The face to use for answers.")

(defface anki-answered-face '((t (:foreground "#ccccff"
                                :height 1.5)))
  "The face to show the previous answer in.")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.fc\\'" . anki-mode))

;; Internal vars

(defvar anki-buffer-name "*anki*")
(defvar anki-server-process-name "anki-server")
(defvar anki-command-response nil)
(defvar anki-command-response-pending nil)
(defvar anki-current-card nil)
(defvar anki-parent-buffer nil
  "Stores the location of the parent buffer when in edit mode.")
(make-variable-buffer-local 'anki-parent-buffer)

(defun anki-input-english ()
  "Turn on English input mode.
Redefine this if you want.")

(defun anki-input-japanese ()
  "Turn on Japanese input mode.
Redefine this if you want.")

;; Buffer/mode related
;; -------------------------------------------------------------------

(defconst anki-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map text-mode-map)
    (define-key map (kbd "RET") 'anki-show-answer)
    (define-key map (kbd "<f7>") 'anki-add-entry)
    (define-key map (kbd "<f8>") 'anki-edit-current-deck)
    map))

;;;###autoload
(defun anki-mode ()
  "Major mode for accessing the python anki backend.
You shouldn't run this directly, but instead have a load hook
set up for .fc files."
  (interactive)
  (kill-all-local-variables)
  (set-buffer-multibyte t)
  (setq anki-current-card nil)
  (setq major-mode 'anki-mode
        mode-name "Anki")
  (use-local-map anki-mode-map)
  (if (featurep 'xemacs)
      (add-hook 'write-file-data-hooks  'anki-save)
    (add-hook 'write-contents-hooks 'anki-save))
  (widen)
  (delete-region (point-min) (point-max))
  (set-buffer-modified-p nil)
  (setq header-line-format anki-header-line-format)
  ;; Auto-save is not useful when the data is stored externally. We
  ;; handle incremental saving by ourselves.
  (auto-save-mode -1)
  ;; Init the backend
  (anki-ensure-server)
  (if (file-exists-p buffer-file-name)
      (anki-backend-set-deck buffer-file-name)
    (anki-backend-new-deck buffer-file-name))
  ;; Maybe sync and ask
  (if anki-sync-on-load
    (anki-sync-current-deck)
    ;; Just start asking questions
    (anki-ask)))

(defun anki-ask (&optional top-msg)
  (let ((modified (buffer-modified-p))
        res)
    (delete-region (point-min) (point-max))
    (insert "\n")
    ;; get a new card, but only update last-card if we're asking a new
    ;; question
    (setq res (anki-backend-get-card))
    (setq anki-last-card anki-current-card)
    (cond
     ((eq (car res) 'deckEmpty)
      (anki-report-deck-empty))
     ((eq (car res) 'noCardsAvailable)
      (anki-report-deck-finished (cdr res)))
     (t
      (anki-report-next-card res)))
    (set-buffer-modified-p modified)))

(defun anki-report-next-card (card)
  (setq anki-current-card (anki-backend-get-card))
  (anki-show-last-card)
  (when top-msg
    (insert top-msg "\n"))
  (anki-show-stats)
  (insert "----------------------------------")
  (insert "----------------------------------\n\n")
  (insert anki-question-prompt
          (propertize (anki-get-key 'question anki-current-card)
                      'face 'anki-question-face) "\n\n"))

(defun anki-report-deck-empty ()
  (insert anki-message-empty))

(defun anki-report-deck-finished (str)
  (insert anki-message-finished))

(defun anki-show-last-card ()
  (when (and anki-last-card
             (not (equal anki-last-card anki-current-card)))
    (insert (propertize
             (format "%s = %s\n"
                     (anki-get-key 'question anki-last-card)
                     (anki-get-key 'answer anki-last-card))
             'face 'anki-answered-face))))

(defun anki-show-answer ()
  (interactive)
  (when anki-current-card
    (insert anki-answer-prompt
            (propertize
             (anki-get-key 'answer anki-current-card)
             'face 'anki-answer-face))
    (let* ((quality (anki-get-answer-quality))
           (days (anki-backend-answer-card quality)))
      (if (= days 0)
          ;; FIXME: i18n
          (setq days "Scheduling for 10 minutes")
        (setq days (format "Scheduling for %0.1f days from now." days)))
      (anki-ask days))))

(defun anki-get-answer-quality ()
  (insert (format anki-quality-prompt
                  (anki-get-key 'int2 anki-current-card)
                  (anki-get-key 'int3 anki-current-card)
                  (anki-get-key 'int4 anki-current-card)))
  (let (char)
    (while (not char)
      (setq char
            (read-char-exclusive "Quality of your answer (0-4): "))
      (if (and (>= char 48) (<= char 52))
          (setq char (- char 48))
        (setq char nil)))
    char))

(defun anki-show-stats ()
  (let* ((stats (anki-backend-get-stats))
         (incorrect (nth 0 stats))
         (correct (nth 1 stats))
         (pending (nth 2 stats))
         (total (+ incorrect correct))
         (perc-correct (* 100 (/ correct (float total))))
         (perc-incorrect (* 100 (/ incorrect (float total)))))
    (insert (format anki-tally-display
                    correct perc-correct
                    incorrect perc-incorrect
                    total
                    pending))))

(defun anki-save ()
  (anki-backend-save-deck)
  (set-buffer-modified-p nil)
  (clear-visited-file-modtime)
  t)

(defun anki-sync-current-deck ()
  "Sync the current deck with the server.
We don't fail, but rather show a message if something goes wrong -
this allows the deck to continue loading."
  (interactive)
  (message "Syncing with server..")
  (when (or (string= anki-sync-username "")
            (string= anki-sync-password ""))
    (error "Please set both a username and password."))
  (let ((res (anki-backend-sync-deck
              anki-sync-username
              anki-sync-password)))
    (if (eq (car res) 'error)
        (cond
         ((string= (cdr res) "invalidUser")
          (message "The current user/pass appears to be invalid."))
         ((string= (cdr res) "invalidDeck")
          (message "The current deck isn't registered on the server."))
         (t (message "Unknown error while syncing..")))
      (message (concat "Syncing with server.. done. localChange %d localDel %d "
                       "remoteChange %d remoteDel %d")
               (nth 0 res) (nth 1 res) (nth 2 res) (nth 3 res))
      (clear-visited-file-modtime)
      (set-buffer-modified-p nil)
      (anki-ask))))

;; FIXME: i18nize, support furigana entry
(defun anki-add-entry ()
  "Add cards to the deck."
  (interactive)
  (let* (question answer both)
    (anki-input-japanese)
    (setq question (read-string "Question: "))
    (anki-input-english)
    (setq answer (read-string "Answer: "))
    (setq both (anki-backend-add-card question answer anki-target-lang))
    (set-buffer-modified-p t)
    (message "Added cards: %s" both)))

;; Editing the deck
;; -------------------------------------------------------------------

;; FIXME: only used for checking for duplicates - this should be done
;; by making this buffer local in the parent's buffer.
(defvar anki-edit-buffer nil
  "The buffer used for editing.")

(defvar anki-edit-buffer-name "*anki edit*"
  "The name of the buffer used for editing.")

(defface anki-edit-number-face '((t (:foreground "#999999")))
  "A face for the card number.")

(defface anki-edit-changed-face '((t (:foreground "#ff7777")))
  "A face for changed cards.")

(defface anki-edit-answer-face '((t (:foreground "#ff9999")))
  "A face for the card answer.")

(defface anki-edit-question-face '((t (:foreground "#aaaaff")))
  "A face for the card answer.")

(defvar anki-edit-match-string
  "^\\(.*?\\) \\(.*\\) : \\(.*\\)$"
  "A regexp denoting the format of a card.")

(defconst anki-edit-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map text-mode-map)
    (define-key map (kbd ":") 'ignore)
    (define-key map (kbd "C-c C-k") 'anki-edit-delete-line)
    (define-key map (kbd "C-x C-s") 'anki-edit-save-and-close)
    map))

(defun anki-edit-init ()
  "Init anki-mode, and switch to the buffer."
  (unless (eq major-mode 'anki-mode)
    (error "Current buffer is not a anki deck!"))
  (when (and anki-edit-buffer
             (buffer-live-p anki-edit-buffer))
    (when (with-current-buffer anki-edit-buffer
            (buffer-modified-p))
      (switch-to-buffer anki-edit-buffer)
      (error "An edit buffer already exists! Please save first.")))
  (let ((parent (current-buffer)))
    (switch-to-buffer (get-buffer-create anki-edit-buffer-name))
    (setq anki-parent-buffer parent))
  (let ((inhibit-read-only t))
    (delete-region (point-min) (point-max)))
  (setq major-mode 'anki-edit-mode
        mode-name "Anki-Edit")
  (setq buffer-file-name "/anki-edit")
  (add-hook 'write-contents-hooks 'anki-edit-save)
  (use-local-map anki-edit-mode-map))

(defun anki-edit-ensure-edit-buffer ()
  (unless (eq major-mode 'anki-edit-mode)
    (error "Not in a anki-edit buffer!")))

(defun anki-edit-deinit ()
  "Remove the buffer and return to anki."
  (setq anki-edit-buffer nil)
  (let ((parent anki-parent-buffer))
    (kill-buffer (current-buffer))
    (switch-to-buffer parent)))

(defun anki-edit-current-deck ()
  "Use the current deck to begin an editing session."
  (interactive)
  (anki-edit-init)
  (anki-edit-render-lines (anki-backend-get-cards))
  (add-hook 'after-change-functions 'anki-edit-notice-changes nil t))

(defun anki-edit-render-lines (cards)
  "Draw a line for each entry in the deck."
  (let ((num 0))
    (let ((inhibit-read-only t))
      (dolist (card cards)
        (insert (format "%05d " num))
        (setq num (1+ num))
        ;; we'll store all the card properties on this
        (set-text-properties
         (point-at-bol) (point)
         (list 'front-sticky t
               'rear-nonsticky t
               'face 'anki-edit-number-face
               'read-only t
               'modified nil
               'id (anki-get-key 'id card)))
        (insert (propertize (anki-get-key 'question card)
                            'face 'anki-edit-question-face
                            'front-sticky t))
        (insert (propertize " :" 'read-only t
                            'face 'anki-edit-number-face
                            'rear-nonsticky nil))
        ;; be careful to set the text properties so that the user
        ;; can't delete areas they shouldn't
        (insert (propertize " " 'read-only t
                            'face 'anki-edit-number-face
                            'rear-nonsticky t))
        (insert (propertize (anki-get-key 'answer card)
                            'face 'anki-edit-answer-face
                            'front-sticky t))
        (insert (propertize "\n" 'read-only t)))))
  ;; when finished, mark the buffer as unmodified
  (set-buffer-modified-p nil)
  ;; and don't let them undelete the initial insertion
  (setq buffer-undo-list nil)
  (goto-char (point-min)))

(defun anki-edit-notice-changes (beg end len)
  (save-excursion
    (goto-char (point-at-bol))
    (let ((p (point))
          (inhibit-read-only t))
      (forward-word)
      (add-text-properties p (point)
                           (list 'face 'anki-edit-changed-face
                                 'modified t 'type 'changed)))))

(defun anki-edit-get-changed-cards ()
  (save-excursion
    (let ((cards nil))
      (goto-char (point-min))
      (while (re-search-forward anki-edit-match-string nil t)
        (when (eq (get-text-property
                   (match-beginning 0) 'modified) t)
          (setq cards (cons (anki-edit-matched-card) cards))))
      cards)))

(defun anki-edit-matched-card ()
  "Return the next card found by anki-edit-match-string."
  (let* ((question (match-string 2))
         (answer (match-string 3))
         (number (match-string 1))
         (id (get-text-property 0 'id number))
         (type (get-text-property 0 'type number)))
    (set-text-properties 0 (length question) nil question)
    (set-text-properties 0 (length answer) nil answer)
    `((id . ,id)
      (question . ,question)
      (answer . ,answer)
      (type . ,(symbol-name type)))))

(defun anki-edit-save-and-close ()
  (interactive)
  (let ((out (anki-edit-save)))
    (anki-edit-deinit)
    (set-buffer-modified-p t)
    (message "Deck updated but not saved. %s"
             out)
    (anki-ask)))

(defun anki-edit-save ()
  (interactive)
  (let ((mods (anki-edit-get-changed-cards))
        changed deleted)
    (dolist (card mods)
      (if (string= (anki-get-key 'type card) "deleted")
          (setq deleted (cons (anki-get-key 'id card) deleted))
        (setq changed (cons card changed))))
    (dolist (card changed)
      (anki-backend-edit-card card))
    (dolist (id deleted)
      (anki-backend-delete-card id))
    (set-buffer-modified-p nil)
    (format "%d cards deleted, %d changed"
            (length deleted) (length changed))))

(defun anki-edit-delete-line ()
  "Delete the current line."
  (interactive)
  (anki-edit-ensure-edit-buffer)
  (save-excursion
    (goto-char (point-at-bol))
    (let ((p (point))
          (inhibit-read-only t)
          (inhibit-modification-hooks t)
          (old-props (text-properties-at (point))))
      (delete-char 5)
      (insert "<del>")
      (add-text-properties p (point)
                           (append
                            old-props
                            (list 'face 'anki-edit-changed-face
                                  'modified t 'type 'deleted))))))

;; Interfacing with the backend
;; -------------------------------------------------------------------

(defun anki-get-key (key list)
  (cdr (assq key list)))

(defun anki-ensure-server ()
  (unless (anki-process-live-p)
      (start-process anki-server-process-name
                     (current-buffer)
                     "python"
                     "-c"
                     (concat "import sys; sys.path.append(\""
                             anki-path
                             "\"); "
                             anki-server-cmd))
      (set-process-coding-system
       (anki-get-proc) 'utf-8 'utf-8)
      (unless anki-debug-startup
        (set-process-filter
         (anki-get-proc) 'anki-process-filter)))
  t)

(defun anki-process-filter (process str)
  "Accumulate data and place in `anki-command-response' after \\n"
  (if (string-match "\n" str)
      (if anki-command-response-pending
          (progn (setq anki-command-response
                       (concat anki-command-response-pending str))
                 (setq anki-command-response-pending nil))
        (setq anki-command-response str))
    (if anki-command-response-pending
        (setq anki-command-response-pending
              (concat anki-command-response-pending str))
      (setq anki-command-response-pending str))))

(defun anki-send-cmd (cmd &optional args)
  "Send a command. All arguments must be strings."
  (let ((arg-str "")
        final-str)
    (dolist (item args)
      (setq arg-str
            (concat arg-str
                    (format "\"%S\": %S,"
                            (car item) (cdr item)))))
    (when args
      (setq arg-str (concat " {" arg-str "}")))
    (setq anki-command-response nil)
    (setq final-str (concat (symbol-name cmd) arg-str "\n"))
    ;;(message "final str = %S" final-str)
    (process-send-string
     (anki-get-proc) final-str)
    ;; loop until the filter puts a full string in
    (while (and
            (accept-process-output
             (anki-get-proc) 30 0 t)
            (not anki-command-response)))
    ;; return the processed full response
    (anki-process-response anki-command-response)))

(defun anki-process-response (str)
  (read str))

(defun anki-process-live-p ()
  (and (anki-get-proc)
       (eq (process-status
            (anki-get-proc)) 'run)))

(defun anki-status-ok-p (res)
  (string= (anki-get-key 'status res) "OK"))

(defun anki-error (res)
  (let ((status (anki-get-key 'status res)))
    (if (string= status "unhandledException")
        (error "An unhandled exception occurred in the backend: %S"
               (anki-get-key 'exception res))
      (error (format "An error occurred. Backend says: %s" status)))))

(defun anki-get-proc ()
  "Return the process for the current buffer."
  (if (eq major-mode 'anki-mode)
      (get-buffer-process (current-buffer))
    (get-buffer-process anki-parent-buffer)))

;; Backend commands
;; -------------------------------------------------------------------

;; (defun anki-backend-modified-p ()
;;   (let ((res (anki-send-cmd 'deckModified)))
;;     (string= (anki-get-key 'status res) "modified")))

(defun anki-backend-set-deck (path)
  (let ((res (anki-send-cmd 'setDeck `((deck . ,path)))))
    (if (anki-status-ok-p res)
        (setq anki-current-deck path)
      (anki-error res))))

(defun anki-backend-get-card ()
  (let ((res (anki-send-cmd 'getCard)))
    (cond
     ((anki-status-ok-p res)
      res)
     ((string= (anki-get-key 'status res) "deckEmpty")
      (cons 'deckEmpty nil))
     ((string= (anki-get-key 'status res) "noCardsAvailable")
      (cons 'noCardsAvailable (anki-get-key 'nextCard res)))
     (t (anki-error res)))))

(defun anki-backend-answer-card (quality)
  (let* ((id (anki-get-key 'id anki-current-card))
         (res (anki-send-cmd
               'answerCard
               `((id . ,id)
                 (quality . ,(number-to-string quality))))))
    (if (not (anki-status-ok-p res))
        (anki-error res)
      (string-to-number (anki-get-key 'days res)))))

(defun anki-backend-get-stats ()
  "Return incorrect, correct, pending."
  (let ((stats (anki-send-cmd 'getStats)))
    (unless (anki-status-ok-p stats)
      (anki-error stats))
    (list
     (string-to-number (anki-get-key 'sNoTotal stats))
     (string-to-number (anki-get-key 'sYesTotal stats))
     (string-to-number (anki-get-key 'pending stats)))))

(defun anki-backend-add-card (question answer lang)
  "Add a card."
  (let ((res (anki-send-cmd 'addCards
                           `((question . ,question)
                             (answer . ,answer)
                             (lang . ,(symbol-name lang))))))
    (unless (anki-status-ok-p res)
      (anki-error res))
    (concat (anki-get-key 'question res) " = "
            (anki-get-key 'answer res))))

(defun anki-backend-delete-card (id)
  "Delete card with ID."
  (let ((res (anki-send-cmd 'deleteCard `((id . ,id)))))
    (unless (anki-status-ok-p res)
      (anki-error res))))

(defun anki-backend-edit-card (props)
  "Update card with PROPS.
PROPS should include a card ID."
  (let ((res (anki-send-cmd 'editCard props)))
    (unless (anki-status-ok-p res)
      (anki-error res))))

;; this is a bit slow on huge decks, but we can optimise later
(defun anki-backend-get-cards ()
  "Get all cards from deck."
  (let ((res (anki-send-cmd 'getCards)))
    (unless (anki-status-ok-p res)
      (anki-error res))
    ;; cut out the status message
    (cdr res)))

(defun anki-backend-save-deck ()
  (let ((res (anki-send-cmd 'saveDeck)))
    (unless (anki-status-ok-p res)
      (anki-error res))))

(defun anki-backend-new-deck (path)
  "Create a new deck, making it current."
  (let ((res (anki-send-cmd 'createDeck `((path . ,path)))))
    (unless (anki-status-ok-p res)
      (anki-error res))))

(defun anki-backend-sync-deck (user pass)
  "Sync a deck. Return 'error in car of cons if there's a problem.."
  (let ((res (anki-send-cmd 'syncDeck `((username . ,user)
                                       (password . ,pass)))))
    (if (anki-status-ok-p res)
        (list (string-to-number (anki-get-key 'locallyChanged res))
              (string-to-number (anki-get-key 'locallyDeleted res))
              (string-to-number (anki-get-key 'remotelyChanged res))
              (string-to-number (anki-get-key 'remotelyDeleted res)))
      (cons 'error (anki-get-key 'status res)))))

;; Translations
;; -------------------------------------------------------------------

(defun anki-lang-ja ()
  (interactive)
  (setq anki-question-prompt
        "次の単語または表現を訳したら[Enter]を押してください。\n\n")
  (setq anki-answer-prompt "正解は ")
  (setq anki-quality-prompt
        "\n\nどのぐらい覚えていましたか。下から数字を選んでください。

0: 全然覚えてない
1: 忘れてしまった
2: 忘れるところだった         %s
3: 集中したら思い出した		%s
4: すぐ思い出した			%s\n")
  (setq anki-tally-display
        (concat
         "今回は 正解: %d (%.1f%%), 間違い: %d (%.1f%%), "
         "全て: %d, 残り: %d+\n"))
  (setq anki-header-line-format
        (concat "[F7] 新しい単語や表現を入力する "
                "[F8] 登録された単語を編集する "))

  ;; change anki messages
  (setq anki-edit-header-line-format
        "[Ctrl+c Ctrl+k] 指定した行を消去 [F9] 保存する")
  (setq anki-message-empty
        "単語が登録されていません。[F7]を押して単語を入力してください。
入力したら[F9]を押すとテストが始まります。\n\n")
  (setq anki-message-finished
        "おめでとうございます！現在練習する単語や表現はありません。
新しい単語や表現を入力するかまた明日来てください。\n\n"))

(defun anki-lang-en ()
  (interactive)
  (setq anki-question-prompt
        (concat "Say the answer to the following question, "
                "then press enter.\n\n"))
  (setq anki-answer-prompt "The answer: ")
  (setq anki-quality-prompt
        "\n\nHow well did you remember? Please choose a number.

0: Didn't remember at all
1: Only remembered only a little
2: About to forget                      %s
3: Remembered after thinking            %s
4: Remembered easily              		%s\n")
  (setq anki-tally-display
        (concat
         "Correct: %d (%.1f%%), Incorrect: %d (%.1f%%), "
         "Total: %d, Remaining: %d+\n"))
  (setq anki-header-line-format
        (concat "[F7] Add a new card "
                "[F8] Edit the card deck "))

  ;; change anki messages
  (setq anki-edit-header-line-format
        "[Ctrl+c Ctrl+k] Delete current line [F9] Save")
  (setq anki-message-empty
        "No cards have been created. Press [F7] to add a new card.
After you've added a new card, the test will begin automatically.")
  (setq anki-message-finished
        "Congratulations! You have finished for now. Please add
a new card, or come back tomorrow."))

;; default to English
(cond
 ((eq anki-default-lang 'en)
  (anki-lang-en))
 ((eq anki-default-lang 'ja)
  (anki-lang-ja))
 (t (error "Invalid language!")))

(provide 'anki)
;;; anki.el ends here
