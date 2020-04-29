(provide 'setup-my-multi-term)

(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))

;; (add-hook 'term-mode-hook
;;           (lambda ()
;;             (setq show-trailing-whitespace nil)))


(add-hook 'term-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace nil)))


(add-hook 'term-mode-hook (lambda ()
                             (yas-minor-mode -1)
                             (setq term-buffer-maximum-size 1000)
                             (toggle-truncate-lines 1)
                             (define-key term-raw-map (kbd "C-t") 'my-term-switch-line-char)
                             (define-key term-mode-map (kbd "C-t") 'my-term-switch-line-char)
                             (define-key term-raw-map (kbd "M-x") 'execute-extended-command)
                             (define-key term-raw-map (kbd "C-y") 'term-paste)
                             (define-key term-raw-map (kbd "C-c l") 'org-store-link)
                             (define-key term-raw-map (kbd "C-c c") 'org-capture)
                             (define-key term-raw-map (kbd "C-c a") 'org-agenda)
                             (define-key term-raw-map (kbd "C-c C-e") 'term-send-esc)
                             ))

(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))


 (defun my-term-switch-line-char ()
   "Switch `term-in-line-mode' and `term-in-char-mode' in `ansi-term'"
   (cond)
   (interactive
    ((term-in-line-mode)
     (term-char-mode)
     (hl-line-mode -1))
    ((term-in-char-mode)
     (term-line-mode)
     (hl-line-mode 1))))
