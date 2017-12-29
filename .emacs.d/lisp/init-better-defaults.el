
;;关闭文件起止提示音
(setq ring-bell-function 'ignore)
;;自动加载外部文件
(global-auto-revert-mode t)
;;开启全局行号
(global-linum-mode t)
;;开启简写命令
;; abbrev config
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("1j" "jimmy")
					    ;;emacs regex
					    ;;163邮箱地址
					    ("jemail" "jimmy_ysy@163.com")
					    ;;google邮箱地址
					    ("jgmail" "jimmy.shiyuy@gmail.com")
					    ))
;;禁止备份文件
(setq make-backup-files nil)
;;禁止自动保存
(setq auto-save-default nil)

;;缓存文件列表 最大25个文件
(require 'recentf)
;;(recentf-mode 1)
(setq recentf-max-menu-items 25)
;;显示对应括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;自动缩进
(electric-indent-mode 1)
;;删除全部空格
(delete-selection-mode t)
;;全局缩进
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))


(provide 'init-better-defaults)
