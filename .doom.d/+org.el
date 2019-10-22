;;; ~/dotfiles/emacs/doom.d/+org.el -*- lexical-binding: t; -*-

(defun ts/org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))

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

(defun ts/new-daily-review ()
  (interactive)
  (let ((org-capture-templates '(("d" "Review: Daily Review" entry (file+olp+datetree "~/Sync/org/reviews.org" "Daily reviews")
                                  (file "~/Sync/org/templates/dailyreview.org")))))
    (progn
      (org-capture nil "d")
      (org-capture-finalize t)
      (org-speed-move-safe 'outline-up-heading)
      (org-narrow-to-subtree)
      (org-clock-in))))

(defun ts/new-weekly-review ()
  (interactive)
  (let ((org-capture-templates '(("w" "Review: Weekly Review" entry (file+olp+datetree "~/Sync/org/reviews.org" "Weekly reviews")
                                  (file "~/Sync/org/templates/weeklyreview.org")))))
    (progn
      (org-capture nil "w")
      (org-capture-finalize t)
      (org-speed-move-safe 'outline-up-heading)
      (org-narrow-to-subtree)
      (org-clock-in))))

(defun ts/new-monthly-review ()
  (interactive)
  (let ((org-capture-templates '(("m" "Review: Monthly Review" entry (file+olp+datetree "~/Sync/org/reviews.org" "Monthly reviews")
                                  (file "~/Sync/org/templates/monthlyreview.org")))))
    (progn
      (org-capture nil "m")
      (org-capture-finalize t)
      (org-speed-move-safe 'outline-up-heading)
      (org-narrow-to-subtree)
      (org-clock-in))))

(def-package! org-gcal
  :after org
  :commands (org-gcal-sync
             org-gcal-fetch
             org-gcal-post-at-point
             org-gcal-delete-at-point)
  :config
  (load-file "~/.emacs-secrets.el")
  ;; hack to avoid the deferred.el error
  (defun org-gcal--notify (title mes)
    (message "org-gcal::%s - %s" title mes)))

;; (def-package! org-super-agenda
;;   :after org-agenda
;;   :init
;;   (setq org-super-agenda-groups '((:name "Today"
;;                                          :time-grid t
;;                                          :scheduled today)
;;                                   (:name "Due today"
;;                                          :deadline today)
;;                                   (:name "Important"
;;                                          :priority "A")
;;                                   (:name "Overdue"
;;                                          :deadline past)
;;                                   (:name "Due soon"
;;                                          :deadline future)
;;                                   (:name "Work"
;;                                          :tag "WORK")))
;;   :config
;;   (org-super-agenda-mode))

(def-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("▲" "■" "▼")))

(after! org
  (add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (setq +org-dir (expand-file-name "~/Sync/org/")
        org-directory (expand-file-name "~/Sync/org/")
        +org-capture-todo-file "inbox.org"
        +org-capture-notes-file "notes.org"
        org-agenda-files (mapcar(lambda (s) (concat org-directory s))
                                '("inbox.org"
                                  "orgzly-inbox.org"
                                  "todo.org"
                                  "tickler.org"
                                  "reviews.org"
                                  "caverion.org"
                                  "houston.org"
                                  "workflow.org"))
        org-refile-use-outline-path 'file
        org-outline-path-complete-in-steps nil
        org-refile-allow-creating-parent-nodes 'confirm
        org-refile-targets '((nil :maxlevel . 2) (org-agenda-files :maxlevel . 2))
        org-archive-location "~/Sync/org/archive.org::* From %s"
        org-startup-folded 'content
        org-pretty-entities t
        org-use-fast-todo-selection t
        org-goto-interface 'outline-path-completion
        org-outline-path-complete-in-steps nil
        ;; org-blank-before-new-entry '((heading . nil) (plain-list-item . nil))
        org-tags-column -120
        org-agenda-tags-column -140
        org-agenda-dim-blocked-tasks t
        org-agenda-skip-scheduled-if-done t
        org-log-done 'time
        org-log-reschedule 'note
        org-log-into-drawer t
        org-log-state-notes-insert-after-drawers nil
        org-bullets-bullet-list '("⚙" "✿" "◉" "○" "✸")
        org-ellipsis " "
        org-tag-alist '(;; Context
                        ("COMPUTER" . ?c)
                        ("PHONE"    . ?p)
                        ("EMACS"    . ?e)
                        ("WORKFLOW" . ?f)
                        ("WORK"     . ?w)
                        (:startgroup)
                        ("@HOME"     . ?h)
                        ("@SHOPPING" . ?s)
                        ("@HOUSTON"  . ?o)
                        ("@CLIENT"   . ?l)
                        ("@CAVERION" . ?a)
                        (:endgroup))
        ;; org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
        ;;                     (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))
        ;; DRAFT is for blog posts, used in blog org files
        ;; org-todo-keyword-faces '(("TODO" . (:foreground "#61afef" :underline t))
        ;;                          ("NEXT" . (:foreground "#e5c07b" :underline t))
        ;;                          ("WAITING" . (:foreground "#de935f" :underline t))
        ;;                          ("HOLD" . (:foreground "#e06c75" :underline t))
        ;;                          ("DONE" . (:foreground "#98c379" :underline nil))
        ;;                          ("CANCELLED" . (:foreground "#717171" :underline nil))
        ;;                          ("DRAFT" . (:foreground "#fabd2f" :underline t)))
        org-todo-keywords '((sequence "TODO(t)" "PROJ(p)" "|" "DONE(d)")
                            ;; (sequence "[ ](T)" "[-](P)" "[?](M)" "|" "[X](D)")
                            (sequence "NEXT(n)" "WAIT(w@/!)" "HOLD(h@/!)" "|" "ABRT(c@/!)"))
        org-todo-keyword-faces '(("PROJ" :inherit (bold default))
                                 ("HOLD" :inherit (warning bold))
                                 ("WAIT" :inherit (bold) :foreground "#da8548")
                                 ("ABRT" :inherit (error bold)))
        org-priority-faces '((65 :foreground "#e06c75")
                             (66 :foreground "#61afef")
                             (67 :foreground "#98c379"))
        org-capture-templates '(("t" "TODO" entry
                                 (file+headline +org-capture-todo-file "Tasks")
                                 "* TODO %?" :prepend t :kill-buffer t)
                                ("l" "TODO with link" entry
                                 (file+headline +org-capture-todo-file "Tasks")
                                 "* TODO %?\n%a" :prepend t :kill-buffer t)
                                ("T" "Tickler" entry
                                 (file+headline "~/Sync/org/tickler.org" "Tasks")
                                 "* %i%?")
                                ("n" "Note" entry
                                 (file+headline +org-capture-notes-file "Notes")
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

                                ;; ("p" "Templates for reviews")
                                ;; ("rd" "Review: Daily Review" entry
                                ;;  (file+olp+datetree "/tmp/reviews.org" "Past reviews")
                                ;;  (file "templates/dailyreview.org"))
                                ;; ("rw" "Review: Weekly Review" entry
                                ;;  (file+olp+datetree "/tmp/reviews.org" "Past reviews")
                                ;;  (file "templates/weeklyreview.org"))
                                ;; ("rm" "Review: Monthly Review" entry
                                ;;  (file+olp+datetree "/tmp/reviews.org" "Past reviews")
                                ;;  (file "templates/monthlyreview.org"))
                                )

        org-agenda-custom-commands '(("r" "Refile needed" tags-todo "REFILE")
                                     ("g" . "GTD contexts")
                                     ("gc" "Client" tags-todo "@CLIENT")
                                     ("gh" "Home" tags-todo "@HOME")
                                     ("go" "Houston" tags-todo "@HOUSTON")
                                     ("gw" "Work" tags-todo "WORK")
                                     ("G" "GTD Block Agenda" ((tags-todo "@HOUSTON")
                                                              (tags-todo "@HOME"))))
        )
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

 (:after org-super-agenda
   :map org-super-agenda-header-map
   :nvme "j" #'org-agenda-next-line
   :nvme "k" #'org-agenda-previous-line)

 (:after org
   :map org-agenda-mode-map
   :nvme "F" #'org-agenda-follow-mode
   :nvme "j" #'org-agenda-next-line
   :nvme "k" #'org-agenda-previous-line
   :nvme "n" #'org-agenda-next-line
   :nvme "p" #'org-agenda-previous-line
   :nvme "N" #'org-agenda-next-item
   :nvme "P" #'org-agenda-previous-item
   :nvme "f" #'org-agenda-later
   :nvme "b" #'org-agenda-earlier
   :nvme "M-s" #'org-save-all-org-buffers
   :nvme "0" '(lambda () (interactive) (digit-argument 0))
   :nvme "B" #'org-agenda-bulk-action
   :nvme "$" #'arg-agenda-archive

   :map org-mode-map
   :nvme "L" #'org-shiftright
   :nvme "H" #'org-shiftleft
   :nvme "K" #'org-shiftup
   :nvme "J" #'org-shiftdown
   :nvime "C-j" #'evil-window-down
   :nvime "C-k" #'evil-window-up
   :nvime "C-c t l" #'org-toggle-link-display
   :nvime "s-<return>" #'org-meta-return
   :nvime "M-S" #'org-save-all-org-buffers

   (:leader
     (:prefix ("/" . "search")
       :desc "Org sparse tree"             :n  "s" #'org-sparse-tree
       :desc "Org tags sparse tree"        :n  "t" #'org-tags-sparse-tree))

   :localleader
   "T" nil
   (:prefix ("T" . "toggles")
     "o" #'org-toggle-ordered-property
     "l" #'org-toggle-link-display)))

;;; +org.el ends here
