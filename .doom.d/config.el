;;; ~/dotfiles/emacs/doom.d/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Tuomo Syvänperä"
      user-mail-address "tuomo.syvanpera@gmail.com")

(setq system-time-locale "C"
      calendar-week-start-day 1
      read-quoted-char-radix 16)

(add-to-list 'load-path (expand-file-name "elisp" doom-private-dir))
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(with-current-buffer "*scratch*"  (emacs-lock-mode 'kill))
(with-current-buffer "*Messages*" (emacs-lock-mode 'kill))

(load! "+funcs")
(load! "+bindings")

(add-hook 'before-save-hook 'whitespace-cleanup)
;; (add-hook 'dired-mode-hook (lambda () (require 'dired-sort)))

(setq dired-listing-switches (concat dired-listing-switches "Gg")
      dired-dwim-target t)

(require 'simpleclip)
(simpleclip-mode 1)

(after! solaire-mode
  (solaire-global-mode -1))

(after! evil
  (setq evil-vsplit-window-right t)
  (evil-put-command-property 'evil-yank-line :motion 'evil-line))

(after! ivy
  (setq +ivy-buffer-icons t))

(after! company
  (setq company-minimum-prefix-length 3))

(after! treemacs
  (setq treemacs-RET-actions-config (quote
                                     ((root-node-open . treemacs-toggle-node)
                                      (root-node-closed . treemacs-toggle-node)
                                      (dir-node-open . treemacs-toggle-node)
                                      (dir-node-closed . treemacs-toggle-node)
                                      (file-node-open . treemacs-visit-node-in-most-recently-used-window)
                                      (file-node-closed . treemacs-visit-node-in-most-recently-used-window)
                                      (tag-node-open . treemacs-toggle-node-prefer-tag-visit)
                                      (tag-node-closed . treemacs-toggle-node-prefer-tag-visit)
                                      (tag-node . treemacs-visit-node-no-split)))))

;; (after! projectile
;;   (setq projectile-git-command "git ls-files -co --exclude-standard | grep -v '^node_modules/' | tr '\\n' '\\0'"))

(after! plantuml
  (setq plantuml-default-exec-mode 'jar))

(after! projectile
  (setq projectile-enable-caching nil
        projectile-project-search-path '("~/projects/caverion/" "~/projects/personal/")))

(after! lispyville
  lispyville-set-key-theme
  '((operators normal)
    c-w
    (prettify insert)
    (atom-movement normal visual)
    slurp/barf-lispy
    (wrap normal insert)
    (escape insert)))

(after! deft
  (setq deft-directory "~/Sync/org/notes"
        deft-use-filename-as-title t)
  (add-hook! 'deft-mode-hook #'hl-line-mode))

;; (after! evil-snipe
;;   (setq evil-snipe-repeat-scope 'line))

(after! prodigy
  (prodigy-define-service
    :name "Hugo Personal Blog"
    :command "/usr/bin/hugo"
    :args '("server" "-D" "--navigateToChanged")
    :cwd "~/projects/personal/tiniblog"
    :tags '(personal)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t))

(def-package! ox-hugo
  :after ox)

(def-package! eyebrowse
  :config
  (eyebrowse-mode t))

(def-package! yasnippet-snippets
  :after yasnippet)

(def-package! evil-iedit-state
  :after evil)

(load! "+email")     ;; Yes, I read my email with emacs too
(load! "+languages") ;; Programming stuff
(load! "+ui")        ;; UI modifications
(load! "+org")    ;; Org mode stuff

(provide 'config)

;;; config.el ends here
