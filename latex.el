;; AUCTex is my favorite library for editing LaTeX.
(package-install 'auctex)

;; Enables flyspell and adaptive-wrap-mode which helps when editing LaTeX
(package-install 'adaptive-wrap)
(package-install 'flyspell)
(add-hook 'latex-mode-hook
          (lambda ()
            (auto-fill-mode -1)
            (adaptive-wrap-prefix-mode 1)))
            ;;(flyspell-mode 1)))
