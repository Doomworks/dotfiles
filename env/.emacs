;; Original Author: Amir Rajan (http://amirrajan.net)
;; Forked by: Cory Driscoll (https://drisc.io)


;; This is a import that ships with emacs.
;; package is Emacs's package manager.
(require 'package)

;; Emacs has an official repository of packages and a more current
;; unofficial one. Melpa is the 'unoffical one' (which in this
;; case translates to more up to date, newer, and by extension,
;; a bit more volatile). The official repo is called org. This
;; repo is slow changing and extremely stable (but doesn't have
;; all the cool/cutting edge packages that are being used).
(push '("melpa" . "http://melpa.org/packages/") package-archives)
(push '("org" . "http://orgmode.org/elpa/") package-archives)
(push '("melpa-stable" . "https://stable.melpa.org/packages/") package-archives)

;; After the repositories have been set, initialize the package
;; manager.
(package-initialize)

;; Set global keybinds
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

(add-to-list 'term-file-aliases
             '("st-256color" . "xterm-256color"));; Set Emacs editor variables and mode line theming

(windmove-default-keybindings)
(global-display-line-numbers-mode)
(electric-pair-mode 1)

(powerline-center-theme)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq standard-indent 2)

(defun cory-reinstall-packages-core ()
  ;; Emacs keeps a cache of the package list locally. We'll
  ;; initialize this cache once. If you ever go to install a package
  ;; and it cant be found, just rerun (package-reresh-contents).
  (unless package-archive-contents (package-refresh-contents))

  ;; Here is our big bad package list. Whenever you want to
  ;; install a new package, just add it to this list.
  (setq bootstrap-list
    '(use-package))

  (dolist (package bootstrap-list)
    (unless (package-installed-p package)
      (package-install package))))

(defun cory-reinstall-packages ()
  (interactive) (cory-reinstall-packages-core))

(cory-reinstall-packages-core)

;; Modes and Themes
;;(use-package rustic :ensure t)
(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))
(use-package powerline :ensure t)
(use-package pug-mode :ensure t)
(use-package json-mode
  :ensure t
  :config
  (add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2))))
;; Ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-vertical-buffers t)
  (setq ivy-count-format "(%d/%d) "))

;; Editor Configuration
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1)
  (menu-bar-mode -1)
  (define-key global-map (kbd "RET") 'newline-and-indent)
  (setq-default truncate-lines t)
  (setq visible-bell 1)
  (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
  (setq delete-old-versions -1)
  (setq version-control t)
  (setq vc-make-backup-files t)
  (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
  (setq large-file-warning-threshold 20000000)
  (defun cory-turn-on-show-trailing-whitespace ()
    (interactive)
    (setq show-trailing-whitespace t))

  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'prog-mode-hook 'cory-turn-on-show-trailing-whitespace)
)
;; Check Evil is installed and enable
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-i-jump nil)
  :config

  (evil-mode 1)
  (defun minibuffer-keyboard-quit ()
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))

  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  (global-set-key [escape] 'evil-exit-emacs-state)

  (defun evil-send-string-to-terminal (string)
    (unless (display-graphic-p) (send-string-to-terminal string)))

  (defun evil-terminal-cursor-change ()
    (when (string= (getenv "TERM_PROGRAM") "iTerm.app")
      (add-hook 'evil-insert-state-entry-hook (lambda () (evil-send-string-to-terminal "\e]50;CursorShape=1\x7")))
      (add-hook 'evil-insert-state-exit-hook  (lambda () (evil-send-string-to-terminal "\e]50;CursorShape=0\x7"))))
    (when (and (getenv "TMUX")  (string= (getenv "TERM_PROGRAM") "iTerm.app"))
      (add-hook 'evil-insert-state-entry-hook (lambda () (evil-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=1\x7\e\\")))
      (add-hook 'evil-insert-state-exit-hook  (lambda () (evil-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=0\x7\e\\")))))

  (evil-terminal-cursor-change)
)
;; Really need to escape *digs tunnel*
(use-package evil-escape :ensure t)

(use-package evil-leader
  :ensure t
  :config

  (defun amir-hsplit-and-find ()
    "Opens a new split window and brings up projectile so I can search for a file."
    (interactive)
    (evil-window-split)
    (projectile-find-file))

  (defun amir-split-and-find ()
    "Opens a new split window and brings up dired so I can ."
    (interactive)
    (evil-window-vsplit)
    (projectile-find-file))

  (defun amir-hsplit-and-dired ()
    "Opens a new split window and brings up dired so I can navigate a directory."
    (interactive)
    (evil-window-split)
    (ido-dired))

  (defun amir-eval-dwim ()
    "Send the current selected \"stuff\" to the repl."
    (interactive)
    (pcase major-mode
      (`clojure-mode (cider-eval-defun-at-point))
      (`clojurescript-mode (cider-eval-defun-at-point))
      (`fsharp-mode
       (progn
     (fsharp-eval-phrase)
     (evil-next-line 1)))
      (_ (eval-last-sexp nil))))

  (defun amir-zoom-buffer ()
    (interactive)
    (progn
      (evil-window-set-width (frame-width))
      (evil-window-set-height (frame-height))
      (redraw-display)))

  (defun amir-resize-equal ()
    (interactive)
    (balance-windows)
    (redraw-display))

  (defun amir-resize-window-dwim ()
    (interactive)
    (let ((maximize (< (window-width) (/ (frame-width) 2))))
      (cond ((< (window-width) 80) (evil-window-set-width 80))
        (maximize
         (progn
           (evil-window-set-width (frame-width))
           (evil-window-set-height (frame-height))
           (redraw-display)))
        ((not maximize) (evil-window-set-width 80)))))

  (defun amir-resize-window-vertical+ ()
    (interactive)
    (evil-window-set-height (+ (window-height) 10)))

  (defun amir-resize-window-vertical- ()
    (interactive)
    (evil-window-set-height (- (window-height) 10)))

  (defun amir-resize-window-horizontal+ ()
    (interactive)
    (evil-window-set-width (+ (window-width) 10)))

  (defun amir-resize-window-horizontal- ()
    (interactive)
    (evil-window-set-width (- (window-width) 10)))

  (defun amir-touch ()
    "Run touch command on current file."
    (interactive)
    (when buffer-file-name
      (shell-command (concat "touch " (shell-quote-argument buffer-file-name)))
      (clear-visited-file-modtime)))

  (defun amir-split-and-dired ()
    "Opens a new split window and brings up dired so I can navigate a directory."
    (interactive)
    (evil-window-vsplit)
    (ido-dired))

  (defun cory-enable-ac ()
    (interactive)
    (auto-complete-mode 1))
  (defun cory-disable-ac ()
    (interactive)
    (auto-complete-mode 0))
  (defun cory-run-cargo-build ()
    "Runs Rust 'cargo build'"
    (interactive)
    (cargo-process-build))
  (defun cory-run-cargo-run ()
    "Runs Rust 'cargo run'"
    (interactive)
    (cargo-process-run))
  (defun cory-run-cargo-test ()
    "Runs Rust 'cargo test'"
    (interactive)
    (cargo-process-test))

  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "v" 'counsel-git-grep
    "c" 'comment-dwim
    "e" 'amir-eval-dwim
    "j" 'avy-goto-line
    "w" 'avy-goto-word-0
    "m" 'amir-split-and-find
    "M" 'amir-hsplit-and-find
    "g" 'projectile-find-file
    "r" 'amir-cider-send-to-repl
    "t" 'amir-touch
    "f" 'next-error
    "d" 'previous-error
    "s" 'magit-status
    "h" 'vc-print-log
    ")" 'next-buffer
    "9" 'next-buffer
    "(" 'previous-buffer
    "0" 'previous-buffer
    "TAB" 'amir-resize-equal
    "2" 'amir-resize-window-vertical+
    "3" 'amir-resize-window-vertical-
    "1" 'amir-resize-window-horizontal-
    "4" 'amir-resize-window-horizontal+
    "z" 'amir-zoom-buffer
    "a" 'cory-enable-ac
    "q" 'cory-disable-ac
    "R" 'cory-cargo-run
    "B" 'cory-cargo-build
    "T" 'cory-cargo-test)

  (require 'flymake-lua)
  (add-hook 'lua-mode-hook 'flymake-lua-load)
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cargo lua-mode flymake-lua lsp-rust lsp-mode evil-magit arduino-mode stylus-mode json-mode ivy ivy-mode git magit evil-leader evil-escape editorconfig use-package markdown-mode evil ac-emoji))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((t (:foreground "#A89767"))))
 '(font-lock-comment-face ((t (:foreground "#737373"))))
 '(font-lock-constant-face ((t (:foreground "#C97E4mC"))))
 '(font-lock-function-name-face ((t (:foreground "#de9"))))
 '(font-lock-keyword-face ((t (:foreground "#D1A836"))))
 '(font-lock-string-face ((t (:foreground "#258FCC")))))
