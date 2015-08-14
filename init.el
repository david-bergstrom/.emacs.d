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
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(load-user-file "general.el")
(load-user-file "c.el")
(load-user-file "theme.el")
(load-user-file "haskell.el")
(load-user-file "latex.el")
