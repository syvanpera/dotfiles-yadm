;;; doom-onedark-theme.el --- inspired by Gruvbox
(require 'doom-themes)

;;
(defgroup doom-onedark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

;;
(def-doom-theme doom-onedark
  "A dark theme inspired by One Dark"

  ;; name        default   256 16
  ((bg         '("#282c34" nil nil))
   (bg-alt     '("#2C323C" nil nil))
   (base0      '("#1B2229" nil nil))
   (base1      '("#1C1F24" nil nil))
   (base2      '("#202328" nil nil))
   (base3      '("#23272e" nil nil))
   (base4      '("#5C6773" nil nil))
   (base5      '("#5B6268" nil nil))
   (base6      '("#73797E" nil nil))
   (base7      '("#9CA0A4" nil nil))
   (base8      '("#eceff4" nil nil))
   (fg         '("#d8dee9" nil nil))
   (fg-alt     '("#5B6268" nil nil))

   (grey       base4)
   (red        '("#e06c75" nil nil))
   (orange     '("#d19a66" nil nil))
   (green      '("#98c379" nil nil))
   (teal       '("#56b6c2" nil nil))
   (yellow     '("#e5c07b" nil nil))
   (blue       '("#61afef" nil nil))
   (dark-blue  '("#528bff" nil nil))
   (magenta    '("#b48ead" nil nil))
   (violet     '("#c678dd" nil nil))
   (cyan       '("#B16286" nil nil))
   (dark-cyan  '("#7e0097" nil nil))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        blue)
   (comments       grey)
   (doc-comments   (doom-lighten green 0.25))
   (constants      violet)
   (functions      yellow)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           violet)
   (strings        green)
   (variables      (doom-lighten red 0.4))
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   (hidden     `(,(car bg) "black" "black"))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0)))
   (modeline-bg-l `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0)))
   (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground yellow)

   (font-lock-comment-face
    :foreground comments)
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (mode-line
    :background modeline-bg :foreground modeline-fg)
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt)
   (mode-line-emphasis
    :foreground highlight)

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l)
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l)

   ;; Doom modeline
   (doom-modeline-bar :background highlight)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)

   ;; ivy-mode
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-onedark-theme.el ends here
