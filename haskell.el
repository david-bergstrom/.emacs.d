;; Loads Haskell mode which helps when editing Haskell
(package-install 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
