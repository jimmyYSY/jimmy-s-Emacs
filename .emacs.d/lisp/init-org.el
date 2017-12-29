;;org-mode 修改
(require 'org)
(setq org-src-fontify-natively t)
;;打开org文件快捷键
;;设置org默认目录以及 org打开快捷键
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)


(provide 'init-org)
