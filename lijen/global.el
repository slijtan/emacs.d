;; Stole snippets from https://github.com/rmm5t/dotfiles/blob/master/emacs.d/rmm5t/global.el

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" , "~/.emacs.d/backups" t)))

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
;; (require 'multi-web-mode)
;; (setq mweb-default-major-mode 'html-mode)
;;(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;                  (js-mode "<script[^>]*>" "</script>")
;;                  (ruby-mode "<%" "%>")
;;                  (css-mode "<style[^>]*>" "</style>")))
;;(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "erb"))
;;(multi-web-global-mode 1)

;; Trailing whitespace is unnecessary
;;(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

;;highlight lines over 80 chars
(require 'whitespace)
;;(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-style '(face empty lines-tail space-after-tab::tab space-before-tab::space))
(setq whitespace-line-column '100)
(global-whitespace-mode t)

;; skip paragraph with alt up/down
(global-set-key (kbd "s-<down>") 'forward-paragraph)
(global-set-key (kbd "s-<up>") 'backward-paragraph)

;; enable deleting selections
(delete-selection-mode 1)

;; align hash rockets to f5
(defun align-assignments ()
  "Align on a single equals sign (with a space either side)."
  (interactive)
  (align-regexp
   (region-beginning) (region-end)
   "\\(\\s-*\\) =" 1 0 nil))

(global-set-key (kbd "<f5>") 'align-assignments)

;; make sure C-j works for newline + indend
(electric-indent-mode -1)
