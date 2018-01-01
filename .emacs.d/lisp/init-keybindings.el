;;(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;自定义按键
;;打开init 配置文件
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
;;文本缩进
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
;;文本补全
(global-set-key (kbd "M-/") 'hippie-expand)
;;增强occur 按键
(global-set-key (kbd "M-s o") 'occur-dwim)
;;imenu自定义按键
;;(global-set-key (kbd "M-s i") 'counsel-imenu)
;;r aka remember
;;(global-set-key (kbd "C-c r") 'org-capture)
;;延迟加载dire
;;js2r mode开启
(js2r-add-keybindings-with-prefix "C-c C-m")
;;tab制表位缩进 2/4 切换
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
;;选中文件内容
(global-set-key (kbd "C-=") 'er/expand-region)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-keybindings)

