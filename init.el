(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; Set the custom file to be in the local folder
(setq custom-file "~/.emacs.d/local/custom.el")
(if (file-exists-p "~/.emacs.d/local/custom.el")
    (load custom-file))

;; Enable the package manager
(require 'package)
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)
;;(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; List of all wanted packages
(setq package-list '(evil
                     auctex
                     linum-relative
                     adaptive-wrap
                     flyspell
                     markdown-mode
                     ; Maybe some other day..?
                     ;org
                     ;magit
                     color-theme-solarized))

;; Install programs which isn't installed
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Tramp makes it easy to edit files that are somewhere else.
(setq tramp-default-method "ssh")

;; Clean up the interface a bit
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Evil-mode is quite nice
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
(require 'whitespace)
(setq whitespace-style '(face empty tabs trailing))
(global-whitespace-mode t)

;; To comply with the coding standards of TDDD86
(setq c-default-style "linux"
      c-basic-offset 4)

;; To comply with the coding standards of PINTOS
;;(setq c-default-style "gnu")
;;(setq-default indent-tabs-mode nil)

;; Tells Emacs to use C++ mode for .h files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Solarized is an awesome theme
(set-frame-parameter nil 'background-mode 'light)
(load-theme 'solarized t)

;; Loads Haskell mode which helps when editing Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; AUCTex is my favorite library for editing LaTeX.

;; Enables flyspell and adaptive-wrap-mode which helps when editing LaTeX
(add-hook 'latex-mode-hook
          (lambda ()
            (auto-fill-mode -1)
            (adaptive-wrap-prefix-mode 1)))
            ;;(flyspell-mode 1)))

;; Line number mode is nice
(linum-relative-global-mode)

(setq-default fill-column 79)
(add-hook 'markdown-mode-hook
          'turn-on-auto-fill)
