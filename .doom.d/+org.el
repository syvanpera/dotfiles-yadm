;;; ~/dotfiles/emacs/doom.d/+org.el -*- lexical-binding: t; -*-

(defun ts/org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))

(defun ts/new-daily-review ()
  (interactive)
  (let ((org-capture-templates '(("d" "Review: Daily Review" entry (file+olp+datetree "/tmp/reviews.org")
                                  (file "templates/dailyreview.org")))))
    (progn
      (org-capture nil "d")
      (org-capture-finalize t)
      (org-speed-move-safe 'outline-up-heading)
      (org-narrow-to-subtree)
      (fetch-calendar)
      (org-clock-in))))

(defun ts/new-weekly-review ()
  (interactive)
  (let ((org-capture-templates '(("w" "Review: Weekly Review" entry (file+olp+datetree "/tmp/reviews.org")
                                  (file "templates/weeklyreview.org")))))
    (progn
      (org-capture nil "w")
      (org-capture-finalize t)
      (org-speed-move-safe 'outline-up-heading)
      (org-narrow-to-subtree)
      (fetch-calendar)
      (org-clock-in))))

(defun ts/new-monthly-review ()
  (interactive)
  (let ((org-capture-templates '(("m" "Review: Monthly Review" entry (file+olp+datetree "/tmp/reviews.org")
                                  (file "templates/monthlyreview.org")))))
    (progn
      (org-capture nil "m")
      (org-capture-finalize t)
      (org-speed-move-safe 'outline-up-heading)
      (org-narrow-to-subtree)
      (fetch-calendar)
      (org-clock-in))))

(defun ts/org-hugo-new-subtree-post-capture-template ()
  "Returns `org-capture' template string for new Hugo post."
  (let* ((title (read-from-minibuffer "Post Title: "))
         (fname (org-hugo-slug title)))
    (mapconcat #'identity
               `(
                 ,(concat "** TODO " title)
                 ":PROPERTIES:"
                 ,(concat ":EXPORT_FILE_NAME: " fname)
                 ":END:"
                 "%?\n")
               "\n")))

;; (after! org
;;   (require 'org-gtasks)
;;   (load-file "~/.emacs-secrets.el")
;;   (org-gtasks-register-account :name "Gmail"
;;                                :directory "~/org/gtasks/"
;;                                :client-id org-gtasks-client-id
;;                                :client-secret org-gtasks-client-secret))

(after! org
  (add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  ;; (require 'ob-elm)
  ;; (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
  ;; (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))
  ;; (set-pretty-symbols! 'org-mode
  ;;   :name "#+NAME:"
  ;;   :src_block "#+BEGIN_SRC"
  ;;   :src_block_end "#+END_SRC"
  ;;   :todo "TODO"
  ;;   :done "DONE")
  (setq +org-dir (expand-file-name "~/org/")
        org-directory (expand-file-name "~/org/")
        org-inbox-file (concat org-directory "todo.org")
        org-snippets-file (concat org-directory "snippets.org")
        +org-capture-todo-file "todo.org"
        +org-capture-notes-file "notes.org"
        org-agenda-files (mapcar(lambda (s) (concat org-directory s))
                                '("inbox.org" "todo.org" "tickler.org" "gcal"))
        ;; org-agenda-files '("~/org/inbox.org"
        ;;                    "~/org/todo.org"
        ;;                    "~/org/tickler.org")
        ;; org-refile-targets '(("~/org/todo.org" :maxlevel . 3)
        ;;                      ("~/org/someday.org" :level . 1)
        ;;                      ("~/org/tickler.org" :maxlevel . 2))
        ;; org-archive-location (concat (ts/org-file-path "archive.org") "::* From %s")
        org-pretty-entities t
        org-use-fast-todo-selection t
        org-treat-S-cursor-todo-selection-as-state-change t
        org-goto-interface 'outline-path-completion
        org-outline-path-complete-in-steps nil
        org-blank-before-new-entry '((heading . nil) (plain-list-item . nil))
        org-tags-column -80
        org-log-done 'time
        org-bullets-bullet-list '("●" "◉" "○" "✿" "✸")
        org-ellipsis " "
        org-tag-alist '(
                        ;; Context
                        (:startgroup)
                        ("@home" . ?h)
                        ("@work" . ?w)
                        ("@houston" . ?o)
                        ("@client" . ?c)
                        (:endgroup)
                        ("work" . ?W)
                        ("personal" . ?P)
                        )
        org-todo-keywords '((sequence "TODO(t)" "|" "DONE(d)")
                            (sequence "NEXT(n)" "WAITING(w)" "LATER(l)" "|" "CANCELLED(c)"))
        ;; DRAFT is for blog posts, used in blog org files
        org-todo-keyword-faces '(("DRAFT" . (:foreground "#fabd2f" :weight bold)))
        org-capture-templates '(("t" "Todo" entry
                                 (file +org-capture-todo-file)
                                 "* TODO %?\n%i\n%a" :prepend t :kill-buffer t)
                                ("n" "Note" entry
                                 (file +org-capture-notes-file)
                                 "* %u %?\n%i\n%a" :prepend t :kill-buffer t)
                                ("b" "Blog post" entry
                                 (file+olp "~/projects/personal/tiniblog/content-org/posts.org" "Posts")
                                 (function ts/org-hugo-new-subtree-post-capture-template))
                                ("ap" "Appointment : Personal" entry
                                 (file  "gcal/gmail.org")
                                 "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
                                ("ah" "Appointment : Houston" entry
                                 (file  "gcal/houston.org")
                                 "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")

                                ;; Will use {project-root}/{todo,notes,changelog}.org, unless a
                                ;; {todo,notes,changelog}.org file is found in a parent directory.
                                ;; Uses the basename from `+org-capture-todo-file',
                                ;; `+org-capture-changelog-file' and `+org-capture-notes-file'.
                                ("p" "Templates for projects")
                                ("pt" "Project: Todo" entry  ; {project-root}/todo.org
                                 (file +org-capture-project-todo-file)
                                 "* TODO %?\n%i\n%a" :prepend t :kill-buffer t)
                                ("pn" "Project: Note" entry  ; {project-root}/notes.org
                                 (file +org-capture-project-notes-file)
                                 "* %u %?\n%i\n%a" :prepend t :kill-buffer t)

                                ("p" "Templates for reviews")
                                ("rd" "Review: Daily Review" entry
                                 (file+olp+datetree "/tmp/reviews.org")
                                 (file "templates/dailyreview.org"))
                                ("rw" "Review: Weekly Review" entry
                                 (file+olp+datetree "/tmp/reviews.org")
                                 (file "templates/weeklyreview.org"))
                                ("rm" "Review: Monthly Review" entry
                                 (file+olp+datetree "/tmp/reviews.org")
                                 (file "templates/monthlyreview.org")))

        org-agenda-custom-commands '(("g" . "GTD contexts")
                                     ("gc" "Client" tags-todo "@client")
                                     ("gh" "Home" tags-todo "@home")
                                     ("go" "Houston" tags-todo "@houston")
                                     ("gw" "Work" tags-todo "@work")
                                     ("G" "GTD Block Agenda"
                                      ((tags-todo "@houston")
                                       (tags-todo "@home"))))
        )
  ;; org-capture-templates '(("t" "Task" entry
  ;;                         (file+headline "refile.org" "Tasks")
  ;;                         "* ☛ TODO %^{Task}\n"
  ;;                         :immediate-finish t :kill-buffer t)
  ;;                         ("n" "Note" entry
  ;;                         (file+headline +org-default-notes-file "Notes")
  ;;                         "* %?\n"
  ;;                         :immediate-finish t :kill-buffer t)
  ;;                         ("s" "Snippet" entry
  ;;                         (file+headline org-snippets-file "Snippets")
  ;;                         "* %^{Title}\t%^g\n#+BEGIN_SRC %^{Language|typescript|javascript|emacs-lisp}\n%i%?\n#+END_SRC\n")
  ;;                         ("e" "Emacs task" entry
  ;;                         (file+headline "emacs.org" "Tasks")
  ;;                         "* ☛ TODO %^{Task}\n\n"
  ;;                         :immediate-finish t :kill-buffer t))
  )

(map!
 (:prefix "C-c"
   :gnvime "i"       #'ts/open-org-inbox
   :gnvime "l"       #'org-store-link
   :gnvime "a"       #'org-agenda
   :gnvime "c"       #'org-capture
   :gnvime "b"       #'org-switchb)

 (:prefix "C-c r"
   :gnvime "d"       #'ts/new-daily-review
   :gnvime "w"       #'ts/new-weekly-review
   :gnvime "m"       #'ts/new-monthly-review)

 (:after org
   :map org-mode-map
   :nvime "M-h" #'org-metaleft
   :nvime "M-l" #'org-metaright
   :nvime "M-J" #'org-shiftmetadown
   :nvime "M-K" #'org-shiftmetaup
   :nvime "M-H" #'org-shiftmetaleft
   :nvime "M-L" #'org-shiftmetaright
   :nvime "C-j" #'evil-window-down
   :nvime "C-k" #'evil-window-up
   :nvime "C-c t l" #'org-toggle-link-display
   :nvme "L" #'org-shiftright
   :nvme "H" #'org-shiftleft
   ;; :nvme "K" #'org-shiftup
   ;; :nvme "J" #'org-shiftdown
   :nvime "s-<return>" #'org-meta-return

   :localleader
   "s" nil
   "t" nil
   "T" nil
   "d" nil
   "i" nil
   (:prefix ("s" . "subtrees")
     "a" #'org-toggle-archive-tag
     "A" #'org-archive-subtree
     "b" #'org-tree-to-indirect-buffer
     "h" #'org-promote-subtree
     "j" #'org-move-subtree-down
     "k" #'org-move-subtree-up
     "l" #'org-demote-subtree
     "n" #'org-narrow-to-subtree
     "N" #'widen
     "r" #'org-refile
     "s" #'org-sparse-tree
     "S" #'org-sort
     )
   (:prefix ("T" . "toggles")
     "c" #'org-toggle-checkbox
     "e" #'org-toggle-pretty-entities
     "i" #'org-toggle-inline-images
     "l" #'org-toggle-link-display
     "t" #'org-show-todo-tree
     "T" #'org-todo
     "h" #'org-toggle-heading
     )
   (:prefix ("d" . "time")
     "d" #'org-deadline
     "s" #'org-schedule
     "t" #'org-time-stamp
     "T" #'org-time-stamp-inactive
     )
   (:prefix ("t" . "tables")
     "a" #'org-table-align
     "b" #'org-table-blank-field
     "c" #'org-table-convert
     "dc" #'org-table-delete-column
     "dr" #'org-table-kill-row
     "e" #'org-table-eval-formula
     "E" #'org-table-export
     "h" #'org-table-previous-field
     "H" #'org-table-move-column-left
     "ic" #'org-table-insert-column
     "ih" #'org-table-insert-hline
     "iH" #'org-table-hline-and-move
     "ir" #'org-table-insert-row
     "I" #'org-table-import
     "j" #'org-table-next-row
     "J" #'org-table-move-row-down
     "K" #'org-table-move-row-up
     "l" #'org-table-next-field
     "L" #'org-table-move-column-right
     "n" #'org-table-create
     "N" #'org-table-create-with-table.el
     "r" #'org-table-recalculate
     "s" #'org-table-sort-lines
     "tf" #'org-table-toggle-formula-debugger
     "to" #'org-table-toggle-coordinate-overlays
     "w" #'org-table-wrap-region
     )
   (:prefix ("i" . "insertion")
     "b" #'org-insert-structure-template
     "d" #'org-insert-drawer
     "e" #'org-set-effort
     "f" #'org-footnote-new
     "h" #'org-insert-heading
     "H" #'org-insert-heading-after-current
     "i" #'org-insert-item
     "K" #'spacemacs/insert-keybinding-org
     "l" #'org-insert-link
     "n" #'org-add-note
     "p" #'org-set-property
     "s" #'org-insert-subheading
     "t" #'org-set-tags-command
     )
   )
 )
