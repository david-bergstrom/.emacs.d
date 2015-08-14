;; To comply with the coding standards of TDDD86
(setq c-default-style "linux"
      c-basic-offset 4)

;; To comply with the coding standards of PINTOS
;;(setq c-default-style "gnu")
;;(setq-default indent-tabs-mode nil)

;; Tells Emacs to use C++ mode for .h files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
