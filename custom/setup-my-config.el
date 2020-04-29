(provide 'setup-my-config)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; trailing whitespace
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; (add-hook 'term-mode-hook
;;           (lambda ()
;;             (setq show-trailing-whitespace nil)
;;             (autopair-mode -1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key Binding
;; dired mode go back 뒤로가기
(global-set-key (kbd "C-,") 'dired-up-directory)














;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; thing-edit
;;
(require 'thing-edit)

(defvar kyle-thing-edit-map (make-sparse-keymap)
  "Keybinding for `thing-edit'")

;; Copy.
(define-key kyle-thing-edit-map (kbd "w") 'thing-copy-word)
(define-key kyle-thing-edit-map (kbd "s") 'thing-copy-symbol)
(define-key kyle-thing-edit-map (kbd "m") 'thing-copy-email)
(define-key kyle-thing-edit-map (kbd "f") 'thing-copy-filename)
(define-key kyle-thing-edit-map (kbd "u") 'thing-copy-url)
(define-key kyle-thing-edit-map (kbd "x") 'thing-copy-sexp)
(define-key kyle-thing-edit-map (kbd "t") 'thing-copy-page)
(define-key kyle-thing-edit-map (kbd "v") 'thing-copy-sentence)
(define-key kyle-thing-edit-map (kbd "g") 'thing-copy-block)
(define-key kyle-thing-edit-map (kbd "o") 'thing-copy-whitespace)
(define-key kyle-thing-edit-map (kbd "i") 'thing-copy-list)
(define-key kyle-thing-edit-map (kbd "c") 'thing-copy-comment)
(define-key kyle-thing-edit-map (kbd "h") 'thing-copy-defun)
(define-key kyle-thing-edit-map (kbd "p") 'thing-copy-parentheses)
(define-key kyle-thing-edit-map (kbd "a") 'thing-copy-to-line-beginning)
(define-key kyle-thing-edit-map (kbd "e") 'thing-copy-to-line-end)

;; Cut.
(define-key kyle-thing-edit-map (kbd "SPC w") 'thing-cut-word)
(define-key kyle-thing-edit-map (kbd "SPC s") 'thing-cut-symbol)
(define-key kyle-thing-edit-map (kbd "SPC m") 'thing-cut-email)
(define-key kyle-thing-edit-map (kbd "SPC f") 'thing-cut-filename)
(define-key kyle-thing-edit-map (kbd "SPC u") 'thing-cut-url)
(define-key kyle-thing-edit-map (kbd "SPC x") 'thing-cut-sexp)
(define-key kyle-thing-edit-map (kbd "SPC t") 'thing-cut-page)
(define-key kyle-thing-edit-map (kbd "SPC v") 'thing-cut-sentence)
(define-key kyle-thing-edit-map (kbd "SPC g") 'thing-cut-block)
(define-key kyle-thing-edit-map (kbd "SPC o") 'thing-cut-whitespace)
(define-key kyle-thing-edit-map (kbd "SPC i") 'thing-cut-list)
(define-key kyle-thing-edit-map (kbd "SPC c") 'thing-cut-comment)
(define-key kyle-thing-edit-map (kbd "SPC h") 'thing-cut-defun)
(define-key kyle-thing-edit-map (kbd "SPC p") 'thing-cut-parentheses)
(define-key kyle-thing-edit-map (kbd "SPC a") 'thing-cut-to-line-beginning)
(define-key kyle-thing-edit-map (kbd "SPC e") 'thing-cut-to-line-end)

;; Replace
(define-key kyle-thing-edit-map (kbd "W") 'thing-replace-word)
(define-key kyle-thing-edit-map (kbd "S") 'thing-replace-symbol)
(define-key kyle-thing-edit-map (kbd "M") 'thing-replace-email)
(define-key kyle-thing-edit-map (kbd "F") 'thing-replace-filename)
(define-key kyle-thing-edit-map (kbd "U") 'thing-replace-url)
(define-key kyle-thing-edit-map (kbd "X") 'thing-replace-sexp)
(define-key kyle-thing-edit-map (kbd "T") 'thing-replace-page)
(define-key kyle-thing-edit-map (kbd "V") 'thing-replace-sentence)
(define-key kyle-thing-edit-map (kbd "G") 'thing-replace-block)
(define-key kyle-thing-edit-map (kbd "O") 'thing-replace-whitespace)
(define-key kyle-thing-edit-map (kbd "I") 'thing-replace-list)
(define-key kyle-thing-edit-map (kbd "C") 'thing-replace-comment)
(define-key kyle-thing-edit-map (kbd "H") 'thing-replace-defun)
(define-key kyle-thing-edit-map (kbd "P") 'thing-replace-parentheses)

(define-key kyle-thing-edit-map (kbd "A") 'thing-paste-to-line-beginning)
(define-key kyle-thing-edit-map (kbd "E") 'thing-paste-to-line-end)

;; add two key to select
(define-key kyle-thing-edit-map (kbd "l") 'kyle-select-to-line-end)
(define-key kyle-thing-edit-map (kbd "j") 'kyle-select-to-line-beginning)
(define-key kyle-thing-edit-map (kbd ";") 'kyle-select-list)

(global-set-key (kbd "M-c") kyle-thing-edit-map)
