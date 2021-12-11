


;;enable eglot automatically

(add-hook 'python-mode-hook 'eglot-ensure)
;; Enable autopep8
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(provide 'python_config)
