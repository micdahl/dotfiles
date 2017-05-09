(require 'package)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not."

(when (not package-archive-contents)
    (package-refresh-contents))

"Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
(package-initialize)
(ensure-package-installed 'auto-complete
                          'dockerfile-mode
                          'docker-tramp
                          'evil
			  'evil-surround
			  'flx-ido
			  'flycheck
			  'helm
                          'jade-mode
;                          'js3-mode
                          'json-mode
			  'linum-relative
			  'magit
                          'markdown-mode
                          'mocha
			  'ng2-mode
			  'powerline
			  'projectile
			  'projectile-rails
                          'pug-mode
        'rspec-mode
;			  'rubocop
			  'sass-mode
			  'solarized-theme
			  'slim-mode
			  'typescript-mode
			  'yaml-mode)
(ac-config-default)
(require 'helm)
(require 'powerline)
(powerline-default-theme)
(require 'rspec-mode)
;(add-hook 'ruby-mode-hook #'rubocop-mode)
(add-hook 'css-mode-hook #'linum-mode)
(add-hook 'js-mode-hook #'linum-mode)
(add-hook 'ng2-ts-mode-hook #'linum-mode)
(add-hook 'ng2-html-mode-hook #'linum-mode)
(add-hook 'rails-mode-hook #'linum-mode)
(add-hook 'ruby-mode-hook #'linum-mode)
(add-hook 'slim-mode-hook #'linum-mode)
(add-hook 'typescript-mode-hook #'linum-mode)
(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(require 'ng2-mode)
(require 'linum-relative)
(require 'evil)
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(package-selected-packages
   (quote
    (slim-mode solarized-theme powerline magit evil dockerfile-mode)))
 '(safe-local-variable-values
   (quote
    ((mocha-which-node . "exec -it meandocker_express_1 node")
     (mocha-which-node . "docker exec -it meandocker_express_1 node")
     (rspec-docker-cwd . "/myapp/")
     (rspec--docker-cwd . "/myapp")
     (rspec-docker-container . "sharewayz_app_1")
     (rspec-use-docker-when-possible . t))))
 '(typescript-auto-indent-flag nil)
 '(typescript-expr-indent-offset 2)
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(smerge-refined-added ((t (:inherit smerge-refined-change :background "honeydew")))))
(load-theme 'solarized-dark t)
(setq linum-relative-current-symbol "")
; (global-linum-mode 1)
(linum-relative-on)
(global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(ruby-rubylint))
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'css-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(add-hook 'projectile-rails-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(add-hook 'ruby-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(add-hook 'js-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(add-hook 'js-mode-hook
  (function (lambda ()
          (setq js-indent-level ruby-indent-level))))
(add-hook 'ng2-ts-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(add-hook 'ng2-html-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(add-hook 'typescript-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setq-default indent-tabs-mode nil)
