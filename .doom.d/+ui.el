;;; ~/dotfiles/emacs/doom.d/+ui.el -*- lexical-binding: t; -*-

(fringe-mode '(8 . 8))

(setq-default x-select-enable-clipboard nil
              save-interprogram-paste-before-kill t
              whitespace-line-column 120
              whitespace-style '(face lines-tail tabs tab-mark))

;; (setq whitespace-display-mappings
;;       '((tab-mark 9 [8677 9] [92 9])))
(setq whitespace-display-mappings
      '((tab-mark 9 [187 9] [92 9])))

;; Modeline tweaks
(setq doom-modeline-height 25
      doom-modeline-bar-width 5
      doom-modeline-icon t
      doom-modeline-major-mode-icon t)

;; Line numbering
(setq doom-line-numbers-style 'relative
      display-line-numbers 'relative
      display-line-numbers-type 'relative)

;; Switch workspace when switching projects
(setq +workspaces-on-switch-project-behavior t)

;; Pretty code
(setq +pretty-code-symbols
      '(;; org
        :name          "»"
        :src_block     "»"
        :src_block_end "«"
        :todo          "☛"
        :done          "✓"
        ;; Functional
        :lambda        "λ"))

;; (setq window-divider-default-bottom-width 0)

;; (after! doom-themes
;;   (remove-hook 'doom-load-theme-hook #'doom-themes-treemacs-config))
