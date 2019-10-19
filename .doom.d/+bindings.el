;;; ~/dotfiles/emacs/doom.d/+bindings.el -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")

(map!
 ;; --- Global keybindings ---------------------------
 :gnvime "C-c d" #'deft
 :gnvime "C-c C-r" #'ivy-resume
 :gnvime "C-s" #'counsel-grep-or-swiper
 :gnvime "M-p" #'counsel-projectile-find-file
 ;; :gnvime "M-p" #'helm-projectile-find-file
 :gnvime "M-P" #'execute-extended-command
 ;; :gnvime "M-e" #'+neotree/find-this-file
 ;; :gnvime "M-e" #'+treemacs/find-file
 :gnvime "M-e" #'+treemacs/toggle
 :gnvime "M-y" #'counsel-yank-pop
 ;; :gnvime "M-y" #'helm-show-kill-ring
 :gnvime "M-u" #'undo-tree-visualize
 :gnvime "M-g" #'ts@git-hydra/body
 :gnvime "M-f" #'counsel-grep-or-swiper
 :gnvime "M-F" #'+default/search-project
 :gnvime "M-c" #'simpleclip-copy
 :gnvime "M-v" #'simpleclip-paste
 :gnvime "s-f" #'swiper
 :gnvime "C-u" #'universal-argument
 :gnvime "M-r" #'counsel-imenu
 :gnvime "M-a" #'mark-whole-buffer
 ;; :gnvime "M-r" #'helm-imenu
 :gnvime "M-o" #'ff-find-other-file
 :gnvime "M-O" #'projectile-find-other-file-other-window
 :gnvime "C-j" #'evil-window-down
 :gnvime "C-k" #'evil-window-up
 :gnvime "C-c C-w d" #'eyebrowse-close-window-config
 ;; :gnvime "s-d" #'helm-dash
 ;; :gnvime "s-D" #'helm-dash-at-point
 :gnvime "<C-f5>" '(lambda () (interactive) (bookmark-set "QUICKSAVE"))
 :gnvime "<f5>"   '(lambda () (interactive) (bookmark-jump "QUICKSAVE"))
 :nv     "C-SPC" nil
 ;; :gnvime "s-1" #'awesome-tab-select-visible-tab
 ;; :gnvime "s-2" #'awesome-tab-select-visible-tab
 ;; :gnvime "s-3" #'awesome-tab-select-visible-tab
 ;; :gnvime "s-4" #'awesome-tab-select-visible-tab
 ;; :gnvime "s-5" #'awesome-tab-select-visible-tab
 ;; :gnvime "s-6" #'awesome-tab-select-visible-tab
 ;; :gnvime "s-7" #'awesome-tab-select-visible-tab
 ;; :gnvime "s-8" #'awesome-tab-select-visible-tab
 ;; :gnvime "s-9" #'awesome-tab-select-visible-tab
 :gnvime "s-1" #'(lambda () (interactive) (+workspace/switch-to 0))
 :gnvime "s-2" #'(lambda () (interactive) (+workspace/switch-to 1))
 :gnvime "s-3" #'(lambda () (interactive) (+workspace/switch-to 2))
 :gnvime "s-4" #'(lambda () (interactive) (+workspace/switch-to 3))
 :gnvime "s-5" #'(lambda () (interactive) (+workspace/switch-to 4))
 :gnvime "s-6" #'(lambda () (interactive) (+workspace/switch-to 5))
 :gnvime "s-7" #'(lambda () (interactive) (+workspace/switch-to 6))
 :gnime  "C-h" #'evil-window-left
 :gnime  "C-j" #'evil-window-down
 :gnime  "C-k" #'evil-window-up
 :gnime  "C-l" #'evil-window-right
 :v      "v"   #'er/expand-region
 :v      "V"   #'er/contract-region
 :gnme   "M-t" #'+eshell/open-popup
 :gnvime "C-M-k" #'evil-window-increase-height
 :gnvime "C-M-j" #'evil-window-decrease-height
 :gnvime "C-M-h" #'evil-window-increase-width
 :gnvime "C-M-l" #'evil-window-decrease-width

 :gnvime "M-s" #'save-buffer

 ;; Text-scaling
 :ne "M-=" (λ! (text-scale-set 0))
 :ne "M-0" (λ! (text-scale-set 0))
 :ne "C-+" #'text-scale-increase
 :ne "C--" #'text-scale-decrease
 :ne "M-+" #'text-scale-increase
 :ne "M--" #'text-scale-decrease
 :ne "M-z" #'doom@text-zoom/body

 ;; --- Personal vim-esque bindings ------------------
 :nm "gf" #'projectile-find-file-dwim
 :nm "gF" #'projectile-find-file-dwim-other-window
 :nm "go" #'browse-url
 :nm "g{" #'beginning-of-defun
 :nm "g}" #'end-of-defun

 ;; --- Misc -----------------------------------------
 :nm "§"   #'evil-switch-to-windows-last-buffer
 :nm "M-§" #'evil-switch-to-windows-last-buffer


 ;; --- <leader> -------------------------------------
 (:leader
   ;; :desc "Pop up shell"           :n  "'"   #'projectile-run-eshell
   :desc "Switch to alt buffer"   :n  "TAB" #'evil-switch-to-windows-last-buffer
   :desc "Switch to workspace 1"  :n  "1"   #'(lambda () (interactive) (+workspace/switch-to 0))
   :desc "Switch to workspace 2"  :n  "2"   #'(lambda () (interactive) (+workspace/switch-to 1))
   :desc "Switch to workspace 3"  :n  "3"   #'(lambda () (interactive) (+workspace/switch-to 2))
   :desc "Switch to workspace 4"  :n  "4"   #'(lambda () (interactive) (+workspace/switch-to 3))
   :desc "Switch to workspace 5"  :n  "5"   #'(lambda () (interactive) (+workspace/switch-to 4))
   :desc "Switch to workspace 6"  :n  "6"   #'(lambda () (interactive) (+workspace/switch-to 5))
   :desc "Switch to workspace 7"  :n  "7"   #'(lambda () (interactive) (+workspace/switch-to 6))
   :desc "Switch to workspace 8"  :n  "8"   #'(lambda () (interactive) (+workspace/switch-to 7))
   :desc "Switch to workspace 9"  :n  "9"   #'(lambda () (interactive) (+workspace/switch-to 8))
   (:prefix ("a" . "applications")
     :desc "Deft"                 :n  "d" #'deft
     :desc "Ranger"               :n  "r" #'ranger
     :desc "Shell"                :n  "s" #'projectile-run-eshell
     :desc "Email"                :n  "m" #'mu4e
     :desc "Prodigy"              :n  "p" #'prodigy)
   (:prefix ("b" . "buffer")
     ;; :desc "Switch buffer"        :n  "b" #'ts/switch-buffer
     ;; :desc "Kill this buffer"     :n  "d" #'kill-this-buffer
     ;; :desc "Kill buffer"          :n  "k" #'kill-buffer
     :desc "Open messages buffer" :n  "m" #'spacemacs/switch-to-messages-buffer
     :desc "Open scratch buffer"  :n  "s" #'(lambda () (interactive)
                                              (let ((current-prefix-arg t))
                                                (call-interactively #'doom/open-scratch-buffer))))
   (:prefix ("j" . "jump")
     :desc "Jump to char"         :n  "j" #'evil-avy-goto-char
     :desc "Jump to 2 char"       :n  "c" #'evil-avy-goto-char-2
     :desc "Jump to line"         :n  "l" #'evil-avy-goto-line
     :desc "Jump to char timer"   :n  "t" #'evil-avy-goto-char-timer
     :desc "Jump to word"         :n  "w" #'evil-avy-goto-word-0)
   (:prefix ("f" . "file")
     (:prefix ("o" . "open")
       :desc "Open org folder"       :n  "o" #'ts/open-org-directory
       :desc "Open org arhive"       :n  "a" #'ts/open-org-archive
       :desc "Open org inbox file"   :n  "i" #'ts/open-org-inbox
       :desc "Open org notes file"   :n  "n" #'ts/open-org-notes
       :desc "Open project org file" :n  "p" #'ts/open-org-project-todo-file))
   (:prefix ("e" . "errors")
     :desc "List errors"          :n  "l" #'flycheck-list-errors
     :desc "Next error"           :n  "n" #'flycheck-next-error
     :desc "Previous error"       :n  "p" #'flycheck-previous-error)
   (:prefix ("g" . "git")
     :desc "Git status"           :n  "s" #'magit-status
     :desc "Next hunk"            :nv "n" #'git-gutter:next-hunk
     :desc "Previous hunk"        :nv "p" #'git-gutter:previous-hunk
     :desc "View hunk"            :nv "v" #'git-gutter:popup-hunk)
   (:prefix ("p" . "project")
     :desc "Find file in project" :n  "f" #'projectile-find-file
     :desc "Switch project"       :n  "l" #'projectile-switch-project)
   (:prefix ("t" . "toggle")
     :desc "Search highlight"     :n  "h" #'evil-ex-nohighlight
     :desc "Tabs"                 :n  "t" #'awesome-tab-mode)
   (:prefix ("l" . "workspace")
     :desc "Display tab bar"           "l"   #'+workspace/display
     :desc "Switch workspace"          "."   #'+workspace/switch-to
     :desc "New workspace"             "n"   #'+workspace/new
     :desc "Load workspace from file"  "L"   #'+workspace/load
     :desc "Save workspace to file"    "S"   #'+workspace/save
     :desc "Delete session"            "x"   #'+workspace/kill-session
     :desc "Delete this workspace"     "d"   #'+workspace/delete
     :desc "Rename workspace"          "r"   #'+workspace/rename
     :desc "Restore last session"      "R"   #'+workspace/restore-last-session
     :desc "Next workspace"            "]"   #'+workspace/switch-right
     :desc "Previous workspace"        "["   #'+workspace/switch-left
     :desc "Switch to 1st workspace"   "1"   (λ! (+workspace/switch-to 0))
     :desc "Switch to 2nd workspace"   "2"   (λ! (+workspace/switch-to 1))
     :desc "Switch to 3rd workspace"   "3"   (λ! (+workspace/switch-to 2))
     :desc "Switch to 4th workspace"   "4"   (λ! (+workspace/switch-to 3))
     :desc "Switch to 5th workspace"   "5"   (λ! (+workspace/switch-to 4))
     :desc "Switch to 6th workspace"   "6"   (λ! (+workspace/switch-to 5))
     :desc "Switch to 7th workspace"   "7"   (λ! (+workspace/switch-to 6))
     :desc "Switch to 8th workspace"   "8"   (λ! (+workspace/switch-to 7))
     :desc "Switch to 9th workspace"   "9"   (λ! (+workspace/switch-to 8))
     :desc "Switch to last workspace"  "0"   #'+workspace/switch-to-last)
   (:prefix ("w" . "window")
     :desc "Switch to window conf 0" :n  "0" #'eyebrowse-switch-to-window-config-0
     :desc "Switch to window conf 1" :n  "1" #'eyebrowse-switch-to-window-config-1
     :desc "Switch to window conf 2" :n  "2" #'eyebrowse-switch-to-window-config-2
     :desc "Switch to window conf 3" :n  "3" #'eyebrowse-switch-to-window-config-3
     :desc "Switch to window conf 4" :n  "4" #'eyebrowse-switch-to-window-config-4
     :desc "Switch to window conf 5" :n  "5" #'eyebrowse-switch-to-window-config-5
     :desc "Switch to window conf 6" :n  "6" #'eyebrowse-switch-to-window-config-6
     :desc "Switch to window conf 7" :n  "7" #'eyebrowse-switch-to-window-config-7
     :desc "Switch to window conf 8" :n  "8" #'eyebrowse-switch-to-window-config-8
     :desc "Switch to window conf 9" :n  "9" #'eyebrowse-switch-to-window-config-9
     :desc "Switch to window conf 9" :n  "9" #'eyebrowse-switch-to-window-config-9
     :desc "Last window conf"        :n  "'" #'eyebrowse-last-window-config
     :desc "Close window conf"       :n  "d" #'eyebrowse-close-window-config)
   (:prefix ("/" . "search")
     :desc "Search buffer"             :n  "/" #'counsel-grep-or-swiper
     :desc "Search project for symbol" :n  "*" #'+default/search-project-for-symbol-at-point
     :desc "Toggle iedit mode"         :n  "e" #'evil-iedit-state/iedit-mode))

 ;; --- <localleader> -------------------------------------
 ;; (:localleader
 ;;   (:map evil-iedit-state-map
 ;;     "f" #'iedit-restrict-function))
 ;;    :desc "Switch to alt buffer"      :nv "TAB" #'spacemacs/alternate-buffer)
                                        ;     :desc "Jump to char"              :n  "j"   #'evil-avy-goto-char
                                        ;     ;; :desc "Close window or workspace" :nv "q"   #'+workspace/close-window-or-workspace
                                        ;     ;; :desc "Switch workspace buffer"   :nv "b"   #'persp-switch-to-buffer
                                        ;     ;; :desc "Switch buffer"             :nv "B"   #'helm-mini
                                        ;     ;; :desc "Browse files"              :nv "f"   #'find-file
                                        ;     ;; :desc "Browse files"              :nv "F"   #'projectile-find-file
                                        ;     ;; :desc "Toggle Neotree"            :nv "e"   #'neotree-toggle
                                        ;     :desc "Toggle Treemacs"           :nv "e"   #'+treemacs/toggle
                                        ;     :desc "Open private config"       :n  "v"   #'ts/open-config-file
                                        ;     (:desc "git" :prefix "g"
                                        ;       :desc "Git status"              :n  "s"   #'magit-status
                                        ;       :desc "Git transient state"     :n  "g"   #'ts@git-hydra/body
                                        ;       :desc "Stage hunk"              :n  "S"   #'git-gutter:stage-hunk
                                        ;       :desc "View hunk"               :nv "v"   #'git-gutter:popup-hunk
                                        ;       :desc "Next hunk"               :nv "n"   #'git-gutter:next-hunk
                                        ;       :desc "Previous hunk"           :nv "p"   #'git-gutter:previous-hunk
                                        ;       :desc "Git revert hunk"         :n  "r"   #'git-gutter:revert-hunk))

                                        ;  (:after tide
                                        ;    (:localleader
                                        ;      :map tide-mode-map
                                        ;      "?" #'tide-documentation-at-point))

 (:after elm-mode
   (:map elm-mode-map
     "C-o" #'pop-tag-mark
     :nvme "gd"  #'elm-mode-goto-tag-at-point))

 (:after go-mode
   (:map go-mode-map
     :nvme "gh" #'godoc-at-point
     :nvme "gd" #'godef-jump
     :nvme "gD" #'godef-jump-other-window))

 (:after company
   (:map company-active-map
     "C-f"     #'company-next-page
     "C-b"     #'company-previous-page))

 (:after evil
   (:map evil-window-map                ; prefix "C-w"
     "N" #'evil-window-vnew
     "o" #'delete-other-windows
     "z" #'doom/window-enlargen))

 (:after elm-mode
   (:map elm-mode-map
     :nvme "M-." 'elm-mode-goto-tag-at-point))

 (:after ivy
   :map ivy-minibuffer-map
   "C-h" #'ivy-backward-delete-char
   "C-f" #'ivy-scroll-up-command
   "C-b" #'ivy-scroll-down-command)

 (:after swiper
   :map swiper-map
   "C-c C-e" #'+ivy/wgrep-occur)

 (:after treemacs
   :map treemacs-mode-map
   :nvime "C-l" #'evil-window-right)

 (:after go-mode
   :map go-mode-map
   :localleader
   (:prefix ("g" . "go-to")
     "a" #'go-goto-arguments
     "i" #'go-goto-imports
     "f" #'go-goto-function
     "r" #'go-goto-return-values))

 ;; (:after lispyville
 ;;   :map lispy-mode-map
 ;;   :nvme "gc" #'lispyville-comment-or-uncomment)
 )


;; evil-collection defines some of these and we need to override them. So bind these
;; after evil-collection
(after! evil-collection
  (defun ts/init-eshell-keymap ()
    "Setup eshell keybindings. This must be done in a hook because eshell-mode
    redefines its keys every time `eshell-mode' is enabled."
    (map! :map eshell-mode-map
          :nvim "C-j" #'evil-window-down
          :nvim "C-k" #'evil-window-up
          :nvim "C-h" #'evil-window-left
          :nvim "C-l" #'evil-window-right
          :i    "C-p" #'eshell-previous-matching-input-from-input
          :i    "C-n" #'eshell-next-matching-input-from-input))

  (add-hook! 'eshell-first-time-mode-hook #'ts/init-eshell-keymap))
