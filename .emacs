(require 'cl)

(setq package-list
    '(centered-cursor-mode
		evil
		evil-leader
		jedi
		magit
		markdown-mode
		org
		powerline
		python-mode
		relative-line-numbers
		yaml-mode
		ycmd
		zenburn-theme))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
	(package-install package)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-startup-message t)

(powerline-default-theme)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'zenburn t)

(set-default-font "Hack")

(require 'centered-cursor-mode)
(global-centered-cursor-mode 1)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) 

;;
;; ycm
;;

;; (require 'ycmd)
;; (add-hook 'after-init-hook #'global-ycmd-mode)
;; 
;; (set-variable 'ycmd-server-command '("python" "/home/dare/.emacs.d/elpa/ycmd-0.9"))

;;
;; org-mode settings
;;

(add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-default-notes-file (concat "~/org/refile.org"))

(setq org-agenda-files (quote ("~/org/refile.org"
			       "~/org/todo.org"
			       "~/org/calastone.org")))

(setq org-todo-keywords
      '((sequence "BACKLOG"
		  "THIS WEEK"
		  "TODAY"
		  "IN PROGRESS"
		  "|"
		  "DONE")))

(setq org-todo-keyword-faces
      (quote (("BACKLOG" :foreground "brown" :weight bold)
              ("THIS WEEK" :foreground "red" :weight bold)
              ("TODAY" :foreground "magenta" :weight bold)
              ("IN PROGRESS" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold))))
;;
;; evil-mode settings
;;

(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-mode t)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(put 'downcase-region 'disabled nil)
