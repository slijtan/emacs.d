;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
;; (add-to-list 'load-path "~/.emacs.d/rinari")
;; (require 'rinari)

(add-to-list 'load-path "~/.emacs.d")

;;scss
(add-to-list 'load-path "~/.emacs.d/vendor")
(load "vendor/scss-mode")
;;(load "vendor/cucumber.el/feature-mode.el")
(load "vendor/coffee-mode/coffee-mode.el")
(load "vendor/multi-web-mode.el")

;; php-mode
(add-to-list 'load-path "~/.emacs.d/php-mode")
(require 'php-mode)

;; pig
(add-to-list 'auto-mode-alist '("\\.pig$" . pig-latin-mode))
(autoload 'pig-latin-mode "pig-latin-mode" "Pig-Latin mode" t)

;; Lijens
(load "lijen/global")

;; textmate
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; ag
(add-to-list 'load-path "~/.emacs.d/vendor/ag")
(require 'ag)

;; dash-at-point
(add-to-list 'load-path "~/.emacs.d/vendor/dash-at-point")
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; multiple-cursors
(add-to-list 'load-path "~/.emacs.d/vendor/multiple-cursors.el")
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
