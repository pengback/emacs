;;(require 'package)
;;(package-initialize)
;;(add-to-list 'package-archives' ("mepla" . "http://mepla.org/packages") t)
;;(add-to-list 'package-archives' ("gnu" . "http://elpa.gnu.org/packages/") t)


;;******************************************************************************
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages") t)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
;;********************************************************************


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (yasnippet cnfonts auto-complete js2-mode company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))



(setq line-number-mode t)
(setq column-number-mode t)
(setq visible-bell t)
;;(setq initial-frame-alist '((width .90) (height . 35)))
(setq default-line-spaceing 4)
(setq default-fill-column 90)
(setq default-fill-line 60)

;;开启高亮语法
(global-font-lock-mode 1)
;;高亮显示区域选择
(transient-mark-mode t)



(set-language-environment "UTF-8")
;; Setting English Font
(set-face-attribute
 'default nil :font "Verdana-12")
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Microsoft Yahei" :size 14)))
(put 'set-goal-column 'disabled nil)


;; auto-complete
;;(add-to-list 'load-path "~/.emacs.d/package")
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20160709.1429")

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20170125.245/")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170125.245/dict/")
(require 'auto-complete-config)
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-clang-20140409.752/")
(require 'auto-complete-clang)  
;; 设置不自动启动
(setq ac-auto-start nil)  
;; 设置响应时间 0.5
(setq ac-quick-help-delay 0.5)  
;;(ac-set-trigger-key "TAB")  
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)  
;; 提示快捷键为 M-/
(define-key ac-mode-map  (kbd "M-/") 'auto-complete)

(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)  
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
(add-hook 'css-mode-hook 'ac-css-mode-setup)  
(add-hook 'auto-complete-mode-hook 'ac-common-setup)  
(global-auto-complete-mode t))  
(defun my-ac-cc-mode-setup ()  
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))  
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ac-source-gtags  
(my-ac-config)  
(ac-config-default)
;; 结束
