;;; ~/dotfiles/emacs/doom.d/email.el -*- lexical-binding: t; -*-

;; ;; use org structures and tables in message mode
;; (add-hook 'message-mode-hook 'turn-on-orgtbl)
;; (add-hook 'message-mode-hook 'turn-on-orgstruct++)

(after! mu4e
  (require 'org-mu4e)
  (setq mu4e-maildir "~/.local/share/mail"
        mu4e-attachment-dir "~/.local/share/mail/.attachments"

        mu4e-sent-messages-behavior 'delete
        mu4e-use-fancy-chars nil

        org-mu4e-link-query-in-headers-mode nil

        mu4e-maildir-shortcuts
        '( ("/gmail/INBOX"   . ?g)
           ("/houston/INBOX" . ?h))

        ;; allow for updating mail using 'U' in the main view:
        mu4e-get-mail-command "mailsync"

        mu4e-contexts
        `(
          ,(make-mu4e-context
            :name "gmail"
            :enter-func (lambda () (mu4e-message "Switch to tuomo.syvanpera@gmail.com"))
            ;; :match-func (lambda (msg) (when msg
            ;;                        (string-prefix-p "/gmail" (mu4e-message-field msg :maildir))))
            :match-func (lambda (msg)
                          (when msg
                            (mu4e-message-maildir-matches msg "^/gmail/")
                            (mu4e-message-contact-field-matches msg :to "tuomo.syvanpera@gmail.com")))
            :vars '(
                    (mu4e-drafts-folder . "/gmail/[Gmail].Drafts")
                    (mu4e-sent-folder . "/gmail/[Gmail].Sent Mail")
                    (mu4e-trash-folder . "/gmail/[Gmail].Trash")
                    (mu4e-refile-folder . "/gmail/[Gmail].Archive")))
          ,(make-mu4e-context
            :name "houston"
            :enter-func (lambda () (mu4e-message "Switch to tuomo.syvanpera@houston-inc.com"))
            ;; :match-func (lambda (msg) (when msg
            ;;                        (string-prefix-p "/houston" (mu4e-message-field msg :maildir))))
            :match-func (lambda (msg)
                          (when msg
                            (mu4e-message-maildir-matches msg "^/houston/")
                            (mu4e-message-contact-field-matches msg :to "tuomo.syvanpera@houston-inc.com")))
            :vars '(
                    (mu4e-drafts-folder . "/houston/[Gmail].Drafts")
                    (mu4e-sent-folder . "/houston/[Gmail].Sent Mail")
                    (mu4e-trash-folder . "/houston/[Gmail].Trash")
                    (mu4e-refile-folder . "/houston/[Gmail].Archive"))))))

;;; email.el ends here
