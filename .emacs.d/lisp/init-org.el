;;org-mode 修改
(require 'org)
(setq org-src-fontify-natively t)
;;打开org文件快捷键
;;设置org默认目录以及 org打开快捷键
(setq org-agenda-files '("~/.emacs.d"))

(setq org-capture-templates
      '(("t" "Tode" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n %i\n"
	 :empty-lines 1)))

(provide 'init-org)
