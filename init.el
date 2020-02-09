;; Removing the annoying welcome message
(setq inhibit-startup-message t)

;; Make emacs cleaner without nav bars and scroll bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(toggle-scroll-bar -1)

;; Setting up backup directory for the every files
;; (setq backup-directory-alist '(("." . "~/.emacs_backups")))
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs-backups/"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs_backups/" t)))


(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try
	     :ensure t)

;; Org mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration for Javasript Development ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package js
  :ensure nil
  :preface
  (defun me/js-prettify-symbols-mode-on ()
    (add-to-list 'prettify-symbols-alist '("function" . ?\u0192))
    (prettify-symbols-mode 1))
  :hook
  (js-mode . me/js-prettify-symbols-mode-on)
  :custom
  (js-indent-level 2))

(use-package js-doc)

(use-package js2-mode
  :ensure nil
  :bind (:map js2-mode-map ([remap comment-indent-new-line] . js2-line-break))
  :custom
  (js2-idle-timer-delay 0)
  (js2-mode-show-parse-errors nil)
  (js2-mode-show-strict-warnings nil))

(use-package json-mode
  :mode "\\.json\\'"
  :preface
  (defun me/json-set-indent-level ()
    (setq-local js-indent-level 2))
  :hook (json-mode . me/json-set-indent-level))

(use-package rjsx-mode
  :preface
  (defun me/rjsx-set-ongoing-hydra-body ()
    (setq me/ongoing-hydra-body #'hydra-rjsx/body))
  (defun me/rjsx-set-pretty-print-function ()
    (setq me/pretty-print-function #'sgml-pretty-print))
  :hook
  ((rjsx-mode . me/aggressive-indent-mode-off)
   (rjsx-mode . me/rjsx-set-ongoing-hydra-body)
   (rjsx-mode . me/rjsx-set-pretty-print-function)
   (rjsx-mode . sgml-electric-tag-pair-mode)
   (rjsx-mode . turn-off-auto-fill)))

(use-package web-mode
  :custom (web-mode-enable-auto-indentation nil))

;; Insert date in emacs format
(defun insert-current-date () (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Default Configurations by Emacs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#c0c0c0" "#336c6c" "#806080" "#0f2050" "#732f2c" "#23733c" "#6c1f1c" "#232333"])
 '(company-quickhelp-color-background "#b0b0b0")
 '(company-quickhelp-color-foreground "#232333")
 '(custom-enabled-themes (quote (gotham)))
 '(custom-safe-themes
   (quote
    ("2b8dff32b9018d88e24044eb60d8f3829bd6bbeab754e70799b78593af1c3aba" "d6db7498e2615025c419364764d5e9b09438dfe25b044b44e1f336501acd4f5b" "d7441a80851d30a369268e50bbad6777a82ff37405f70328f21a8f30a7c6e31d" "61ae193bf16ef5c18198fbb4516f0c61a88f7b55b693a3b32d261d8501c4a54b" "27b97024320d223cbe0eb73104f2be8fcc55bd2c299723fc61d20057f313b51c" "107420ec61832543bd769e5d6764bedb41ec3d2f8cd4d53a407f7aa74b493dac" "66aea5b7326cf4117d63c6694822deeca10a03b98135aaaddb40af99430ea237" "721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "8343be3a733414342075a9a42c6fa1ee9f64c2af179e5fec68febba34f05bd06" "b46ee2c193e350d07529fcd50948ca54ad3b38446dcbd9b28d0378792db5c088" default)))
 '(fci-rule-color "dark green")
 '(nrepl-message-colors
   (quote
    ("#336c6c" "#205070" "#0f2050" "#806080" "#401440" "#6c1f1c" "#6b400c" "#23733c")))
 '(package-selected-packages
   (quote
    (gotham-theme anti-zenburn-theme ahungry-theme airline-themes green-screen-theme dracula-theme use-package)))
 '(pdf-view-midnight-colors (quote ("#232333" . "#c7c7c7")))
 '(vc-annotate-background "#d4d4d4")
 '(vc-annotate-color-map
   (quote
    ((20 . "#437c7c")
     (40 . "#336c6c")
     (60 . "#205070")
     (80 . "#2f4070")
     (100 . "#1f3060")
     (120 . "#0f2050")
     (140 . "#a080a0")
     (160 . "#806080")
     (180 . "#704d70")
     (200 . "#603a60")
     (220 . "#502750")
     (240 . "#401440")
     (260 . "#6c1f1c")
     (280 . "#935f5c")
     (300 . "#834744")
     (320 . "#732f2c")
     (340 . "#6b400c")
     (360 . "#23733c"))))
 '(vc-annotate-very-old-color "#23733c"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "SF Mono" :foundry "APPL" :slant normal :weight normal :height 105 :width normal)))))















