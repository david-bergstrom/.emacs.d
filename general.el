;; Tramp makes it easy to edit files that are somewhere else.
(require 'tramp)
(setq tramp-default-method "scp")

;; Evil-mode is quite nice
(package-install 'evil)
(evil-mode 1)

;; Disable tabs
(setq-default indent-tabs-mode nil)

;; Uncomment to makes longer lines easier to detect.
;; (require 'whitespace)
;; (setq whitespace-style '(face empty tabs trailing))
;; (global-whitespace-mode t)
