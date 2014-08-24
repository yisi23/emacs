(global-set-key [(f2)] 'ansi-term);F2 切换到shell模式
;;打开就启用 text 模式
(setq default-major-mode 'text-mode)
;;num
(global-linum-mode 1) ; always show line numbers                            
(setq linum-format "%d| ")  ;set format

;;browse
(add-to-list 'load-path "~/.emacs.d/w3m") ;;引入emacs-w3m包
(require 'w3m)

;;Common-lisp
;;(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")  ; your SLIME directory
;;(require 'slime)
;;(slime-setup)

;; setup load-path and autoloads
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime")
(require 'slime-autoloads)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; 显示时间，格式如下
(display-time-mode 1)  
(setq display-time-24hr-format t)  
(setq display-time-day-and-date t)  
;;back ctrl +x 1/23/0
 (when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 


;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t) 

;; 在标题栏提示你目前在什么位置
(setq frame-title-format "jcb")  

 ;;yasnippet TAB自动补全
(add-to-list 'load-path	"/home/jcc/.emacs.d/plug/yasnippet")
(require 'yasnippet-bundle)

;;auto-complete
(add-to-list 'load-path	"/home/jcc/.emacs.d/plug/auto-complete")
(require   'auto-complete)
(require  'auto-complete-config)
(global-auto-complete-mode t)

(setq-default ac-sources  ' (ac-source-words-in-same-mode-buffers))
(add-hook  'emacs-lisp-mode-hook (lambda () (add-to-list  'ac-sources  'ac-source-symbols)))
(add-hook  'auto-complete-mode-hook (lambda () (add-to-list  'ac-sources  'ac-source-filename)))
(set-face-background  'ac-candidate-face  "blue " )
(set-face-underline  'ac-candidate-face "darkgray")
(set-face-background  'ac-selection-face  "blue" ) ;;; 设置比上面截图中更好看的背景颜色 
(define-key ac-completing-map   "C-b "   'ac-next)  ;;;  列表中通过按M-n来向下移动 
(define-key ac-completing-map "C-m"  'ac-previous)
(setq ac-auto-start  2 )
(setq ac-dwim t)
(define-key ac-mode-map  (kbd  "M-/" )  'auto-complete)



;; 设置界面
;;(set-background-color "")
;;(set-foreground-color "white")
;;(set-cursor-color "green")
 ;; color theme
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme) 
(color-theme-initialize)
;;(color-theme-deep-blue)
;;(color-theme-gray30)
;;(color-theme-aliceblue)
;;(color-theme-blue-mood)
(color-theme-gnome2) 
;;关闭提示
(setq initial-scratch-message t)
;;显示列号
(column-number-mode t)
;;显示匹配的括号
(show-paren-mode t)

; python-mode
;;(setq py-install-directory "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/")
(require 'python-mode)
(add-hook 'python-mode-hook
      (lambda ()
	(set-variable 'py-indent-offset 4)
	;(set-variable 'py-smart-indentation nil)
	(set-variable 'indent-tabs-mode nil)
	(define-key py-mode-map (kbd "RET") 'newline-and-indent)
	;(define-key py-mode-map [tab] 'yas/expand)
	;(setq yas/after-exit-snippet-hook 'indent-according-to-mode)
	(smart-operator-mode-on)
	))



; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")


; pymacs
;(add-to-list 'load-path "~/.emacs.d/Pymacs-0.25")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

; ropemacs
;(setq pymacs-load-path "~/.emacs.d/ropemacs")
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")


;; Auto Syntax Error Hightlight
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '(".py'" flymake-pyflakes-init)))
(add-hook 'find-file-hook 'flymake-find-file-hook)

(custom-set-variables
 ;; cunstom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
 
 (custom-set-variables
 '(slime-backend "/usr/share/emacs/site-lisp/slime/swank-loader.lisp"))
(custom-set-faces)
 
 
(put 'upcase-region 'disabled nil)

;;ibus
(add-to-list 'load-path	"/home/jcc/.emacs.d/ibus-el-0.3.2/")
 (require 'ibus)
        (add-hook 'after-init-hook 'ibus-mode-on)

;; C-SPACE 被输入法占用，C-@ 又太难按，于是把 set mark 绑定到 C-return
(define-key global-map [C-return] 'set-mark-command)


;; perl开发环境配置
(add-to-list 'load-path "/home/jcc/.emacs.d/pde/lisp")
     (load "pde-load")
(ido-mode 1)
(require 'template-simple)



;; M-SPC not available, window manager take it away
(global-set-key (kbd "M-'") 'just-one-space)
(global-set-key (kbd "C-M-=") 'pde-indent-dwim)
;; nearest key to dabbrev-expand
(global-set-key (kbd "M-;") 'hippie-expand)
(global-set-key (kbd "C-;") 'comment-dwim)
(global-set-key (kbd "C-c f") 'comint-dynamic-complete)

(setq hippie-expand-try-functions-list
          '(try-expand-line
            try-expand-dabbrev
            try-expand-line-all-buffers
            try-expand-list
            try-expand-list-all-buffers
            try-expand-dabbrev-visible
            try-expand-dabbrev-all-buffers
            try-expand-dabbrev-from-kill
            try-complete-file-name
            try-complete-file-name-partially
            try-complete-lisp-symbol
            try-complete-lisp-symbol-partially
            try-expand-whole-kill))
(autoload 'comint-dynamic-complete "comint" "Complete for file name" t)
(setq comint-completion-addsuffix '("/" . ""))
(setq-default indent-tabs-mode nil)

(defalias 'perl-mode 'cperl-mode)
(defun pde-perl-mode-hook ()
  (abbrev-mode t)
  (add-to-list 'cperl-style-alist
               '("PDE"
                 (cperl-auto-newline                         . t)
                 (cperl-brace-offset                         . 0)
                 (cperl-close-paren-offset                   . -4)
                 (cperl-continued-brace-offset               . 0)
                 (cperl-continued-statement-offset           . 4)
                 (cperl-extra-newline-before-brace           . nil)
                 (cperl-extra-newline-before-brace-multiline . nil)
                 (cperl-indent-level                         . 4)
                 (cperl-indent-parens-as-block               . t)
                 (cperl-label-offset                         . -4)
                 (cperl-merge-trailing-else                  . t)
                 (cperl-tab-always-indent                    . t)))
  (cperl-set-style "PDE"))
  
  ;;语法检查
  
  (global-set-key (kbd "C-c s") 'compile-dwim-compile)
(global-set-key (kbd "C-c r") 'compile-dwim-run)
(setq compilation-buffer-name-function 'pde-compilation-buffer-name)
(autoload 'compile-dwim-run "compile-dwim" "Build and run" t)
(autoload 'compile-dwim-compile "compile-dwim" "Compile or check syntax" t)
(autoload 'executable-chmod "executable"
          "Make sure the file is executable.")

(defun pde-perl-mode-hook ()
   ;; chmod when saving
  (when (and buffer-file-name
        (not (string-match "\\.\\(pm\\|pod\\)$" (buffer-file-name))))
      (add-hook 'after-save-hook 'executable-chmod nil t))
  (set (make-local-variable 'compile-dwim-check-tools) nil))
  
  
  
  
  
  
  ;;code browsing
  
  (global-set-key (kbd "C-c i") 'imenu)
(global-set-key (kbd "C-c v") 'imenu-tree)
(global-set-key (kbd "C-c j") 'ffap)
(setq tags-table-list '("./TAGS" "../TAGS" "../../TAGS"))
(autoload 'imenu-tree "imenu-tree" "Show imenu tree" t)
(setq imenu-tree-auto-update t)
(eval-after-load "imenu"
 '(defalias 'imenu--completion-buffer 'pde-ido-imenu-completion))
(autoload 'tags-tree "tags-tree" "Show TAGS tree" t)
;; A wonderful minibuffer completion mode
(partial-completion-mode 1)
(setq PC-include-file-path
      (delete-dups (append PC-include-file-path pde-perl-inc)))
(setq ffap-url-regexp
      (concat
       "\\`\\("
       "news\\(post\\)?:\\|mailto:\\|file:" ; no host ok
       "\\|"
       "\\(ftp\\|https?\\|telnet\\|gopher\\|www\\|wais\\)://" ; needs host
       "\\)[^:]" ; fix for perl module, require one more character that not ":"
       ))
(add-to-list 'ffap-alist  '(cperl-mode . pde-ffap-locate))

;; Rebinding keys for hideshow
(require 'hideshow)
(define-key hs-minor-mode-map "\C-c\C-o"
  (let ((map (lookup-key hs-minor-mode-map "\C-c@")))
    ;; C-h is help to remind me key binding
    (define-key map "\C-h" 'describe-prefix-bindings)
    (define-key map "\C-q" 'hs-toggle-hiding)
    ;; compatible with outline
    (define-key map "\C-c" 'hs-hide-block)
    (define-key map "\C-e" 'hs-show-block)
    map))
    
    
    
    
    ;;doc
    
    (global-set-key (kbd "C-c h") 'help-dwim)
(setq cperl-lazy-help-time 2)
(defun pde-perl-mode-hook ()
   (cperl-lazy-install))
   
   
   
   (autoload 'run-perl "inf-perl" "Start perl interactive shell" t)
   
   
   
   
   
   (autoload 'perldb-ui "perldb-ui" "perl debugger" t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; mew -- mail
 (autoload 'mew "mew" nil t)
 (autoload 'mew-send "mew" nil t)
 ;; Optional setup (Read Mail menu for Emacs 21):
 (if (boundp 'read-mail-command)
     (setq read-mail-command 'mew))
 ;; Optional setup (e.g. C-xm for sending a message):
 (autoload 'mew-user-agent-compose "mew" nil t)
 (if (boundp 'mail-user-agent)
     (setq mail-user-agent 'mew-user-agent))
 (if (fboundp 'define-mail-user-agent)
     (define-mail-user-agent
       'mew-user-agent
       'mew-user-agent-compose
       'mew-draft-send-message
       'mew-draft-kill
       'mew-send-hook))
