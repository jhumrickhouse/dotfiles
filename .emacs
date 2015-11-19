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
      delete-old-versions               t
      scroll-step                       1
      scroll-conservatively             1000
      exec-path                         (append exec-path '("/usr/local/bin")))

(defalias 'yes-or-no-p 'y-or-n-p)

;; Configure autosaves
(defvar my-auto-save-folder "~/.emacs.d/autosave")
(setq auto-save-list-file-prefix "~/.emacs.d/autosave/.saves-")
(setq auto-save-file-name-transforms `((".*" ,my-auto-save-folder t)))

;; No menubar
(menu-bar-mode -1)

;; Enable Emacs commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Add my home directory lisp files
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'mylisp)

;; Setup TRAMP
(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-backup-directory-alist backup-directory-alist)
(setq tramp-auto-save-directory my-auto-save-folder)

;; Setup Package.el
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Macro for installing packages
(defmacro install-unless-installed (package)
  `(unless (package-installed-p ,package)
     (package-install ,package)))

;; Paredit mode
(install-unless-installed 'paredit)

;; Setup ELisp mode hooks with ParEdit, ElDoc, Show-Paren and electric RET
(defun my-lisp-mode-hook ()
  (paredit-mode t)
  (turn-on-eldoc-mode)
  (eldoc-add-command
   'paredit-backward-delete
   'paredit-close-round)
  (local-set-key (kbd "RET") 'electrify-return-if-match)
  (eldoc-add-command 'electrify-return-if-match)
  (show-paren-mode t))

(add-hook 'emacs-lisp-mode-hook       'my-lisp-mode-hook)
(add-hook 'ielm-mode-hook             'my-lisp-mode-hook)
(add-hook 'lisp-mode-hook             'my-lisp-mode-hook)
(add-hook 'lisp-interaction-mode-hook 'my-lisp-mode-hook)
(add-hook 'scheme-mode-hook           'my-lisp-mode-hook)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; SLIME Setup
(require 'slime)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(setq inferior-lisp-program "clisp")

;; Setup C mode
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (setq c-default-style "k&r")
	     (setq c-basic-offset 4)))

(require 'ruby-mode)
(install-unless-installed 'inf-ruby)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby pathrocess" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))

;; clojure-mode
(install-unless-installed 'clojure-mode)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)

;; CIDER Setup
(install-unless-installed 'cider)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; SML mode
(install-unless-installed 'sml-mode)

;; Default Pdb Call
(setq gud-pdb-command-name "python -m pdb")

;; Use solarized color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)
(set-terminal-parameter nil 'background-mode 'dark)

(global-set-key (kbd "C-c w") 'whack-whitespace)
(global-set-key (kbd "C-c m") 'call-last-kbd-macro)
