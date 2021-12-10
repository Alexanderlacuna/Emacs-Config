


(require 'rust-mode)

;;indentation using spaces
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(setq rust-format-on-save t)

;;running testing compiling code key binding

(define-key rust-mode-map (kbd "C-c C-r") 'rust-run)
(define-key rust-mode-map (kbd "C-c C-c") 'rust-check)


(provide 'rust_config)
