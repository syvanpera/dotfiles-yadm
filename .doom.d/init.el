;;; init.el -*- lexical-binding: t; -*-
(setq
 ;; doom-theme 'doom-dracula
 ;; doom-theme 'doom-onedark
 ;; doom-theme 'doom-tomorrow-night
 ;; doom-theme 'doom-palenight
 doom-theme 'doom-one
 ;; doom-theme 'doom-gruvbox
 ;; doom-font (font-spec :family "UbuntuMono Nerd Font" :size 28)
 doom-font (font-spec :family "UbuntuMono Nerd Font" :size 14)
 ;; doom-font (font-spec :family "FuraCode Nerd Font" :size 12)
 exec-path (append exec-path '("/home/tuomo/go/bin"))
 )

(doom! :input
       ;;chinese
       ;;japanese

       :completion
       (company           ; the ultimate code completion backend
        +auto)
       ;;helm              ; the *other* search engine for love and life
       ;;ido               ; the other *other* search engine...
       (ivy               ; a search engine for love and life
        +fuzzy
        +icons)

       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ;;fill-column       ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;hydra
       ;;indent-guides     ; highlighted indent columns
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       ;;neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       (pretty-code       ; replace bits of code with pretty symbols
        +fira)
       ;;tabs              ; an tab bar for Emacs
       treemacs          ; a project drawer, like neotree but cooler
       ;;unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       ;;god               ; run Emacs commands without modifier keys
       fold              ; (nigh) universal code folding
       ;;(format +onsave)  ; automated prettiness
       ;;lispy             ; vim for lisp, for people who dont like vim
       multiple-cursors  ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       ;;word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired            ; making dired pretty [functional]
        +icons)
       electric          ; smarter, keyword-based electric-indent
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell            ; a consistent, cross-platform shell (WIP)
       ;;shell             ; a terminal REPL for Emacs
       ;;term              ; terminals in Emacs
       ;;vterm             ; another terminals in Emacs

       :tools
       ansible
       debugger          ; FIXME stepping through code, to help you add bugs
       direnv
       docker
       editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs
       eval              ; run code, run (also, repls)
       flycheck          ; tasing you for every semicolon you forget
       ;;flyspell          ; tasing you for misspelling mispelling
       ;;gist              ; interacting with github gists
       (lookup           ; helps you navigate your code and documentation
        +docsets)        ; ...or in Dash docsets locally
       lsp
       ;;macos             ; MacOS-specific commands
       magit             ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       ;;pdf               ; pdf enhancements
       prodigy           ; FIXME managing external services & code builders
       ;;rgb               ; creating color strings
       ;;terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp
       ;;wakatime

       :lang
       ;;agda              ; types of types of types of types...
       ;;assembly          ; assembly for fun or debugging
       ;;cc                ; C/C++/Obj-C madness
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
       ;;erlang            ; an elegant language for a more civilized age
       elixir            ; erlang done right
       elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
       ;;ess               ; emacs speaks statistics
       ;;faust             ; dsp, but you get to keep your soul
       ;;fsharp           ; ML stands for Microsoft's Language
       (go                 ; the hipster dialect
        +lsp)
       ;;(haskell +intero) ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ;
       ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean
       ;;ledger            ; an accounting system in Emacs
       ;;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;;nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +dragndrop       ; drag & drop files/images into org buffers
        ;+hugo            ; use Emacs for hugo blogging
        +ipython         ; ipython/jupyter support for babel
        +pandoc          ; export-with-pandoc support
        ;+pomodoro        ; be fruitful with the tomato technique
        +present)        ; using org-mode for presentations
       ; (org              ; organize your plain life in plain text
       ;  +dragndrop       ; file drag & drop support
       ;  +ipython         ; ipython support for babel
       ;  +pandoc          ; pandoc integration into org's exporter
       ;  +present         ; using Emacs for presentations
       ;  +attach          ; custom attachment system
       ;  +babel           ; running code in org
       ;  +capture         ; org-capture in and outside of Emacs
       ;  +export          ; Exporting org to whatever you want
       ;  +habit           ; Keep track of your habits
       ;  +protocol)       ; Support for org-protocol:// links
       ;;perl              ; write code no one else can comprehend
       ;;php               ; perl's insecure younger brother
       plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       python            ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       rest              ; Emacs as a REST client
       ;;ruby              ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       ;;scheme            ; a fully conniving family of lisps
       sh                ; she sells {ba,z,fi}sh shells on the C xor
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       web               ; the tubes

       :email
       (mu4e +gmail)       ; WIP
       notmuch             ; WIP
       ;;(wanderlust +gmail) ; WIP

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
       ;;calendar
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought
       ;;(write            ; emacs for writers (fiction, notes, papers, etc.)
       ;; +wordnut         ; wordnet (wn) search
       ;; +langtool)       ; a proofreader (grammar/style check) for Emacs

       :config
       ;; For literate config users. This will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
       ;;literate

       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
       ;; config. Use it as a reference for your own modules.
       (default +bindings +smartparens))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#1d1f21"))))
 '(solaire-default-face ((t (:background "#1d1f21"))))
 '(hl-line ((t (:inherit hl-line :background "#343840"))))
 '(outline-1 ((t (:background nil :weight normal :underline t))))
 '(outline-2 ((t (:background nil :weight normal))))
 '(outline-3 ((t (:background nil :weight normal))))
 '(outline-4 ((t (:background nil :weight normal))))
 ;; '(org-scheduled ((t (:foreground "#44b9b1"))))
 ;; '(org-scheduled-today ((t (:inherit org-scheduled))))
 '(org-scheduled-previously ((t (:foreground "#cc6666"))))
 ;; '(org-agenda-date ((t (:height 1.1))))
 ;; '(org-agenda-date-weekend ((t (:inherit org-agenda-date))))
 '(org-agenda-date-today ((t (:inherit org-agenda-date :overline t :underline t))))
 '(org-super-agenda-header ((t (:background "#363739" :overline t :weight bold))))
 '(whitespace-tab ((t (:background "#1d1f21")))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(outline-1 ((t (:background nil :weight bold))))
;;  '(outline-2 ((t (:foreground "#c678dd" :weight normal))))
;;  '(outline-3 ((t (:foreground "#b48ead" :weight normal))))
;;  '(outline-4 ((t (:foreground "#88c3f3" :weight normal))))
;;  '(org-agenda-date-today ((t (:background "#3c424c" :overline t :underline t))))
;;  '(solaire-default-face ((t (:inherit default :background "#1e1e1e"))))
;;  '(hl-line ((t (:inherit hl-line :background "#3c424c"))))
;;  '(whitespace-tab ((t (:background "#1e1e1e" :foreground "#3f4040"))))
;;  )

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(font-lock-builtin-face ((t (:foreground "#61afef"))))
;;  '(font-lock-function-name-face ((t (:foreground "#61afef"))))
;;  '(org-todo ((t (:weight normal))))
;;  '(org-headline-done ((t (:foreground "#717171" :strike-through t))))
;;  '(outline-1 ((t (:foreground "#61afef" :background nil :weight bold))))
;;  '(outline-2 ((t (:foreground "#b294bb" :background nil :weight normal))))
;;  '(outline-3 ((t (:foreground "#8abeb7" :weight normal))))
;;  '(outline-4 ((t (:foreground "#f0c674" :weight normal))))
;;  '(org-block ((t (:background "#222424"))))
;;  '(org-scheduled-today ((t (:foreground "#8abeb7"))))
;;  '(org-scheduled-previously ((t (:foreground "#de935f"))))
;;  '(org-agenda-date ((t (:foreground "#b294bb" :weight normal :height 1.0))))
;;  '(org-agenda-date-today ((t (:foreground "#c678dd" :weight bold :height 1.0))))
;;  ;; '(org-agenda-date-weekend ((t (:foreground "#b5bd68"))))
;;  '(org-super-agenda-header ((t (:background "#363739" :overline t :weight bold))))
;;  '(solaire-default-face ((t (:inherit default :background "#1e1e1e"))))
;;  '(solaire-hl-line-face ((t (:inherit hl-line :background "#363739"))))
;;  '(whitespace-tab ((t (:background "#1e1e1e" :foreground "#3f4040"))))
;;  '(mu4e-view-body-face ((t (:background nil)))))
