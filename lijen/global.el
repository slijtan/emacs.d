;; Stole snippets from https://github.com/rmm5t/dotfiles/blob/master/emacs.d/rmm5t/global.el

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Trailing whitespace is unnecessary
;;(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Emacs gurus don't need no stinking scroll bars
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1))

;; remove toolbar
(tool-bar-mode -1)

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; Small fringes
(set-fringe-mode '(1 . 1))

;; Gotta see matching parens
(show-paren-mode t)

(load-theme 'tango)

(setq scss-compile-at-save nil)

;; Tab indent HTML
(add-hook 'html-mode-hook
	  (lambda()
	    (setq sgml-basic-offset 4)
	    (setq-default tab-width 4)
	    (setq indent-tabs-mode t)))


;;html inline with js and css
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script[^>]*>" "</script>")
                  (css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "erb"))
(multi-web-global-mode 1)
