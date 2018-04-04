;; -*- mode: emacs-lisp -*-

(setq comp-settings '(("phobos" .
                       ((font-size . 21)))
                      ("nixos" .
                       ((font-size . 12)))
                      ("deimos" .
                       ((font-size . 12)))))

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
     colors
     clojure
     csharp
     docker
     emacs-lisp
     emoji
     finance
     git
     go
     gtags
     haskell
     helm
     html
     java
     javascript
     latex
     (markdown
      :variables
      markdown-live-preview-engine 'vmd
      markdown-command "pandoc")
     nixos
     (org
      :variables
      org-enable-reveal-js-support t)
     octave
     pandoc
     pdf-tools
     python
     (ranger
      :variables
      ranger-show-preview t)
     ruby
     scala
     (shell
      :variables
      shell-default-shell 'ansi-term
      shell-default-term-shell "/bin/zsh")
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
   dotspacemacs-additional-packages '(org-plus-contrib
                                      autothemer)
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
   dotspacemacs-themes '(sanityinc-tomorrow-eighties
                         darktooth
                         monokai
                         solarized-dark
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font `("Fira mono"
                               :size ,(fetch-setting 'font-size)
                               :weight normal
                               :width normal
                               :slant normal
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

  ;; Eclim
  (setq eclim-eclipse-dirs '("~/Downloads/eclipse")
        eclim-executable "~/Downloads/eclipse/plugins/org.eclim_2.7.2/bin/eclim"
        eclimd-executable "~/Downloads/eclipse/plugins/org.eclim_2.7.2/bin/eclimd"
        eclimd-default-workspace "~/opt/workspace")

  ;; Drools mode
  ;; (add-to-list 'load-path "/home/dare/git/elisp/rules-editing-mode")
  (load-file "/home/dare/git/elisp/rules-editing-mode/drools-mode.el")
  (add-to-list 'auto-mode-alist '("\\.drl$" . drools-mode))

  ;; Use 2 space indent for C-style code
  (setq c-basic-offset 2)

  ;; Change the powerline seperator
  (setq powerline-default-separator 'nil)

  ;; Set pyim directory
  (setq pyim-directory "~/.emacs.d/.cache/pyim/")
  (setq pyim-cache-directory (concat pyim-directory "cache/"))
  (setq pyim-dicts-directory (concat pyim-directory "dicts/"))
  (setq pyim-property-file (concat pyim-directory "pyim-words-property.txt"))

  ;; Load org-drill-table
  (load-file "~/.dotfiles/org/org-drill-table.el")

  ;; Set browser to chrome
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "firefox")

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

  ;; Truncate lines by default
  (spacemacs/toggle-truncate-lines-on)
  ;; and navigate by visual lines
  (add-hook 'text-mode-hook
            'spacemacs/toggle-visual-line-navigation-on)

  ;; (setq fill-column 60)
  (spacemacs/toggle-fill-column-indicator-on)

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
  (setq org-agenda-files '("~/org"
                           "~/org/blog"
                           "~/org/client"
                           "~/org/private"
                           "~/org/writing"))
  (setq org-default-notes-file (concat "~/org/capture.org"))
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
           "WAIT(w)"
           "SOMEDAY(s)"
           "|"
           "DONE(d)"
           "CANCELLED(c)")))

  (setq org-todo-keyword-faces
        '(("REFILE" . "aquamarine")
          ("SOMEDAY" . "sea green")
          ("TODO" . "maroon4")
          ("NEXT" . "maroon3")
          ("CURR" . "maroon2")
          ("WAIT" . "maroon1")
          "|"
          ("DONE" . "olive drab")
          ("CANCELLED" . "dark cyan")))

  ;; Tags
  (setq org-tag-alist '(("drill" . ?d)
                        ("anywhere" . ?a)
                        ("home" . ?h)
                        ("long" . ?l)
                        ("phone" . ?p)
                        ("read" . ?r)
                        ("self" . ?s)
                        ("work" . ?w)))

  (setq org-capture-templates
        '(("c"
           "Refile"
           entry
           (file org-default-notes-file)
           "* REFILE %?")))

  ;; Fit tags to screen.
  (setq org-tags-column 0)

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
 '(custom-safe-themes
   (quote
    ("e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "c90fd1c669f260120d32ddd20168343f5c717ca69e95d2f805e42e88430c340e" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "5acb6002127f5d212e2d31ba2ab5503df9cd1baa1200fbb5f57cc49f6da3056d" "2d16f85f22f1841390dfc1234bd5acfcce202d9bb1512aa8eabd0068051ac8c3" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "a4d03266add9a1c8f12b5309612cbbf96e1291773c7bc4fb685bfdaf83b721c6" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "444238426b59b360fb74f46b521933f126778777c68c67841c31e0a68b0cc920" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "21ebd14a266a6fe91980a5493a411cf6b7f27fd62da2bada897361ab7c4b2a98" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "889a93331bc657c0f05a04b8665b78b3c94a12ca76771342cee27d6605abcd0e" "23ccf46b0d05ae80ee0661b91a083427a6c61e7a260227d37e36833d862ccffc" "c39ae5721fce3a07a27a685c08e4b856a13780dbc755a569bb4393c932f226d7" "fa1f7bdb40327d08bd35a0f5d5d8f13d2a863a8f37c45b96d2439861e944490a" "63dd8ce36f352b92dbf4f80e912ac68216c1d7cf6ae98195e287fd7c7f7cb189" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "5e2dc1360a92bb73dafa11c46ba0f30fa5f49df887a8ede4e3533c3ab6270e08" "de5261b9a087280fa6e931a5090703e52d04b545be4c2d95340840cd6f763f6a" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" "4d0ef970adb1f147ca9aeda343f910e9ea9bac82c881abc89b3ab1998eceb12a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "7db4f811c922b96af34ed003edb27f976e19cfaabfeab11a5c54e3e0c27ba149" "e64111716b1c8c82638796667c2c03466fde37e69cada5f6b640c16f1f4e97df" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" default)))
 '(evil-want-Y-yank-to-eol nil)
 ;; '(org-agenda-files
 ;;   (quote
 ;;    ("/home/dare/org/academia.org" "/home/dare/org/calendar.org" "/home/dare/org/capture.org" "/home/dare/org/code.org" "/home/dare/org/email.org" "/home/dare/org/media.org" "/home/dare/org/stories.org" "/home/dare/org/tasks.org" "/home/dare/org/tech.org")))
 '(package-selected-packages
   (quote
    (white-sand-theme rebecca-theme pyim pyim-basedict org-category-capture org-mime exotica-theme ghub nix-mode helm-nixos-options company-nixos-options nixos-options zonokai-theme zenburn-theme zen-and-art-theme youdao-dictionary names chinese-word-at-point yapfify yaml-mode xterm-color xkcd ws-butler winum which-key web-mode web-beautify volatile-highlights vmd-mode vimrc-mode vi-tilde-fringe vagrant-tramp vagrant uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme sql-indent spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme restart-emacs rbenv ranger rake rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme powershell popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pdf-tools pcre2el pastels-on-dark-theme paradox pangu-spacing pandoc-mode ox-reveal ox-pandoc ht orgit organic-green-theme org-projectile org-present org-pomodoro alert log4e gntp org-plus-contrib org-download open-junk-file omtose-phellack-theme omnisharp shut-up oldlace-theme occidental-theme obsidian-theme noflet noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint light-soap-theme less-css-mode ledger-mode js2-refactor js2-mode js-doc jbeans-theme jazz-theme ir-black-theme intero insert-shebang inkpot-theme info+ indent-guide hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-hoogle helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md ggtags gandalf-theme fuzzy flyspell-correct-helm flyspell-correct flycheck-ycmd flycheck-pos-tip flycheck-ledger flycheck-haskell flycheck flx-ido flx flatui-theme flatland-theme fish-mode firebelly-theme find-by-pinyin-dired fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree espresso-theme eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat django-theme diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csharp-mode company-ycmd ycmd request-deferred let-alist request deferred company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-go go-mode company-ghci company-ghc ghc haskell-mode company-emoji company-emacs-eclim eclim company-cabal company-auctex company-anaconda company column-enforce-mode color-theme-sanityinc-solarized color-identifiers-mode coffee-mode cmm-mode clues-theme clojure-snippets clj-refactor hydra inflections edn multiple-cursors paredit peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl chruby chinese-pyim chinese-pyim-basedict pos-tip cherry-blossom-theme busybee-theme bundler inf-ruby bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme autothemer auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed auctex apropospriate-theme anti-zenburn-theme anaconda-mode pythonic f dash s ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-pinyin pinyinlib ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup color-theme-sanityinc-tomorrow)))
 '(pyim-dicts
   (quote
    ((:name "BigDict-01" :file "/home/dare/.emacs.d/.cache/pyim/dicts/pyim-bigdict.pyim.gz" :coding utf-8-unix :dict-type pinyin-dict)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
