;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers '(
                                       (auto-completion :variables
                                                        auto-completion-return-key-behavior              nil
                                                        auto-completion-tab-key-behavior                 'complete
                                                        auto-completion-complete-with-key-sequence       "jk"
                                                        auto-completion-complete-with-key-sequence-delay 0.1
                                                        auto-completion-private-snippets-directory       nil
                                                        auto-completion-enable-snippets-in-popup         t
                                                        auto-completion-enable-sort-by-usage             t)
                                       chinese
                                       clojure
                                       csharp
                                       docker
                                       emacs-lisp
                                       emoji
                                       git
                                       go
                                       gtags
                                       helm
                                       html
                                       java
                                       javascript
                                       latex
                                       markdown
                                       (org :variables
                                            org-enable-reveal-js-support t)
                                       pandoc
                                       python
                                       ruby
                                       scala
                                       shell
                                       shell-scripts
                                       (spell-checking :variables
                                                       spell-checking-enable-by-default nil)
                                       sql
                                       syntax-checking
                                       themes-megapack
                                       vagrant
                                       version-control
                                       vimscript
                                       windows-scripts
                                       xkcd
                                       yaml
                                       ycmd
                                       )
   dotspacemacs-additional-packages '(org-plus-contrib)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(org-bullets)
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(zenburn
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Fira mono"
                               :size 17
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.2
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Use fancy symbols in Clojure
  (setq clojure-enable-fancify-symbols t)

  ;; Create leader for org-capture
  (spacemacs/set-leader-keys
    "oc" 'org-capture)

  ;; Move backups to .emacs-saves/
  (setq backup-directory-alist '(("." . "~/.emacs-saves")))
  (setq backup-by-copying nil)

  ;; Make line centered and highlighted
  (global-centered-cursor-mode t)
  (global-hl-line-mode t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;        ORG MODE        ;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; org plus contrib
  (require 'org-drill)

  ;; org file locations
  (setq org-agenda-files '("~/org"))
  (setq org-default-notes-file (concat "~/org/refile.org"))
  (setq org-archive-location "~/org/archive/%s_archive::")

  ;; Refiling
  (setq org-refile-use-outline-path 'file)
  (setq org-refile-targets '((org-agenda-files :maxlevel . 1)))

  ;; State keywords
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "NEXT(n)"
           "CURR(k)"
           "WAIT(w@)"
           "|"
           "DONE(d@)"
           "CANCELLED(c@)"
           )))
  (setq org-todo-keyword-faces
        '(("TODO" . "maroon4")
          ("NEXT" . "maroon3")
          ("CURR" . "maroon2")
          ("WAIT" . "maroon1")
          "|"
          ("DONE" . "olive drab")
          ("CANCELLED" . "dark cyan")
          ))

  ;; Tags
  (setq org-tag-alist '(("home" . ?h)
                        ("long" . ?l)
                        ("drill" . ?d)
                        ("work" . ?w)))

  ;; Insert mode hooks
  (add-hook 'org-capture-mode-hook 'evil-insert-state)
  (add-hook 'org-insert-heading-hook 'evil-insert-state)

  ;; Appearance
  ;; bullets have been disabled elsewhere.
  (setq org-startup-indented t)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
