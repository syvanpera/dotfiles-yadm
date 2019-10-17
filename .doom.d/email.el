;;; ~/dotfiles/emacs/doom.d/email.el -*- lexical-binding: t; -*-

;; ;; use org structures and tables in message mode
;; (add-hook 'message-mode-hook 'turn-on-orgtbl)
;; (add-hook 'message-mode-hook 'turn-on-orgstruct++)

(after! mu4e
  (require 'org-mu4e)

  ;; Choose account label to feed msmtp -a option based on From header
  ;; in Message buffer; This function must be added to
  ;; message-send-mail-hook for on-the-fly change of From address before
  ;; sending message since message-send-mail-hook is processed right
  ;; before sending message.
  (defun choose-msmtp-account ()
    (if (message-mail-p)
        (save-excursion
          (let*
              ((from (save-restriction
                       (message-narrow-to-headers)
                       (message-fetch-field "from")))
               (account
                (cond
                 ((string-match "tuomo.syvanpera@houston-inc.com" from) "houston")
                 ((string-match "tuomo.syvanpera@gmail.com" from) "gmail"))))
            (setq message-sendmail-extra-arguments (list '"-a" account))))))

  (setq mu4e-maildir "~/.local/share/mail"
        mu4e-attachment-dir "~/.local/share/mail/.attachments"

        mu4e-html2text-command "w3m -dump -T text/html"
        mu4e-sent-messages-behavior 'delete
        mu4e-use-fancy-chars nil
        shr-color-visible-luminance-min 50

        org-mu4e-link-query-in-headers-mode nil

        mu4e-maildir-shortcuts '(("/gmail/INBOX"               . ?g)
                                 ("/houston/INBOX"             . ?h)
                                 ("/houston/[Gmail].Sent Mail" . ?s))

        mu4e-bookmarks '(("flag:unread" "Unread messages" ?u)
                         ("date:today..now" "Today's messages" ?t)
                         ("date:7d..now" "Last 7 days" ?w))

        ;; allow for updating mail using 'U' in the main view:
        mu4e-get-mail-command "mailsync"

        message-send-mail-function 'message-send-mail-with-sendmail
        sendmail-program "/usr/bin/msmtp"
        user-full-name "Tuomo Syvänperä"

        ;; Use the correct account context when sending mail based on the from header.
        message-sendmail-envelope-from 'header
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")

        mu4e-headers-date-format "%d.%m."

        mu4e-contexts
        `(
          ,(make-mu4e-context
            :name "gmail"
            :enter-func (lambda () (mu4e-message "Switch to tuomo.syvanpera@gmail.com"))
            :match-func (lambda (msg) (when msg
                                   (string-prefix-p "/gmail" (mu4e-message-field msg :maildir))))
            ;; :match-func (lambda (msg)
            ;;               (when msg
            ;;                 (mu4e-message-maildir-matches msg "^/gmail/")
            ;;                 (mu4e-message-contact-field-matches msg :to "tuomo.syvanpera@gmail.com")))
            :vars '(
                    (user-mail-address  . "tuomo.syvanpera@gmail.com")
                    (user-full-name     . "Tuomo Syvänperä")
                    (mu4e-drafts-folder . "/gmail/[Gmail].Drafts")
                    (mu4e-sent-folder   . "/gmail/[Gmail].Sent Mail")
                    (mu4e-trash-folder  . "/gmail/[Gmail].Trash")
                    (mu4e-refile-folder . "/gmail/[Gmail].All Mail")))
          ,(make-mu4e-context
            :name "houston"
            :enter-func (lambda () (mu4e-message "Switch to tuomo.syvanpera@houston-inc.com"))
            :match-func (lambda (msg) (when msg
                                   (string-prefix-p "/houston" (mu4e-message-field msg :maildir))))
            ;; :match-func (lambda (msg)
            ;;               (when msg
            ;;                 (mu4e-message-maildir-matches msg "^/houston/")
            ;;                 (mu4e-message-contact-field-matches msg :to "tuomo.syvanpera@houston-inc.com")))
            :vars '(
                    (user-mail-address  . "tuomo.syvanpera@houston-inc.com")
                    (user-full-name     . "Tuomo Syvänperä")
                    (mu4e-compose-signature . "Tuomo Syvänperä\nSenior Consultant\nHouston Inc.\nKonepajankuja 1, 00510 Helsinki\nwww.houston-inc.com")
                    (mu4e-drafts-folder . "/houston/[Gmail].Drafts")
                    (mu4e-sent-folder   . "/houston/[Gmail].Sent Mail")
                    (mu4e-trash-folder  . "/houston/[Gmail].Trash")
                    (mu4e-refile-folder . "/houston/[Gmail].All Mail"))))))
  ;; (add-hook 'message-send-mail-hook 'choose-msmtp-account))

;;; email.el ends here
