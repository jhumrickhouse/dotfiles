;; Some configurations
(setq inhibit-startup-message           t
      inhibit-startup-echo-area-message t
      initial-scratch-message           ""
      column-number-mode                t
      backup-directory-alist            '(("." . "~/.emacs.d/backups/"))
      backup-by-copying                 t
      version-control                   t
      kept-new-versions                 6
      kept-old-versions                 2
      delete-by-moving-to-trash         t
      scroll-step                       1
      scroll-conservatively             1000
      exec-path                         (append exec-path '("/usr/local/bin")))

;; Configure autosaves
(defvar my-auto-save-folder "~/.emacs.d/autosave")
(setq auto-save-list-file-prefix "~/.emacs.d/autosave/.saves-")
(setq auto-save-file-name-transforms `((".*" ,my-auto-save-folder t)))

;; No menubar
(menu-bar-mode -1)

;; No toolbar
(tool-bar-mode -1)

;; Enable Emacs commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Setup TRAMP
(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-backup-directory-alist backup-directory-alist)
(setq tramp-auto-save-directory my-auto-save-folder)

;; Add my home directory lisp files
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'mylisp)

;; Setup Package.el
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; ruby and inf-ruby
(require 'ruby-mode)
(unless (package-installed-p 'inf-ruby)
  (package-install 'inf-ruby))
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby pathrocess" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))

;; NREPL Setup
(unless (package-installed-p 'nrepl)
  (package-install 'nrepl))
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(add-hook 'nrepl-mode-hook 'subword-mode)
(add-hook 'nrepl-mode-hook 'smartparens-mode)

;; Default Pdb Call
(setq gud-pdb-command-name "python -m pdb")

;; Use solarized color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

(global-set-key (kbd "C-c w") 'whack-whitespace)
