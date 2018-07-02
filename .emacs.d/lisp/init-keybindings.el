;;(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
;;ivy mode 设置
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;自定义按键
;;文本选择
(global-set-key (kbd "C-c SPC") 'set-mark-command)
;;复制文本
(global-set-key (kbd "C-c w") 'kill-ring-save)
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
(global-set-key (kbd "M-s i") 'counsel-imenu)
;;raka remember
;;(global-set-key (kbd "C-c r") 'org-capture)
;;延迟加载dire
;;js2r mode开启
(js2r-add-keybindings-with-prefix "C-c C-m")
;;tab制表位缩进 2/4 切换
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
;;选中文件内容
(global-set-key (kbd "C-=") 'er/expand-region)
;;注释
(global-set-key (kbd "C-c /") 'my-comment-or-uncomment-region)
;;修改company 按键 为C-n 和 C-p选择
;; (with-eval-after-load 'company
;;   (define-key company-active-map (kbd "M-n") nil)
;;   (define-key company-active-map (kbd "M-p") nil)
;;   (define-key company-active-map (kbd "C-n") #'company-select-next)
;;   (define-key company-active-map (kbd "C-p") #'company-select-previous))
;;Enlarge current window
(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
;;shrink current window
(global-set-key (kbd "C-{") 'shrink-window-horizontally)
;;iedit mode
(global-set-key (kbd "C-;") 'iedit-mode)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-keybindings)

