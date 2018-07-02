;;关闭工具栏
(tool-bar-mode -1)
;;关闭侧边栏
(scroll-bar-mode -1)
;;关闭顶部菜单栏
(menu-bar-mode -1)
;;启动界面关闭
(setq inhibit-splash-screen t)
;;更改光标样式
(setq-default cursor-type 'bar)
;;页面全屏显示
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;显示行数
(global-hl-line-mode t)
;;屏幕半透明
(loop-alpha)
;;使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间 
(setq display-time-day-and-date t)
;;时间的变化频率，单位多少来着？ 
(setq display-time-interval 10) 
;;启动时间显示
(display-time-mode t)

(provide 'init-ui)
