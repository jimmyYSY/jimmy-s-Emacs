
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
					    ;;qq
					    ("jqq" "2806446853")
					    ;;tel
					    ("jtel" "13041102857")))
;;禁止备份文件
(setq make-backup-files nil)
;;禁止自动保存
(setq auto-save-default nil)

;;缓存文件列表 最大25个文件
;;(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
;;补全括号够能，语句内显示两侧括号
(define-advice show-paren-function(:around (fn) fix-show-paren-function)
  "HighLight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


;;设置emacs支持中文
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(prefer-coding-system 'euc-cn)
(setq default-process-coding-system 'euc-cn)
(setq-default pathname-coding-system 'euc-cn)

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
;;代码补全功能增强 
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

;;修改询问yes or no 为 y or n
(fset 'yes-or-no-p 'y-or-n-p)
;;不再询问是否需要递归删除文件目录 或者 拷贝文件目录
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;;不在重复生成dired-buffer
(put 'dired-find-alternate-file 'disabled nil)
;;添加C-x C-j 打开当前文件列表
(require 'dired-x)
;;添加同级窗口自动选择copy路径
(setq dired-dwim-target t)
;;隐藏dos编码换行符
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
;;删除dos/unix编码换行符
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
;;增强occur默认为光标选中，或者当前光标所在单词
(defun occur-dwim ()
  "Call 'occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym))))
	regexp-history)
  (call-interactively 'occur))

;;设置代码注释增强为不选择文本则注释当前行
(defun my-comment-or-uncomment-region (beg end &optional arg)    
  (interactive (if (use-region-p)    
                   (list (region-beginning) (region-end) nil)    
                 (list (line-beginning-position)    
                       (line-beginning-position 2))))    
  (comment-or-uncomment-region beg end arg)    
)

;; 设置默认编码为 utf-8
(setq default-buffer-file-coding-system 'utf-8-emacs-dos)
;;Default coding system (for new files)
;;默认buffer编码是utf-8,(写文件)
;;(set-language-environment "utf-8-dos")
;;mac copy chrome url
(defun jimmy/insert-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (insert (jimmy/retrieve-chrome-current-tab-url)))


(defun jimmy/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (let ((result (do-applescript
                 (concat
                  "set frontmostApplication to path to frontmost application\n"
                  "tell application \"Google Chrome\"\n"
                  "	set theUrl to get URL of active tab of first window\n"
                  "	set theResult to (get theUrl) \n"
                  "end tell\n"
                  "activate application (frontmostApplication as text)\n"
                  "set links to {}\n"
                  "copy theResult to the end of links\n"
                  "return links as string\n"))))
    (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))

(provide 'init-better-defaults)
