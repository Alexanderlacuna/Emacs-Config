;;emacs.d/init.el

;;MELPA PACKAGE SUPPORT

;;Enables basic packaging

(require 'package)

;;Add the melpa archive

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;;initializes the package infrastructure

(package-initialize)

;; If there are not archived package contents,refresh them

(when (not package-archive-contents)
  (package-refresh-contents))

;;my packages

(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    material-theme                  ;; Theme
    )
  )

;;scan my packages and install in not

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;;===============================
;; Basic customization
;;==============================


(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(material-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
