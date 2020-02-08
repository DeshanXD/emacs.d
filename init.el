;; Removing the annoying welcome message
(setq inhibit-startup-message t)

;; Make emacs cleaner without nav bars and scroll bars
(tool-bar-mode -1)
(menu-bar-mode -1)
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

;; (require 'org-bullets)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


(custom-set-variables
 ;; custom-set-variables was added by Custom
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (gotham)))
 '(custom-safe-themes
   (quote
    ("d7441a80851d30a369268e50bbad6777a82ff37405f70328f21a8f30a7c6e31d" "61ae193bf16ef5c18198fbb4516f0c61a88f7b55b693a3b32d261d8501c4a54b" "27b97024320d223cbe0eb73104f2be8fcc55bd2c299723fc61d20057f313b51c" "107420ec61832543bd769e5d6764bedb41ec3d2f8cd4d53a407f7aa74b493dac" "66aea5b7326cf4117d63c6694822deeca10a03b98135aaaddb40af99430ea237" "721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "8343be3a733414342075a9a42c6fa1ee9f64c2af179e5fec68febba34f05bd06" "b46ee2c193e350d07529fcd50948ca54ad3b38446dcbd9b28d0378792db5c088" default)))
 '(fci-rule-color "dark green")
 '(package-selected-packages
   (quote
    (gotham-theme anti-zenburn-theme ahungry-theme airline-themes green-screen-theme dracula-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "SF Mono" :foundry "APPL" :slant normal :weight normal :height 105 :width normal)))))















