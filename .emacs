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


;; flymake for ruby syntax checking
(require 'flymake)

;; I don't like the default colors :)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	  (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()

	          ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	          (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		       (flymake-mode))
		       ))
