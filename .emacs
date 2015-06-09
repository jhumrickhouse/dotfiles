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

(defalias 'yes-or-no-p 'y-or-n-p)

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

;; Use Eldoc with lisp modes
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

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

;; Macro for installing packages
(defmacro install-unless-installed (package)
  `(unless (package-installed-p ,package)
     (package-install ,package)))

;; YasSnippet
(install-unless-installed 'yasnippet)
; (require 'yasnippet)
; (yas-global-mode 1)

;; Autocomplete
(install-unless-installed 'auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; Flycheck
(install-unless-installed 'flycheck)

;; Setup C mode
(install-unless-installed 'auto-complete-clang)
(install-unless-installed 'auto-complete-c-headers)
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (require 'auto-complete-clang)
	     (require 'auto-complete-c-headers)
	     (setq c-default-style "k&r")
	     (setq c-basic-offset 4)
	     (add-to-list 'ac-sources ac-source-c-headers)
	     (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/5.1/include")))

;; Setup Go mode
(require 'go-mode)
(require 'go-autocomplete)
(require 'go-flymake)
(require 'go-flycheck)
(require 'go-errcheck)
(require 'go-eldoc)
(require 'golint)
(defun go-run-buffer()
  (interactive)
  (shell-command (concat "go run " (buffer-name))))
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 
	  '(lambda () 
	     (auto-complete-mode)
	     (go-eldoc-setup)
	     (local-set-key (kbd "M-.") 'godef-jump)
	     (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
	     (local-set-key (kbd "C-c d") 'godoc-at-point)
	     (local-set-key (kbd "C-c C-c") 'go-run-buffer)))


;; ruby and inf-ruby
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
(load-theme 'solarized-dark t)

(global-set-key (kbd "C-c w") 'whack-whitespace)
(global-set-key (kbd "C-c m") 'call-last-kbd-macro)
