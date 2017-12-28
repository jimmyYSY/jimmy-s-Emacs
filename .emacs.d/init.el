;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)
;;备份文件
;;(setq make-backup-files nil)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(require 'cl)

;;add whatever package you want here
(defvar jimmy/packages '(
			 company
			 monokai-theme
			 
			 ) "Default packages")

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

(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-indent-mode 1)
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)
(global-linum-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(require 'org)
(setq org-src-fontify-natively t)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(global-set-key (kbd "<f2>") 'open-my-init-file)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-hl-line-mode t)
(load-theme 'monokai t)

(global-company-mode t)
(delete-selection-mode t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (monokai-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
