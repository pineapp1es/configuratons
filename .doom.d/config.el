;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; |0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000|
;; |+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- beginning of my configuration +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-|
;; |0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000|

;; ============================
;;           TESTING
;; ============================
(setenv "LSP_USE_PLISTS" "true")

;; nothing to test...
;; (defun my-org-escape-angle-brackets (backend)
;;   "Escape <...> that are not timestamps, during export only.
;; Does NOT modify the original Org file."
;;   (when (org-export-derived-backend-p backend 'md)
;;     (goto-char (point-min))
;;     (while (re-search-forward "<\\([^<> \t\n]+\\)>" nil t)
;;       (let* ((match (match-string 0))
;;              (is-timestamp (ignore-errors (org-parse-time-string match t))))
;;         (unless is-timestamp
;;           (replace-match (concat "\\" (substring match 0 -1) "\\" (substring match -1 nil) ) t t))))))

;; (add-hook 'org-export-before-processing-hook
;;           #'my-org-escape-angle-brackets)
(require 'hide-mode-line)
;; ============================

;; |-------------------------------------------------------------------------------------------------------------------------------------------|
;; |++++++++++++++++++++++++++++++++++++++++++++++++++++++           !VANITY!            ++++++++++++++++++++++++++++++++++++++++++++++++++++++|
;; |-------------------------------------------------------------------------------------------------------------------------------------------|

;; ============================
;;          GENERAL
;; ============================

;; oooooo THEME ooooooo
;; default
(setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-snazzy)
;; dark mode
(defun dark-mode-theme ()
  (interactive)
  (load-theme 'doom-gruvbox))

;; light mode
(defun light-mode-theme ()
  (interactive)
  (load-theme 'doom-gruvbox-light))

;; oooooo FONT  ooooooo
(setq! doom-font (font-spec :family "Unifont" :size 18 :weight 'medium))
;; (setq! doom-font (font-spec :family "IBM Plex Mono" :size 15 :weight 'medium))

;; change the git file/dir name background color in vterm to make the file/dir name readable
(after! vterm
  (set-face-attribute 'vterm-color-green nil :background "black")
  )

;; maximize window frame on open
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
;; remove title bar
;; (add-to-list 'default-frame-alist '(undecorated . t))
;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (set-frame-parameter frame 'alpha-background 90)))
;; (when (and (boundp 'initial-frame) initial-frame)
;;   (set-frame-parameter initial-frame 'alpha-background 90))

;; dont jump windows while scrolling
(setq scroll-conservatively 1000)

;; ============================
;;   DASHBOARD CUSTOMIZATION
;; ============================
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-loaded)
(setq! +doom-dashboard-functions '(#[(&rest _) ((hide-mode-line-mode 1)) (t)] doom-dashboard-widget-banner))
(setq! +doom-dashboard--width 80)
(setq! +doom-dashboard-name "P I N E A P P L E")
(setq frame-title-format '("%b    |    E M A C S")
      icon-title-format frame-title-format)


(defun my-ascii-art ()
  (let* ((banner '(
                   "                                          ⠒⠦⣄⣠⠄                            "
                   "                                          ⣠⠀⠀⢹⣿⡆                           "
                   "                                         ⣠⡏⠀⠀⢸⣿⣧                           "
                   "                                         ⢀⣿⠀⠀⠀⣾⣿⡟⡆         ⣀⡀              "
                   "                                         ⣾⡿⣆⠀⢰⣿⣿⡇⢹      ⣠⣴⣾⡟               "
                   "                                        ⢀⡏⠀⠹⣆⣾⣿⣷⠇⠘⡇  ⢠⣴⣿⣿⣿⡿                "
                   "                                 ⣀⡤⣶⠖⣤  ⢸⠀⠀⠀⣿⣿⣿⡟⠀⠀⢧⣤⣾⣿⣿⣿⡏⢠⠃   ⢠⠏           "
                   "                          ⢀⡀    ⠚⠛⠛⢻⡀⠈⠳⣄⢸⠀⠀⠀⠀⢹⣿⣿⣦⣀⡀⢸⣿⣯⠛⢻⣿⣶⡟  ⢀⣤⣿           "
                   "                           ⠙⢶⢤⡀     ⣇⠀⠀⠈⣿⠀⠀⠀⠘⣿⣿⣿⣽⣻⣿⣿⣿⡷⠋⠙⡿ ⣠⠔⣉⣠⠇            "
                   "                            ⠈⠆⠙⠲⣄⡀  ⢻⠀⠀⠀⠸⣇⠀⠀⠀⣿⣿⣿⣿⣿⣾⣿⣿⣷⠶⠞⠛⣿⠹⠶⢿⡟             "
                   "                            ⢤⡀⠄⠀⠈⠻⣤ ⢘⣦⠀⣦⣼⣧⠀⠀⠀⢻⣿⣿⣿⣿⠟⠃⠋⠀⠀⠀⠀⣿⣶⣤⡄⠃⣀⣤⣤⣶⡿⠁       "
                   "                    ⠈⠙⠛⠻⢿⣆⠠⣄⡈⢻⣷⣔⢦⡀⠈⣷⣽⣿⡿⠃⢿⣿⡄⠀⠀⠸⣿⣿⠋⠁⠀⠀⣀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣽⠿⠋         "
                   "                         ⠉⠳⣄⠙⢦⣽⣞⢧⡹⣿⣿⣿⣸⠀⠀⠈⢿⣿⣤⡄⢠⣿⣧⣀⣠⡶⢿⡿⠁⠀⢀⣿⣿⣿⣿⣿⡿⠟⠁           "
                   "                    ⠰⠶⢤⣤⣀⣀⡀⠘⢦⡀⢹⣿⡏⠻⣝⣿⣿⡿⠀⠀⠀⣨⡿⠋⣷⣾⣿⠿⠋⠙⠿⢾⡇⠀⠀⣸⣿⣿⣿⣿⣏⣀⣤⣶⡖⢒⣶⡾⠋      "
                   "                       ⠈⠙⠺⣭⣝⣾⣇⠀⢹⣷⡀⠹⣜⣿⣿⡶⣤⣴⣯⢀⣀⣻⣿⣟⡀⠀⠀⠀⢸⡇⠀⠀⣿⣿⣿⣏⣼⣿⣿⣿⣟⣠⠟⠉        "
                   "                          ⠈⢻⣿⣿⠀⠀⢻⣷⡀⠙⠛⣿⣿⣿⣿⣿⣛⡋⣹⣿⠁⠀⠀⠀⠀⣼⣇⠀⢰⣿⣿⣿⣿⣿⣿⣿⠟⢛⠁          "
                   "                            ⠘⢿⣧⠀⠀⠻⣿⣄⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⢸⣿⡇⠀⢸⣿⣿⣿⡿⠟⢁⣴⠞            "
                   "                   ⣀⣀⣀⣀⣀⣀⣀⡀  ⠈⢻⣷⣦⣀⣿⣿⣦⣬⣿⡟⣿⣿⣿⣿⣿⣿⣇⡀⠀⠀⢸⣿⡆⠀⣸⣿⠟⢁⣤⣾⣿⠛             "
                   "               ███████╗███╗⠀⠀ ███╗ █████╗⠀⠀██████╗███████╗⠿⠿⠖⠋             "
                   "               ██╔════╝████╗⠀████║██╔══██╗██╔════╝██╔════╝⡢⣄               "
                   "               █████╗⠀⠀██╔████╔██║███████║██║⠀⠀⠀⠀⠀███████╗⣿⣌⢂              "
                   "               ██╔══╝⠀⠀██║╚██╔╝██║██╔══██║██║⠀⠀⠀⠀⠀╚════██║⠈⣿ ⠂             "
                   "               ███████╗██║⠀╚═╝⠀██║██║⠀⠀██║╚██████╗███████║⢶⡇ ⢠⠆            "
                   "               ╚══════╝╚═╝⠀⠀⠀⠀⠀╚═╝╚═╝⠀⠀╚═╝⠀╚═════╝╚══════╝⠈⣷⣤⡏             "
                   "                 ⢠⣶⣿⢿⡟⠛⢻⣿⣧⣤⡾⣻⣿⣧⣄⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡿⣿⣾⣦⠀⠈⠙⠿⣆⠄⢻⡀⠛⣯              "
                   "               ⣠⢴⣾⢿⣧⣿⣿⣶⣶⣞⣛⣻⣿⣻⡏⣛⣻⣷⣿⣷⣮⡿⠻⣿⣿⣿⠿⣿⡟⢿⣦⢹⡞⢮⡙⢿⣧⢠⠀⠀⠘⠀⠀⣧ ⠛⠃             "
                   "              ⣼⣿⣿⣷⠾⣻⠋⠻⣿⣏⠋⠙⣟⡟⣻⣿⣿⣿⢻⣏⡟⣿⣿⣟⣿⣿⣿⣿⣿⣝⢷⣿⡇ ⠈⢿⣾⣿⣿⣶⡀⠀⠄⠆⢿                "
                   "             ⣴⣿⢙⣿⡿⢴⡋⢀⣴⣿⡟⠙⠂⠈⣧⣿⣿⠟⠻⣾⣿⣿⣍⡉⠻⣾⣩⣿⣿⣿⣻⡿⣿⣅⡀ ⠘⣿⠟⠘⠛⢿⣾⣶⣀⡿                "
                   "           ⢀⣼⣾⣿⡟⣿⣷⠀⣙⣛⣻⣿⣧⣤⣤⣴⣟⠛⢻⣿⣿⣿⣤⣤⣮⡟⣿⣷⣶⠗⣻⣿⣯⣷⣾⣿⠁  ⢸⣇   ⠙⣿⣿⠃                "
                   "           ⣾⣿⣿⡟⣧⣾⣿⡛⢁⡤⡶⠀⢹⣿⣟⠁⣠⡄⠀⢿⠻⢧⣴⠏⢘⡇⣿⠛⠋⠈⠁⣿⣦⣙⣻⣿⡿⠂ ⢸⡟⠃   ⠘⠋                 "
                   "          ⣸⣿⢻⣿⣄⣹⣿⣿⡛⣿⣹⣁⢀⣼⡇⢹⣿⣻⣷⣾⣿⣆⠸⠿⠋⠛⣛⣿⣦⡄⣀⣴⠿⡿⣿⣿⡿⡇                           "
                   "         ⣰⡿⣿⠀⣿⣿⠇⠀⣿⣿⠋⠈⢉⣽⣿⣿⣄⣉⣂⣹⣶⠿⢿⣷⣶⣶⣿⣽⣿⡿⣻⢿⣭⠦⠀⣿⣯⣿⡇                           "
                   "        ⣸⣿⣷⢙⣿⡏⣿⠀⠀⣿⣿⣶⡾⠛⣹⢶⣿⣿⡟⢻⡏⠰⣆⣈⢻⡎⢿⣋⡽⠛⢷⣹⡀⠀⠙⠀⣛⣿⣿⡇                           "
                   "       ⢸⣿⣹⣿⣿⣿⡿⠛⠓⣛⣿⣿⢿⣃⡞⡟⠀⠈⢹⠙⢿⣣⡜⠃⠙⢹⣷⠘⠋⠘⠒⢚⣿⣿⣦⡤⢻⣻⣿⡟⠁                           "
                   "       ⣸⣟⣿⡿⠀⢿⣶⣴⣿⣿⠃⢿⣌⣹⡛⢧⣤⣀⣸⡇⠼⠛⠳⠤⠶⢾⣿⣤⣄⣠⡤⠛⣛⣷⠘⣧⣴⢿⡟⠁                            "
                   "      ⠈⢻⣿⡙⠳⠀⣨⣿⣿⢹⡿⣄⢸⣿⡏⠻⢂⣠⣼⣽⣿⣄⣀⣀⣴⡖⢛⣉⢻⣿⣷⠀⣠⢿⣿⡼⣿⣋⣾⡵⠃                            "
                   "      ⠢⣼⣿⡹⢶⣤⣿⢿⣿⠘⢧⡿⠶⣿⣷⣿⣟⣻⣿⡆⠉⢻⣿⣿⣿⠃⢠⠿⣶⣷⠘⠚⣇⠀⣿⣦⣶⣾⡏                              "
                   "       ⣈⣿⣷⢺⢿⢻⠈⣿⡶⠀⢀⣾⣿⣿⣿⠟⠛⠿⡟⢠⡀⡇⠹⣤⡼⠃⠀⢉⣿⡄⠀⣈⣼⣿⡛⡛⠋                               "
                   "       ⢀⣈⣳⡎⠈⣏⠋⣻⣿⣿⠋⠀⣿⠃⠹⣦⣾⣶⡇⢸⡄⣿⡄⠀⠀⠀⢉⡿⣯⣿⣾⡿⣿⣽⣧⠟                                "
                   "         ⠙⢧⣀⠀⣠⣿⣿⠋⠳⡄⢿⣦⣄⠋⠀⠈⠛⠛⠳⣿⣿⡦⣾⡟⠉⣶⡈⣿⣿⡞⣛⡉                                  "
                   "          ⠘⠿⢷⣿⡇⣿⠀⠀⢷⠘⣿⠛⢀⣇⣀⣠⣴⣾⣿⠉⠙⣏⣀⣾⠿⣿⣿⢋⡌⠉⠉                                  "
                   "             ⢷⣻⣿⡦⠴⠾⠂⢻⣶⠟⣋⣉⣉⡙⢻⣗⠀⠺⣾⣽⡿⠶⣾⡿⠋⠁                                    "
                   "              ⠈⠻⣦⣤⣤⣤⡟⠙⣟⣻⡿⠛⣿⠿⣿⢫⠞⢋⣠⣤⠿⡥⠤                                      "
                   "                  ⠈⢻⣿⣦⡙⠁⢠⠦⠼⠶⢿⣟⠛⠛⠃                                          "
                   "                    ⠈⡙⠛⠒⠒⠲⢿⡏⣛⠛⡀                                            "
                   ))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))


(setq +doom-dashboard-ascii-banner-fn #'my-ascii-art)

(define-derived-mode +doom-dashboard-mode special-mode
  (format "pineapples are tasty"))


(map! :leader
      :desc "Switch to dashboard buffer"
      "z" '+doom-dashboard/open)

;; ============================
;;        BEACON MODE
;; ============================
(beacon-mode 1)
(setq! beacon-dont-blink-commands '(previous-line forward-line))
(setq! beacon-blink-when-focused 't)

;; ============================
;;        DOOM MODELINE
;; ============================
(setq! doom-modeline-total-line-number t)


;; |-------------------------------------------------------------------------------------------------------------------------------------------|
;; |++++++++++++++++++++++++++++++++++++++++++++++++++++++        !FUNCTIONALITY!        ++++++++++++++++++++++++++++++++++++++++++++++++++++++|
;; |-------------------------------------------------------------------------------------------------------------------------------------------|

;; ============================
;;           GENERAL
;; ============================

;; display line numbers on the side
(setq display-line-numbers-type 'relative)

;; prevent emacs daemon from stopping automatically
(setq! server-stop-automatically nil)

;; remember which line the file was closed at
(global-line-reminder-mode t)

;; prevent usage of mouse
(inhibit-mouse-mode t)

;; prevent auto save
(auto-save-mode -1)

;; focus follows cursor
(setq mouse-autoselect-window t)

;; unbind C-x C-z so i dont accidentally close the window
(global-unset-key (kbd "C-x C-z"))

;; set garbage collection threshold
;; (setq gc-cons-threshold (* 256 1024 1024))
(setq gc-cons-threshold 100000000) ;; 100mb

;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; show number of matches in modeline while searching
(global-anzu-mode +1)

;; send all deletions to trash
(setq delete-by-moving-to-trash t)

;; ============================
;;            Dired
;; ============================

(setq dired-async-mode t)
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
(setq emms-mode-line-icon-color "red")
(require 'emms-player-mpd)
(defun pauseOrShow ()
  (if emms-player-paused-p
      (message "Music is paused.")
    (emms-show)))

(setq! emms-player-paused-hook '(emms-playing-time-pause emms-lyrics-pause pauseOrShow))

(setq emms-player-list '(emms-player-mpv)
      emms-info-functions 'emms-info-native
      emms-add-directory-tree "/mnt/shared/moosic/")
(setq emms-info-asynchronously nil)
(setq emms-playlist-buffer-name "*Music*")
(emms-history-load)
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

(map! :leader
      :prefix ("m" . "music (emms)"))

(map! :leader
      :desc "pause/play"
      "m x" 'emms-pause)

(map! :leader
      :desc "lower volume"
      "m -" 'emms-volume-lower)

(map! :leader
      :desc "raise volume"
      "m =" 'emms-volume-raise)

(map! :leader
      :desc "play next"
      "m k" 'emms-next)

(map! :leader
      :desc "play previous"
      "m j" 'emms-previous)

(map! :leader
      :desc "browse playlist/queue"
      "m b" 'emms-smart-browse)

(map! :leader
      :desc "stop"
      "m X" 'emms-stop)

(map! :leader
      :desc "choose playlist to play"
      "m c" 'emms-play-playlist)

(map! :leader
      :desc "switch to playlist/queue view"
      "m p" 'emms-playlist-mode-go)

(map! :leader
      :desc "shuffle current playlist/queue"
      "m s" 'emms-playlist-shuffle)

(map! :leader
      :desc "Show now playing music name in minibuffer"
      "m ?" 'emms-show)

(map! :leader
      :desc "play music selected in dired"
      "m d" 'emms-play-dired)

;; ============================
;;          PROJECTILE
;; ============================
(setq! projectile-project-search-path '("/mnt/shared/CODE/"))
(setq! projectile-ignored-projects '("~/" "~/.doom.d/" "~/.emacs.d/" "/mnt/shared/NOTES/"))
;; (setq! projectile-globally-ignored-directories
;;        '(
;;          "/mnt/shared/NOTES/.attach/"
;;          "flow-typed" "node_modules"
;;          "~/.emacs.d/.local/"
;;          ".idea" ".vscode"
;;          ".ensime_cache" ".eunit"
;;          ".git" ".hg"
;;          ".fslckout"
;;          "_FOSSIL_"
;;          ".bzr" "_darcs"
;;          ".pijul" ".tox"
;;          ".svn" ".stack-work"
;;          ".ccls-cache"
;;          ".cache" ".clangd"
;;          ".sl" ".jj"
;;          ""
;;          )
;;        )

;; ============================
;;          EVIL STUFF
;; ============================
(map! "M-r" 'evil-multiedit-match-all)

;; ============================
;;       DRAG-STUFF MODE
;; ============================
(drag-stuff-mode t)
(map! "M-<up>" 'drag-stuff-up)
(map! "M-<down>" 'drag-stuff-down)

;; ============================
;;           LOOKUP
;; ============================
;; (map! :leader
;;       :prefix ("c l" . "lookup"))

;; (map! :leader
;;       :prefix ("c l" . "lookup")
;;       :desc "lookup documentation"
;;       "k"
;;       '+lookup/documentation)
;; (map! :leader
;;       :prefix ("c l" . "lookup")
;;       :desc "lookup definition"
;;       "d"
;;       '+lookup/definition)
;; (map! :leader
;;       :prefix ("c l" . "lookup")
;;       :desc "lookup references"
;;       "D"
;;       '+lookup/references)
;; (map! :leader
;;       :prefix ("c l" . "lookup")
;;       :desc "lookup implementation"
;;       "i"
;;       '+lookup/implementations)
;; (map! :leader
;;       :prefix ("c l" . "lookup")
;;       :desc "lookup type definition"
;;       "t"
;;       '+lookup/type-definition)

;; ============================
;;         LSP BRIDGE
;; ============================

;; (use-package! lsp-bridge
;;   :config
;;   (global-lsp-bridge-mode))

;; (setq! lsp-bridge-python-lsp-server "basedpyright")
;; (setq! lsp-bridge-enable-hover-diagnostic t)

;; (setq! acm-mode-map '(keymap (7 . acm-hide) (10 . acm-complete) (9 . acm-complete) (13 . ())
;;                       (tab . acm-complete) (22 . acm-select-next-page)
;;                       (27 keymap (108 . acm-hide) (107 . acm-doc-scroll-down)
;;                           (106 . acm-doc-scroll-up) (100 . acm-doc-toggle) (117 . acm-filter)
;;                           (104 . acm-complete)
;;                           (72 . acm-insert-common) (118 . acm-select-prev-page)
;;                           (46 . acm-select-first) (44 . acm-select-last)
;;                           (112 . acm-select-prev) (110 . acm-select-next))
;;                       (up . acm-select-prev) (down . acm-select-next)
;;                       (remap keymap (previous-line . acm-select-prev)
;;                              (next-line . acm-select-next))))


;; (map! :leader
;;       :desc "Rename symbol (LSP-BRIDGE)"
;;       "c r"
;;       'lsp-bridge-rename)

;; (map! :leader
;;       :desc "Format code (LSP-BRIDGE)"
;;       "c f"
;;       'lsp-bridge-code-format)

;; (map! :leader
;;       :desc "Popup documentation (LSP-BRIDGE)"
;;       "c k"
;;       'lsp-bridge-popup-documentation)

;; (map! :leader
;;       :desc "Go to definition (LSP-BRIDGE)"
;;       "c d"
;;       'lsp-bridge-find-def)

;; (map! :leader
;;       :desc "Find references (LSP-BRIDGE)"
;;       "c D"
;;       'lsp-bridge-find-references)

;; (map! :leader
;;       :desc "Find implementation (LSP-BRIDGE)"
;;       "c i"
;;       'lsp-bridge-find-impl)

;; (map! :leader
;;       :desc "Find type definition (LSP-BRIDGE)"
;;       "c t"
;;       'lsp-bridge-find-type-def)

;; (map! :leader
;;       :desc "Documentation in buffer (LSP-BRIDGE)"
;;       "c b d"
;;       'lsp-bridge-show-documentation)

;; (map! :leader
;;       :desc "List diagnostics (LSP-BRIDGE)"
;;       "c x"
;;       'lsp-bridge-diagnostic-list)

;; (map! :leader
;;       :desc "Code actions (LSP-BRIDGE)"
;;       "c a"
;;       'lsp-bridge-code-action)

;; (map! :desc "Scroll down LSP-BRIDGE documentation popup"
;;       "C-c j"
;;       'lsp-bridge-popup-documentation-scroll-down)

;; (map! :desc "Scroll down LSP-BRIDGE documentation popup"
;;       "C-c k"
;;       'lsp-bridge-popup-documentation-scroll-up)

;; ============================
;;             LSP
;; ============================

;; ============================
;;        DAPE DEBUGGER
;; ============================
;; (map! "<f5>" 'dape-quit)
;; (map! "<f7>" 'dape-continue)
;; (map! "<f8>" 'dape-next)
;; (map! "<f6>" 'dape-step-in)
;; (map! "<f9>" 'dape-step-out)

;; ============================
;;  OTHER PROGRAMMING PACKAGES
;; ============================

(require 'highlight-parentheses)
(add-hook 'prog-mode-hook #'highlight-parentheses-mode)
(add-hook 'minibuffer-setup-hook #'highlight-parentheses-minibuffer-setup)

;; ============================
;;          ORG STUFF
;; ============================

(setq org-directory "/mnt/shared/NOTES/")

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

(require 'org-download)
(add-hook 'org-mode-hook 'org-download-enable)
(add-hook 'dired-mode-hook 'org-download-enable)

(setq org-roam-directory "/mnt/shared/NOTES/")
(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(setq! org-roam-capture-templates
       '(("d" "default" plain "%?"
          :target (file+head "${slug}.org" "#+title: ${title}")
          :unnarrowed t)))

(defun my-org-faces ()
  (set-face-attribute 'org-document-title nil :height 2.5)
  (set-face-attribute 'org-document-info nil :height 2.5)
  (set-face-attribute 'org-document-info-keyword nil :height 0.5)
  (set-face-attribute 'org-level-1 nil :height 2.0)
  (set-face-attribute 'org-level-2 nil :height 1.8)
  (set-face-attribute 'org-level-3 nil :height 1.6)
  (set-face-attribute 'org-level-4 nil :height 1.4)
  (set-face-attribute 'org-level-5 nil :height 1.2)
  )

(add-hook 'org-mode-hook #'my-org-faces)
                                        ; Journal

(setq org-journal-time-prefix "* "
      org-journal-date-prefix "#+TITLE: "
      org-journal-date-format "%A, %d-%m-%Y"
      org-journal-file-format "%Y-%m-%d.org")

(with-eval-after-load 'ox
  ;; Turn off sub/superscript parsing globally
  (setq org-export-with-sub-superscripts nil))

;; ============================
;;            DEFT
;; ============================

(setq! deft-directory '"/mnt/shared/NOTES/")
(setq! deft-extensions '("org"))
(setq! deft-recursive 't)

(setq deft-strip-summary-regexp "\\`\\(.+\n\\)+\n")
(defun cm/deft-parse-title (file contents)
  "Parse the given FILE and CONTENTS and determine the title.
  If `deft-use-filename-as-title' is nil, the title is taken to
  be the first non-empty line of the FILE.  Else the base name of the FILE is
  used as title."
  (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
    (if begin
        (string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
      (deft-base-filename file))))

(advice-add 'deft-parse-title :override #'cm/deft-parse-title)

(setq deft-strip-summary-regexp
      (concat "\\("
              "[\n\t]" ;; blank
              "\\|^#\\+[[:alpha:]_]+:.*$" ;; org-mode metadata
              "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
              "\\)"))

;; ============================
;;       SCROLL-ON-JUMP
;; ============================

(with-eval-after-load 'evil
  (scroll-on-jump-advice-add evil-undo)
  (scroll-on-jump-advice-add evil-redo)
  (scroll-on-jump-advice-add evil-jump-item)
  (scroll-on-jump-advice-add evil-jump-forward)
  (scroll-on-jump-advice-add evil-jump-backward)
  (scroll-on-jump-advice-add evil-ex-search-next)
  (scroll-on-jump-advice-add evil-ex-search-previous)
  (scroll-on-jump-advice-add evil-forward-paragraph)
  (scroll-on-jump-advice-add evil-backward-paragraph)
  (scroll-on-jump-advice-add evil-goto-mark)

  ;; Actions that themselves scroll.
  (scroll-on-jump-with-scroll-advice-add evil-goto-line)
  (scroll-on-jump-with-scroll-advice-add evil-goto-first-line)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-down)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-up)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-center)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-top)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-bottom))

(with-eval-after-load 'goto-chg
  (scroll-on-jump-advice-add goto-last-change)
  (scroll-on-jump-advice-add goto-last-change-reverse))

(global-set-key (kbd "<C-M-next>") (scroll-on-jump-interactive 'diff-hl-next-hunk))
(global-set-key (kbd "<C-M-prior>") (scroll-on-jump-interactive 'diff-hl-previous-hunk))
(setq! scroll-on-jump-duration 0.4)

;; |0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000|
;; |+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-    end of my configuration    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-|
;; |0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000|

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;;(setq doom-font 'cozette)
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This i s the default:
;; (setq doom-theme 'doom-gruvbox)
;; (load-theme 'kaolin t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "/mnt/shared/NOTES/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(message "config reloaded!")
