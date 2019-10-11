;;; ~/dotfiles/emacs/doom.d/+email.el -*- lexical-binding: t; -*-

(after! mu4e
  (require 'org-mu4e)
  (setq mu4e-maildir "~/.local/share/mail"
        mu4e-contexts
        `( ,(make-mu4e-context
             :name "Gmail"
             :enter-func (lambda () (mu4e-message "Switch to tuomo.syvanpera@gmail.com"))
                                        ; :match-func (lambda (msg) (when msg (string-prefix-p "/gmail" (mu4e-message-field msg :maildir))))
             :match-func (lambda (msg)
                           (when msg
                             (mu4e-message-maildir-matches msg "^/gmail/")
                             (mu4e-message-contact-field-matches msg :to "tuomo.syvanpera@gmail.com")))
             :vars '(
                     (mu4e-sent-folder . "/gmail/[Gmail].Sent Mail")
                     (mu4e-drafts . "/gmail/[Gmail].Drafts")
                     (mu4e-trash-folder . "/gmail/[Gmail].Trash")
                     (mu4e-refile-folder . "/gmail/[Gmail].Archive")
                     ))
           ,(make-mu4e-context
             :name "Houston"
             :enter-func (lambda () (mu4e-message "Switch to tuomo.syvanpera@houston-inc.com"))
                                        ; :match-func (lambda (msg) (when msg (string-prefix-p "/houston" (mu4e-message-field msg :maildir))))
             :match-func (lambda (msg)
                           (when msg
                             (mu4e-message-maildir-matches msg "^/houston/")
                             (mu4e-message-contact-field-matches msg :to "tuomo.syvanpera@houston-inc.com")))
             :vars '(
                     (mu4e-sent-folder . "/houston/[Gmail].Sent Mail")
                     (mu4e-drafts . "/houston/[Gmail].Drafts")
                     (mu4e-trash-folder . "/houston[Gmail].Trash")
                     (mu4e-refile-folder . "/houston[Gmail].Archive")
                     ))
           ))
  )
