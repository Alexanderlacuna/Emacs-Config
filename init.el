
;;emacs.d/init.el

;;MELPA PACKAGE SUPPORT

;;Enables basic packaging

(require 'package)

;;(require 'appearance)

;;Add the melpa archive

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'appearance)

;;initializes the package infrastructure

(package-initialize)

;; If there are not archived package contents,refresh them

(when (not package-archive-contents)
  (package-refresh-contents))


;; ===================================
;; load my modules

;; ====================================

;;(require 'appearance)

;;my packages
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    material-theme                  ;; Theme
    elpy
    flycheck                        ;;on the fly syntax checking
    py-autopep8
    blacken
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

(elpy-enable)
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(haskell-mode rust-mode material-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))



;;rust config

(require 'rust-mode)

;;indentation using spaces
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))



;;rust formatt code  c-c c-f

(setq rust-format-on-save t)


;;running testing compiling code key binding

(define-key rust-mode-map (kbd "C-c C-r") 'rust-run)
(define-key rust-mode-map (kbd "C-c C-c") 'rust-check)

;;should add a binding for rust-run-clippy



;;haskell setup  install haskell-mode

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

;; hslint on the command line only likes this indentation mode;
;; alternatives commented out below.

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)


;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")


;;ad hslint ;;cabal install hlint

(require 'hs-lint)
(defun my-haskell-mode-hook ()
    (local-set-key "\C-cl" 'hs-lint))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
