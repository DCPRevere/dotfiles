;; -*- mode: emacs-lisp -*-

(setq comp-settings '(("phobos" .
                       ((font-size . 25)))
                      ("deimos" .
                       ((font-size . 19)))))

;; TODO: this needs to change to manage the case where the key doesn't exist
;; in the map.
(defun fetch-setting (setting)
  (cdr (assoc setting
              (cdr (assoc system-name comp-settings)))))

(defun fetch-font-size ()
  (fetch-setting 'font-size))

;; (setq
;;  dotspacemacs-default-font `("Source Code Pro"
;;                              :size ,(fetch-font-size)
;;                              :weight normal
;;                              :width normal
;;                              :powerline-scale 1.1))


(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '((auto-completion
      :variables
      auto-completion-return-key-behavior              nil
      auto-completion-tab-key-behavior                 'complete
      auto-completion-complete-with-key-sequence       "jk"
      auto-completion-complete-with-key-sequence-delay 0.1
      auto-completion-private-snippets-directory       nil
      auto-completion-enable-snippets-in-popup         t
      auto-completion-enable-sort-by-usage             t)
     (chinese
      :variables
      chinese-enable-youdao-dict t)
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
     (org
      :variables
      org-enable-reveal-js-support t)
     pandoc
     python
     ruby
     scala
     (shell :variables shell-default-term-shell "/usr/bin/zsh")
     shell-scripts
     (spell-checking
      :variables
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
     ycmd)
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
   dotspacemacs-default-font `("Fira mono"
                               ;; :size 17
                               :size ,(fetch-setting 'font-size)
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
   dotspacemacs-whitespace-cleanup nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq tramp-ssh-controlmaster-options
        (concat "-o ControlMaster=auto"
                "-o ControlPath='tramp.%%C'"
                "-o ControlPersist=no")))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Change the powerline seperator
  (setq powerline-default-separator 'arrow)

  ;; Set pyim directory
  (setq pyim-directory "~/.emacs.d/.cache/pyim/")
  (setq pyim-cache-directory (concat pyim-directory "cache/"))
  (setq pyim-dicts-directory (concat pyim-directory "dicts/"))
  (setq pyim-property-file (concat pyim-directory "pyim-words-property.txt"))

  ;; Load org-drill-table
  (load-file "~/.dotfiles/org/org-drill-table.el")

  ;; Set browser to chrome
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "google-chrome")

  ;; Use fancy symbols in Clojure
  (setq clojure-enable-fancify-symbols t)

  ;; Create leader for org-capture
  (spacemacs/set-leader-keys
    "oc" 'org-capture
    "oi" 'toggle-input-method
    "oo" (lambda () (interactive)
           (find-file org-default-notes-file)))

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
  (require 'org-habit)

  ;; (with-eval-after-load 'org
  ;;   (add-to-list 'org-modules 'org-habit)
  ;;   (add-to-list 'org-modules 'org-drill))

  ;; org file locations
  (setq org-agenda-files '("~/org" "~/org/private"))
  (setq org-default-notes-file (concat "~/org/refile.org"))
  (setq org-archive-location "~/org/archive/%s_archive::")

  ;; Refiling
  (setq org-refile-use-outline-path 'file)
  (setq org-refile-targets
        '((org-agenda-files :maxlevel . 1)))

  ;; State keywords
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "REFILE(r)"
           "NEXT(n)"
           "CURR(k)"
           "WAIT(w@)"
           "|"
           "DONE(d@)"
           "CANCELLED(c@)"
           )))
  (setq org-todo-keyword-faces
        '(
          ("REFILE" . "aquamarine")
          ("TODO" . "maroon4")
          ("NEXT" . "maroon3")
          ("CURR" . "maroon2")
          ("WAIT" . "maroon1")
          "|"
          ("DONE" . "olive drab")
          ("CANCELLED" . "dark cyan")
          ))

  ;; Tags
  (setq org-tag-alist '(
                        ("drill" . ?d)
                        ("home" . ?h)
                        ("long" . ?l)
                        ("phone" . ?p)
                        ("self" . ?s)
                        ("work" . ?w)
                        ))

  (setq org-capture-templates
        '(("c"
           "Refile"
           entry
           (file org-default-notes-file)
           "* REFILE %?")))

  ;; Enforce uniform font size in org mode.
  (custom-set-faces
   '(org-level-1 ((t (:inherit org-default :height 1.0))))
   '(org-level-2 ((t (:inherit org-default :height 1.0))))
   '(org-level-3 ((t (:inherit org-default :height 1.0))))
   '(org-level-4 ((t (:inherit org-default :height 1.0))))
   '(org-level-5 ((t (:inherit org-default :height 1.0)))))

  ;; Insert mode hooks
  (add-hook 'org-capture-mode-hook 'evil-insert-state)
  (add-hook 'org-insert-heading-hook 'evil-insert-state)

  ;; Appearance
  ;; bullets have been disabled elsewhere.
  (setq org-startup-indented t))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(pyim-dicts
   (quote
    ((:name
      "BigDict-01"
      :file
      "/home/dare/.emacs.d/.cache/pyim/dicts/pyim-bigdict.pyim.gz"
      :coding
      utf-8-unix
      :dict-type
      pinyin-dict))))
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "7db4f811c922b96af34ed003edb27f976e19cfaabfeab11a5c54e3e0c27ba149" "e64111716b1c8c82638796667c2c03466fde37e69cada5f6b640c16f1f4e97df" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" default)))
 '(evil-want-Y-yank-to-eol nil))
