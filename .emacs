;;; ... -*- lexical-binding: t; -*-


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Initialize package sources
(setopt package-archives '(
                           ("org" . "https://orgmode.org/elpa/")
                           ("elpa" . "https://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")
                           ))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(require 'use-package)
(setopt use-package-always-ensure t)

;; download gruvbox theme!!!
(use-package gruvbox-theme)

;; download ivy completion!!! also set keysbinds
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  )
(use-package ivy-prescient)
;; do this for some reason or else warning
(setopt evil-want-keybinding nil)
;; vim keybinds - EVIL MODE
(use-package evil)
;; undo fu for evil mode undo redoing
(use-package undo-fu)
;; for evil motions g; and g,
(use-package goto-chg)
;; vim in places where evil doesnt fully support
(use-package evil-collection)

;; ace-window ! - switch b/w windows with keyboard keys thing
(use-package ace-window)

;; workspaces - persp-mode.el !
(use-package perspective)

;; woah multi edit with multiple cursor
(use-package multiple-cursors)

;; magic git ui?? magit
(use-package magit)

;; organiser moder
(use-package org)

;; browsing the kill ring
(use-package browse-kill-ring)

;; music player??
(use-package emms)

;; syntax checking
(use-package flycheck)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONFIGURATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'default-frame-alist '(width . 80))  ; Width set to 80 characters
(add-to-list 'default-frame-alist '(height . 34)) ; Height set to 24 lines

;; make emacs customize stuff go here pls
(setq custom-file "~/.emacs.custom.el")

;; gruvbox themer
(load-theme 'gruvbox-dark-soft :NO-CONFIRM)
;; FONT FACE
(set-frame-font "Iosevka 13")

;; enable ivy comleton
(ivy-mode 1)
(setopt ivy-prescient-enable-sorting nil)
(ivy-prescient-mode 1)

;; enable vim keybind -evilmode
(setopt evil-want-C-u-scroll t)
(evil-mode 1)
(evil-collection-init)

;; set ace window keys
(setopt aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(global-set-key (kbd "M-o") 'ace-window)
(evil-define-key 'normal 'global (kbd "C-w C-w") 'ace-window)

;; key to switch to scratch buffer
(global-set-key (kbd "C-x C-z") 'scratch-buffer)

;; enable workspaces with persp mode
(setopt persp-mode-prefix-key (kbd "C-c p"))
(persp-mode 1)

;; disable tool bar
(tool-bar-mode 0)
;; disable menu bar
(menu-bar-mode 0)
;; disable scrollbar
(scroll-bar-mode 0)
;; enable visualisation for matching parenthesis
(show-paren-mode 1)

;; enable visible bell
(setopt visible-bell t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; always show line numbers
(global-display-line-numbers-mode 1)
;; relative line numbers
(setopt display-line-numbers 'relative)

;; dont show the emacs launch splash screen startup message thing
(setopt inhibit-startup-message t)

;; custom emacs window title bar name
(setopt frame-title-format '("%b    |    E M A C S")
      icon-title-format frame-title-format)

;; scratch buffer msg
(setopt initial-scratch-message ";; scratch
")

;; dont make backup files
(setopt make-back-files nil)

(message "loaded config!")
(message "hi")
