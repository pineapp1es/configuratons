;;; ... -*- lexical-binding: t; -*-

;; add extra files to load path
(add-to-list 'load-path "~/.emacs.extra")

;; make emacs customize stuff go here pls
(setopt custom-file "~/.emacs.extra/.emacs.custom.el")
(load-file custom-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; diminish stuff from modeline
(require 'diminish)

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
(use-package ivy-prescient :diminish)
;; company mode completion
(use-package company :diminish)

;; do this for some reason or else warning
(setopt evil-want-keybinding nil)
;; vim keybinds - EVIL MODE
(use-package evil :diminish)
;; undo fu for evil mode undo redoing
(use-package undo-fu)
;; for evil motions g; and g,
(use-package goto-chg)
;; vim in places where evil doesnt fully support
(use-package evil-collection :diminish)

;; ace-window ! - switch b/w windows with keyboard keys thing
(use-package ace-window)

;; workspaces - persp-mode.el !
(use-package perspective)

;; woah multi edit with multiple cursor
;; (use-package multiple-cursors) ; real multiple cursor
(use-package evil-multiedit) ;multiple cursors for evil mode

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

;; anzu mode to show number of matches
(use-package anzu
  :diminish
  :init (global-anzu-mode +1))

;; programmer language stuff
(use-package kotlin-mode)
(use-package typescript-mode)
(use-package eglot-java)
(use-package pyvenv)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONFIGURATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setopt shell-command-switch "-ic")

(add-to-list 'default-frame-alist '(width . 80))  ; Width set to 80 characters
(add-to-list 'default-frame-alist '(height . 34)) ; Height set to 24 lines

;; dont want eldoc in modeline
(diminish 'eldoc-mode)
;; dont want autorevertmode in modeline (ARev)
(diminish 'auto-revert-mode)

;; gruvbox themer
(load-theme 'gruvbox-dark-soft :NO-CONFIRM)
;; FONT FACE
;; (set-frame-font "Iosevka 13")
(add-to-list 'default-frame-alist `(font . , "Iosevka 13"))

;; enable ivy comleton
(ivy-mode 1)
;;(setopt ivy-prescient-enable-sorting nil)
(ivy-prescient-mode 1)

;; company mode ON
(add-hook 'after-init-hook 'global-company-mode)

;; enable vim keybind -evilmode
(setopt evil-want-C-u-scroll t)
(evil-mode 1)
(evil-collection-init)
;; dont want "unimpaired" in modeline
(diminish 'evil-collection-unimpaired-mode)
(diminish 'global-evil-collection-unimpaired-mode)

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

;; comp mode keybind
(global-set-key (kbd "C-x C-c") 'compile)

;; revert buffer keybind
(global-set-key (kbd "C-c b r") 'revert-buffer)

;; always show line numbers
(global-display-line-numbers-mode 1)
;; relative line numbers (set in .emacs.custom.el)
;; (setopt display-line-numbers-type "relative")

;; dont show the emacs launch splash screen startup message thing
(setopt inhibit-startup-message t)
(defun display-startup-echo-area-message ()
  (message ""))

;; custom emacs window title bar name
(setopt frame-title-format '("%b    |    E M A C S")
      icon-title-format frame-title-format)

;; scratch buffer msg
(setopt initial-scratch-message ";; hi
")

;; dont make backup files
(setopt make-back-files nil)

;; incremental search keybind
(global-set-key (kbd "C-s") 'isearch-forward)

;; stop quitting bymistake
(global-unset-key (kbd "C-z"))

;; send all deletions to trash
(setq delete-by-moving-to-trash t)

;; ============================
;;         PROGRAMMER
;; ============================

;; ----------- EGLOT ----------------
(use-package eglot
  :config
  (setq eglot-report-progress nil)
  :bind
  (
   ("M-RET" . eglot-code-actions)
   ("C-c k" . eldoc-print-current-symbol-info)
   ("C-c r" . eglot-rename)
   ("C-c d" . eglot-find-implementation)
   ))
;; (global-set-key (kbd "M-RET") eglot-code-actions)
;; (global-set-key (kbd "C-c C-r") eglot-rename)
;; (global-set-key (kbd "C-c C-d") eglot-find-implementation)
;; (global-set-key (kbd "C-c C-k") eldoc)
;; ----------- PYTHON

(add-to-list 'eglot-server-programs
               `(python-mode
                 . ,(eglot-alternatives '(("pylsp")))))

(add-to-list 'eglot-server-programs
             `(kotlin-mode
                 . ("/mnt/shared/linux/programs/kotlin-server-262.7569.0/bin/intellij-server" "--stdio")))

;; ----------- JAVA
;; (add-hook 'java-mode-hook 'eglot-java-mode)
(add-hook 'java-mode-hook
          (lambda () (setq flycheck-java-ecj-jar-path "/mnt/shared/linux/programs/eclipsejavabatchcompiler/ecj-4.40.jar")))

;; ============================
;;            DIRED
;; ============================

(setopt dired-async-mode t)

(defun dired-do-delete-skip-trash (&optional arg)
  (interactive "P")
  (let ((delete-by-moving-to-trash nil))
    (dired-do-delete arg)))

;; ============================
;;            EMMS
;; ============================

(emms-all)
(add-hook 'emms-playlist-source-inserted-hook 'emms-playlist-shuffle)
(add-hook 'emms-player-started-hook 'emms-show)
(setopt emms-mode-line-icon-color "red")
(require 'emms-player-mpd)
(defun pauseOrShow ()
  (if emms-player-paused-p
      (message "Music is paused.")
    (emms-show)))

(setopt emms-player-paused-hook '(emms-playing-time-pause emms-lyrics-pause pauseOrShow))

(setopt emms-player-list '(emms-player-mpv)
      emms-info-functions 'emms-info-native
      emms-add-directory-tree "/mnt/shared/moosic/")
(setopt emms-info-asynchronously nil)
(setopt emms-playlist-buffer-name "*Music*")
(setq-default
        emms-source-file-default-directory "/mnt/shared/moosic/"

        emms-source-playlist-default-format 'm3u
        emms-playlist-mode-center-when-go t
        emms-playlist-default-major-mode 'emms-playlist-mode
        emms-show-format "| Now Playing: %s |"

        emms-player-mpv-environment '("PULSE_PROP_media.role=music")
        emms-player-mpv-parameters '("--quiet" "--really-quiet" "--no-audio-display" "--force-window=no" "--vo=null")

        emms-volume-change-function 'emms-volume-mpv-change
        emms-volume-mpv-method 'smart
        )

(global-set-key (kbd "C-c m x") 'emms-pause)
(global-set-key (kbd "C-c m -") 'emms-volume-lower)
(global-set-key (kbd "C-c m =") 'emms-volume-raise)
(global-set-key (kbd "C-c m l") 'emms-next)
(global-set-key (kbd "C-c m h") 'emms-previous)
(global-set-key (kbd "C-c m b") 'emms-smart-browse)
(global-set-key (kbd "C-c m X") 'emms-stop)
(global-set-key (kbd "C-c m c") 'emms-play-playlist)
(global-set-key (kbd "C-c m p") 'emms-playlist-mode-go)
(global-set-key (kbd "C-c m s") 'emms-playlist-shuffle)
(global-set-key (kbd "C-c m ?") 'emms-show)
(global-set-key (kbd "C-c m d") 'emms-play-dired)


;; ============================
;;          ORG-MODE
;; ============================

(defun my-org-faces ()
  (set-face-attribute 'org-document-title nil :height 2.5)
  (set-face-attribute 'org-document-info nil :height 2.5)
  (set-face-attribute 'org-document-info-keyword nil :height 0.5)
  (set-face-attribute 'org-level-1 nil :height 2.0)
  (set-face-attribute 'org-level-2 nil :height 1.5)
  (set-face-attribute 'org-level-3 nil :height 1.3)
  (set-face-attribute 'org-level-4 nil :height 1.2)
  (set-face-attribute 'org-level-5 nil :height 1.1)
  )

(add-hook 'org-mode-hook #'my-org-faces)

;; indent headings
(require 'org-indent)
(setq org-startup-indented t)

;; darken code blocks
(require 'color)
(set-face-attribute 'org-block nil :background "#389b36573535")

;; ============================
;;       EVIL-MULTIEDIT
;; ============================

(require 'evil-multiedit)
(evil-multiedit-default-keybinds)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FROM OTHER PPL CONFIG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Mr Skybert ------------------------------------------------------------------------------
;; https://gitlab.com/skybert/my-little-friends/-/blob/master/emacs/.emacs
;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
;; Inspired by https://www.emacswiki.org/emacs/KillingBuffer
;; original name - (defun tkj/kill-all-other-buffers () - only deleted the buffers
;; edited version - removes other windows and switches to scratch buffer
(defun kill-all-buffer-n-windows ()
  "Kill all other buffers, except the special ones, like *vterm*."
  (interactive)
  (mapc
   (lambda (buffer)
     (when (and (buffer-live-p buffer)
                (not (string-match-p "\\*.*\\*" (buffer-name buffer))))
       (kill-buffer buffer)))
   (buffer-list))
  (switch-to-buffer "*scratch*") ;; added by me
  (delete-other-windows)         ;; added by me
  )
(global-set-key (kbd "C-c b k a") 'kill-all-buffer-n-windows)
;; -----------------------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; TEMPORARY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "loaded config!")
(message "hi")
