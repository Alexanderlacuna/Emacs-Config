(require 'package)

(add-to-list 'load-path "~/.emacs.d/settings")



(require 'appearance)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    monokai-pro-theme
    magit
    rust-mode
    elpy
    flycheck
    py-autopep8
    eglot
    )
  )

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)


(load-theme 'monokai-pro-classic  t)


(require 'python_config)
(require 'rust_config)

;;rust configs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rust-mode solarized-theme monokai-pro-theme material-theme magit dracula-theme cyberpunk-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
