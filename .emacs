(require 'cl)

(setq package-list
     '(
       centered-cursor-mode
       color-theme-sanityinc-tomorrow
       evil
       evil-leader
       evil-magit
       evil-org
       evil-surround
       jedi
       linum-relative
       magit
       markdown-mode
       org
       powerline
       python-mode
       rainbow-mode
       relative-line-numbers
       yaml-mode
       ycmd
       zenburn-theme
       ))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ;;("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ))

(setq package-enable-at-startup nil)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
	(package-install package)))


(add-to-list 'load-path "~/.emacs.d/lisp/")
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; startup display
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(powerline-default-theme)

(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-eighties t)

(set-default-font "Hack")

(setq visual-line-mode t)

(require 'centered-cursor-mode)
(global-centered-cursor-mode 1)

;; backup
(setq backup-directory-alist '(("." . "~/.emacs-saves")))
(setq backup-by-copying t)

;; I always accidentally write regions
(put 'write-region 'disabled t)

;; define a python template
;; copied from 'code like a pythonista'
(define-skeleton python-skeleton
  "Inserts a Python skeleton as described in 'Code like a pythonista'." nil
  "\'\'\'module docstring\'\'\'" \n
  "" \n
  "# imports" \n
  "# constants" \n
  "# exception classes" \n
  "# interface functions" \n
  "# classes" \n
  "# internal functions & classes" \n
  "" \n
  "def main(...):" \n
  "    ..." \n
  "" \n
  "if __name__ == '__main__':" \n
  "    status = main()" \n
  "    sys.exit(status)" \n
  )

(add-hook 'after-init-hook 'global-company-mode)

;; rainbow mode
(require 'rainbow-mode)
(setq rainbow-html-colors nil)

;;
;; org-mode settings
;;

(require 'org)

(add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(setq org-startup-indented t)
(setq org-ellipsis " \u25bc" )

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-default-notes-file (concat "~/org/refile.org"))
(setq org-agenda-files '("~/org"))
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets '((org-agenda-files :maxlevel . 9)))

;; capture templates
(setq org-capture-templates
      '(("b" "Backlog" entry (file+headline "~/org/refile.org" "Backlog")
	 "* BACKLOG %?")
	("t" "Today" entry (file+headline "~/org/refile.org" "Tasks")
	 "* TODAY %?")
	("n" "Note" entry (file+headline "~/org/refile.org" "Notes")
	 "* REVIEW %?")
	)) 

(setq org-todo-keywords
      '((sequence "BACKLOG"
		  "FUTURE"
		  "THIS WEEK"
		  "TODAY"
		  "IN PROGRESS"
		  "DEPENDENCY"
		  "|"
		  "DONE")))

;; define a custom color palette
(setq color-dark-grey  "#999999" )
(setq color-light-grey "#cccccc" )
(setq color-red        "#f2777a" )
(setq color-orange     "#f99157" )
(setq color-yellow     "#ffcc66" )
(setq color-blue       "#6699cc" )
(setq color-green      "#99cc99" )

(setq org-todo-keyword-faces
      (quote (("BACKLOG"     . (:foreground "#999999" :weight bold))
              ("FUTURE"      . (:foreground "#cccccc" :weight bold))
              ("THIS WEEK"   . (:foreground "#f2777a" :weight bold))
              ("TODAY"       . (:foreground "#f99157" :weight bold))
              ("IN PROGRESS" . (:foreground "#ffcc66" :weight bold))
              ("DEPENDENCY"  . (:foreground "#6699cc" :weight bold))
              ("DONE"        . (:foreground "#99cc99" :weight bold))
	      )))

;; #66cccc #cc99cc

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (ditaa . t)
   ))

;; Allows export to odt
(setq exec-path (append exec-path '("C:/Users/danielr/.babun/cygwin/bin/")))

;;
;; evil-mode settings
;;

(require 'evil)

;; evil-leader
 
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-leader/set-key
  "c" 'org-capture
  "e" 'eval-region
  "g" 'magit-status
  "k" 'kill-buffer
  "p" 'package-install
  "s" 'switch-to-buffer
  "x" 'execute-extended-command
  )

(require 'evil-org)

;; evil-magit

;; (require 'evil-magit)

;; evil-surround

(require 'evil-surround)
(global-evil-surround-mode 1)

;; evil-mode

(require 'evil)
(evil-mode t)

;; I dislike the behaviour of 'o' and 'O' in evil-org.
;; I redfine them to their evil-mode maps.
(evil-define-key 'normal evil-org-mode-map
  "o" 'evil-open-below
  "O" 'evil-open-above)

;; Change window keys
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(put 'downcase-region 'disabled nil)

(setq evil-emacs-state-cursor    '( "#ffcc66" box)
      evil-normal-state-cursor   '( "#ffcc66" box)
      evil-visual-state-cursor   '( "#ffcc66" box)
      evil-insert-state-cursor   '( "#ffcc66" bar)
      evil-replace-state-cursor  '( "#ffcc66" bar)
      evil-operator-state-cursor '( "#ffcc66" hollow))

;;
;; custom
;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
