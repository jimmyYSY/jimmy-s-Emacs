
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; add more personal func
;; new init-func.el

;; (require 'init-func.el)

(require 'init-packages)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-org)
(require 'init-better-defaults)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
