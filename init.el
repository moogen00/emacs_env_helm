(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives
;;          '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
(require 'setup-helm)
(require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)


;; multi-term
(require 'multi-term)
;; (setq multi-term-program "/bin/bash")
(setq multi-term-program "/usr/bin/zsh")


;; my-keybinding
(require 'setup-my-config)
(require 'setup-my-multi-term)
;; sr speedbar start
(require 'sr-speedbar)
;; speedbar를 창 왼쪽에 띄운다.
(setq sr-speedbar-right-side nil)
;; 파일목록 자동 갱신
(setq sr-speedbar-auto-refresh t)


;; speedbar 토글. speedbar가 뜨면 포커스를 speedbar로 이동.
;; (defun my-speedbar ()
;;   "Toggle sr-speedbar and select"
;;   (interactive)
;;   (progn
;;     (sr-speedbar-toggle)
;;     (if (sr-speedbar-exist-p)
;;         (sr-speedbar-select-window))))

;; ;; ;; 단축키 C-x p
;; (global-set-key (kbd "C-x p") 'my-speedbar)
;; sr speedbar end


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map [ ( tab ) ] 'company-complete )
(define-key c++-mode-map [ ( tab ) ] 'company-complete )


(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))


;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)




;; theme
(require 'setup-theme)
;; (load-theme 'subatomic t)
;; (require 'emacs-color-themes)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile magit helm-descbinds multi-term shell-switcher sudo-edit sublime-themes sr-speedbar hc-zenburn-theme subatomic-theme zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
 '(send-mail-function (quote mailclient-send-it))
 '(subatomic-high-contrast t)
 '(subatomic-more-visible-comment-delimiters t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; f8 gdb 디버거 시작
(global-set-key [f8] 'gdb)
;; f9 소스창에서 바로 브레이크포인트 설정
(global-set-key [f9] 'gud-break)
;; shift + f9 키로 gud를 실행한다
(global-set-key [(shift f9)] 'gud-run)
;; f10 라인 실행하고 다음 라인으로
(global-set-key [f10] 'gud-next)
;; f11 함수안으로 따라 들어간다
(global-set-key [f11] 'gud-step)
;; f12 현재 실행중인 함수 리턴후 멈춤
(global-set-key [f12] 'gud-finish)
;; shift + f10 현재 커서까지 실행하고 멈춤
(global-set-key [(shift f10)] '(lambda ()
                                 (interactive)
                                 (call-interactively 'gud-tbreak)
                                 (call-interactively 'gud-cont)))
;; shift + f12 gdb 다중창 On/Off
(global-set-key [(shift f12)] 'gdb-many-windows)
;; shift + f11 키로 gdb의 layout을 변경합니다
(global-set-key [(shift f11)] 'my-gdb-settings-toggle)


(require 'shell-switcher)
(setq shell-switcher-mode t)
(setq-default explicit-shell-file-name "/bin/bash")
(setq-default shell-file-name "/bin/bash")



;; (setq helm-projectile-fuzzy-match nil)
;; (require 'helm-projectile)
;; (helm-projectile-on)


(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm-descbinds                      ;;
;;                                              ;;
;; GROUP: Convenience -> Helm -> Helm Descbinds ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-descbinds)
(helm-descbinds-mode)
