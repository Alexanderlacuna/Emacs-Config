;;playground for emacs 2

https://github.com/Alexanderlacuna/Emacs-Config.git;;emacs.d/init.el
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;;initializes the package infrastructure

(package-initialize)


(when (not package-archive-contents)
  (package-refresh-contents))


(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    material-theme                  ;; Theme
    monokai-pro-theme
    solarized-theme
    cyberpunk-theme
    dracula-theme
    )
  )


(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)


;;(load-theme 'material t)
;;(load-theme 'solarized-dark t)
;;sublime theme
;;(load-theme 'monokai-pro-classic  t)

(load-theme 'cyberpunk t)

;;(load-theme 'dracula t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dracula-theme solarized-theme monokai-pro-theme material-theme cyberpunk-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
