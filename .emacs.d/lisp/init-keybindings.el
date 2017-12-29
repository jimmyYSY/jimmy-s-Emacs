;;(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;自定义按键
;;打开init配置文件
(global-set-key (kbd "<f2>") 'open-my-init-file)
;;打开文件列表
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;打开git缓存目录
(global-set-key (kbd "C-c p f") 'counsel-git)
;;打开org文件快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;;查找function
(global-set-key (kbd "C-h C-f") 'find-function)
;;查找variable
(global-set-key (kbd "C-h C-v") 'find-variable)
;;查找快捷键定义
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(provide 'init-keybindings)

