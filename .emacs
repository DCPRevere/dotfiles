;; Aaron Bieber's evil-mode guide
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'org)

;; (require 'relative-line-numbers)

(require 'centered-cursor-mode)

(require 'zenburn-theme)
;;(zenburn-theme t)

(require 'helm-config)

;; (require 'magit)
;; (magit t)

(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'evil)
(evil-mode t)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
