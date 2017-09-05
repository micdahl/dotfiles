;;; init.el --- Initialization Options

;;; Commentary:
;;; Stuff is loaded from configuration.org

;;; Code:
(package-initialize)

(org-babel-load-file "~/.emacs.d/configuration.org")
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (flycheck sass-mode slim-mode yasnippet tss solarized-theme rspec-mode projectile-rails projectile powershell org-bullets log4e linum-relative json-mode ivy evil-surround evil-magit evil dockerfile-mode auto-complete auto-compile use-package)))
 '(safe-local-variable-values
   (quote
    ((rspec-docker-cwd . "/myapp/")
     (rspec-docker-container . "app")
     (rspec-use-docker-when-possible . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
