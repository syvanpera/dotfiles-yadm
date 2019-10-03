;;; ~/dotfiles/emacs/doom.d/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Tuomo Syvänperä"
      user-mail-address "tuomo.syvanpera@gmail.com")

(setq-default indent-tabs-mode nil
              evil-shift-width 4
              tab-width 4)

(setq system-time-locale "C"
      calendar-week-start-day 1)

(add-to-list 'load-path (expand-file-name "elisp" doom-private-dir))

;; (require 'awesome-tab)
;; (awesome-tab-mode t)
;;
;;
(require 'simpleclip)
(simpleclip-mode 1)

(with-current-buffer "*scratch*"  (emacs-lock-mode 'kill))
(with-current-buffer "*Messages*" (emacs-lock-mode 'kill))

(load! "+funcs")
(load! "+bindings")
;; (load! "+hydras")

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'dired-mode-hook (lambda () (require 'dired-sort)))

(setq dired-listing-switches (concat dired-listing-switches "Gg"))

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
                                      (tag-node . treemacs-visit-node-no-split))))
  ;; (treemacs-follow-mode t)
  )

; (after! projectile
;   (setq projectile-git-command "git ls-files -co --exclude-standard | grep -v '^node_modules/' | tr '\\n' '\\0'"))

(after! projectile
  (setq projectile-enable-caching nil))

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
  (setq deft-directory "~/org/notes"
        deft-use-filename-as-title t)
  (add-hook! 'deft-mode-hook #'hl-line-mode))

(after! evil-snipe
  (setq evil-snipe-repeat-scope 'line))

(after! prodigy
  (prodigy-define-service
    :name "Hugo Personal Blog"
    :command "/usr/bin/hugo"
    :args '("server" "-D" "--navigateToChanged")
    :cwd "~/projects/personal/tiniblog"
    :tags '(personal)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t))

;; (def-package! persistent-scratch
;;   :config
;;   (setq persistent-scratch-scratch-buffer-p-function
;;         (lambda () (string-prefix-p "*scratch" (buffer-name))))
;;   (persistent-scratch-setup-default))

; (def-package! exec-path-from-shell
;   :config
;   (exec-path-from-shell-initialize))

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

(def-package! org-gtasks
  :after org
  :config
  (load-file "~/.emacs-secrets.el")
  (org-gtasks-register-account :name "Gmail"
                               :directory "~/org/gtasks/"
                               :client-id org-gtasks-client-id
                               :client-secret org-gtasks-client-secret))

(def-package! ox-hugo
  :after ox)

; (def-package! gruvbox-theme
;   :config
;   (load-theme 'gruvbox-dark-hard t))

;;(def-package! org-projectile
;;  :after org
;;  :config
;;  (progn
;;    (setq org-projectile-projects-file (concat org-directory "/projects.org")
;;          org-projectile-capture-template "* ☛ TODO %?\n"
;;          org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
;;    (push (org-projectile-project-todo-entry) org-capture-templates)))

(def-package! eyebrowse
  :config
  (eyebrowse-mode t))

(def-package! engine-mode
  :config
  (engine-mode t)
  (defengine devdocs
             "https://devdocs.io/#q=%s"
             :keybinding "d")
             ;; :browser 'eww-browse-url)
  (defengine google
             "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
             :keybinding "g")
  (defengine stack-overflow
             "https://stackoverflow.com/search?q=%s"
             :keybinding "s"))

(def-package! yasnippet-snippets
  :after yasnippet)

(def-package! evil-iedit-state
  :after evil)

(def-package! kubernetes)

(def-package! kubernetes-evil
  :after kubernetes)

(load! "+email")     ;; Yes, I read my email with emacs too
(load! "+languages") ;; Programming stuff
(load! "+ui")        ;; UI modifications
(load! "+org")       ;; Org mode stuff

(provide 'config)

;;; config.el ends here
