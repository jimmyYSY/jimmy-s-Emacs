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
			 reveal-in-osx-finder
			 web-mode
			 js2-refactor
                         expand-region
			 iedit
			 org-pomodoro
			 jsx-mode
			 angular-mode
			 ng2-mode
			 exec-path-from-shell
			 projectile
			 flycheck
			 auto-yasnippet
			 window-numbering
			 which-key
			 use-package
			 company-anaconda
			 typescript-mode
			 magit
			 ivy
			 markdown-mode
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

;;默认启用ivy-mode
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)


(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;;swiper config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 ("\\.jsx\\'" . jsx-mode))
       auto-mode-alist))

(global-company-mode t)

;;config for web mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;;两个空格和四个空格之间切换
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn
	(setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	(setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	(setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2) 4 2)))
  (setq indent-tabs-mode nil))

(add-hook 'js2-mode-hook #'js2-refactor-mode)

(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
    ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
    (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*)" 1)
                               ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("Function" "function[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                               ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                               ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                               ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                               ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                               ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
          (lambda ()
            (setq imenu-create-index-function 'js2-imenu-make-index)))

(add-hook 'python-mode-hook
	  (lambda()
	    (set (make-local-variable 'company-backends ) '((company-anaconda company-dabbrev-code) company-dabbrev))))

;;markdown文件使用markdown-mode模块
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


;;(load-theme 'monokai t)
(load-theme 'manoj-dark t)

;;popwin config
(require 'popwin)
(popwin-mode t)
(add-to-list 'exec-path "d:/msys64/mingw64/bin")
(require 'org-pomodoro)

(add-hook 'js2-mode 'flycheck-mode)
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(window-numbering-mode 1)

(which-key-mode 1)

(provide 'init-packages)
