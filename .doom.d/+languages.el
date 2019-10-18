;;; ~/dotfiles/emacs/doom.d/+languages.el -*- lexical-binding: t; -*-

(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'goto-address-mode)
(add-hook 'prog-mode-hook (lambda () (setq-local show-trailing-whitespace t)))

(after! haskell-mode
  (add-hook! 'haskell-mode-hook 'haskell-indent-mode))

; (after! web-beautify
;   :init
;   (map! (:map* (json-mode-map)
;                :n "gQ" #'web-beautify-js)))

(after! elm
  (setq elm-tags-on-save t
        elm-sort-imports-on-save t
        elm-tags-exclude-elm-stuff t)
  (set-pretty-symbols! 'elm-mode
    :lambda "\\")
  (add-hook! 'elm-mode-hook #'elm-oracle-setup-completion))

(after! rust-mode-map
  (setq rust-format-on-save t))

(def-package! prettier-js
  :commands (prettier-js-mode)
  :init
  (defun setup-prettier-js ()
    "Sets up arguments and the mode."
    (interactive)
    (setq prettier-js-args '("--single-quote"))

    (prettier-js-mode))

  (add-hook! (typescript-mode js2-mode) #'setup-prettier-js)
  (add-hook! web-mode (enable-minor-mode '("\\.tsx\\'" . setup-prettier-js))))

(after! typescript-mode
  (setq typescript-indent-level 2))

(after! js2-mode
  (setq js2-basic-offset 2))

(after! web-mode
  ;; (add-hook 'web-mode-hook #'flycheck-mode)
  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-quoting nil ;; disable adding "" after an =
        web-mode-auto-close-style 2))

(after! go-mode
  (setq gofmt-command "goimports"
        godoc-at-point-function 'godoc-gogetdoc)
  ;; turn off company idle completion, it's annoyingly slow
  (add-hook! 'go-mode-hook (lambda () (setq-local company-idle-delay nil)))
  (add-hook! 'go-mode-hook #'rainbow-delimiters-mode)
  (add-hook! 'before-save-hook 'gofmt-before-save)
  (map! :map go-mode-map
        :localleader
        (:prefix ("r" . "refactor")
          "e" #'godoctor-extract
          "r" #'godoctor-rename
          "t" #'godoctor-toggle)))

(after! lsp-ui
  (setq lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-show-hover nil))

(def-package! godoctor
  :after go-mode)

;;; +languages.el ends here
