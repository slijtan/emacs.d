;; Stole snippets from https://github.com/rmm5t/dotfiles/blob/master/emacs.d/rmm5t/global.el

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

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