;;(package-initialize)
;;备份文件
;;(setq make-backup-files nil)
;;禁止自动保存
;;(setq auto-save-default nil)
(require 'cl)
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;;add whatever package you want here
(defvar jimmy/packages '(
			 company
			 monokai-theme
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 nodejs-repl
			 exec-path-from-shell
			 popwin
			 ) "Default packages")
(setq package-selected-packages jimmy/packages)

(defun jimmy/packages-installed-p ()
  (loop for pkg in jimmy/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (jimmy/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg jimmy/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;mac os 系统node 寻址操作
;;let emacs could find the execuable 
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'hungry-delete)
(global-hungry-delete-mode)

;;smartparens config
;;局部使用
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;全局使用
(smartparens-global-mode t)

;;swiper config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)

(load-theme 'monokai t)

;;popwin config
(require 'popwin)
(popwin-mode t)

(provide 'init-packages)