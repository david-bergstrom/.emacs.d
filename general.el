;; Tramp makes it easy to edit files that are somewhere else.
(require 'tramp)
(setq tramp-default-method "scp")

;; Clean up the interface a bit
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Evil-mode is quite nice
(package-install 'evil)
(evil-mode 1)

;; Disable tabs
(setq-default indent-tabs-mode nil)

;; Better backups of files
(setq
   backup-by-copying t
   backup-directory-alist '(("." . "~/.emacs.d/backup"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

;; Uncomment to makes longer lines easier to detect.
;; (require 'whitespace)
;; (setq whitespace-style '(face empty tabs trailing))
;; (global-whitespace-mode t)
