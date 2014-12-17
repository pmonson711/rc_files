(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
             '("marmalade" ."http://marmalade-repo.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(ac-trigger-key "C-SPC")
 '(coffee-tab-width 4)
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(dirtree-windata (quote (frame left 0.2 delete)))
 '(ede-project-directories (quote ("/Users/pmonson/src/EchoX/bridge-it-deploy" "/Users/pmonson/src/EchoX/main-app" "/Users/pmonson/vagrant/popf/src/tempo-sat-popf2")))
 '(evil-auto-balance-windows nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js2-basic-offset 4)
 '(js2-indent-switch-body t)
 '(js2-mode-indent-ignore-first-tab t)
 '(magit-use-overlays nil)
 '(markdown-command "pandoc")
 '(omnisharp-server-executable-path "~/src/OmniSharpServer/OmniSharp/bin/Release/OmniSharp.exe")
 '(org-agenda-files (quote ("~/org/from-mobile.org" "~/orgnotes.org")))
 '(org-directory "~/org" t)
 '(org-enforce-todo-dependencies t)
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg")
 '(org-mobile-inbox-for-pull "~/org/from-mobile.org")
 '(rainbow-html-colors-major-mode-list (quote (web-mode html-mode css-mode php-mode nxml-mode xml-mode less-css-mode)))
 '(sgml-basic-offset 4)
 '(sr-speedbar-right-side nil)
 '(writeroom-border-width 80)
 '(writeroom-disable-fringe nil)
 '(writeroom-fullscreen-effect (quote fullboth))
 '(writeroom-global-effects (quote (writeroom-toggle-fullscreen writeroom-toggle-alpha writeroom-toggle-menu-bar-lines writeroom-toggle-tool-bar-lines writeroom-toggle-vertical-scroll-bars writeroom-toggle-internal-border-width))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(show-paren-mode t)
(require 'windata)
(require 'tree-mode)
(require 'dirtree)
(require 'fiplr)
(setq fiplr-ignored-dir '((directories (".git", ".svn", ".vagrant"))
                          (files ("*.jpg", "*.gif", "*.zip", "*.png", "*~"))))
(require 'evil)
(evil-mode 1)

(load-theme 'solarized-dark t)
(tool-bar-mode -1)
(global-linum-mode 1)

(require 'auto-complete)
(global-auto-complete-mode t)
(autoload 'ac-etags "ac-etags" "Autocomplete etags." t)

(eval-after-load "etags"
  '(progn (ac-etags-setup)))
(add-to-list 'ac-sources 'ac-source-semantic)

(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)

(autoload 'js2-mode "js2-mode" "js2-mode" t)
(add-hook 'js2-mode (lambda ()
                      (require 'flymake-jshint)
                      (autoload 'js2-refactor "js2-refactor" "js2-refactor" t)
                      (add-hook 'js2-mode-hook 'ac-js2-mode)
                      (add-hook 'js2-mode 'flymake-jshint-load)
                      (add-hook 'js2-mode 'flycheck-mode)))
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(ido-mode 1)

(autoload 'emmet-mode "emmet-mode" "emmet-mode" t)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

(autoload 'undo-tree "undo-tree" "undo-tree" t)
(global-undo-tree-mode)

(setq redisplay-dont-pause t)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-default-notes-file "~/orgnotes.org")
(setq org-directory "~/org")
(setq org-log-done 'time)
(setq org-log-done 'note)
(define-key global-map "\C-cn" 'org-capture)

(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'csharp-mode-hook '(lambda ()
                               (setq c-basic-offset 4)
                               (c-set-offset 'substatement-open 0) ))
(add-hook 'yaml-mode '(lambda ()
                        (flycheck-mode t)
                        (flyspell-mode t) ))

(autoload 'web-mode "web-mode" "web-mode" t)
(add-to-list 'auto-mode-alist (cons (rx ".cshtml" eos) 'web-mode))

;; Erlang setup
(autoload 'erlang-mode "erlang" "" t)
(setq load-path (cons "/usr/local/Cellar/erlang/17.1_1/lib/erlang/lib/tools-2.6.15/emacs" load-path))
(setq erlang-root-dir "/usr/local/Cellar/erlang/17.1_1/lib/erlang")
(setq exec-path (cons "/usr/local/Cellar/erlang/17.1_1/bin" exec-path))
(setq erlang-mode-hook '(lambda()
                          (require 'erlang-start)
                          (require 'erlang-flymake)
                          (auto-complete-mode 1) 
                          (add-to-list 'load-path "~/src/zotonic/priv/emacs")
                          (add-to-list 'auto-mode-alist '("\\.tpl$" . zotonic-tpl-mode))
                          (add-to-list 'load-path "~/src/distel/elisp")
                          (require 'distel)
                          (distel-setup) ))

(autoload 'elixir-mode "elixir-mode" "elixir-mode" t)
(setq elixir-mode-hook '(lambda()
                          (flycheck-mode t)
                          (flymake-mode t)
                          (auto-dictionary-mode 1)
                          (auto-auto-indent-mode 1)
                          (auto-complete-mode 1) ))

(autoload 'web-mode "web-mode" "web-mode" t)

;; Backup setup
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copy t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(add-hook 'speedbar-mode-hook '(lambda ()
                                 (linum-mode -1)
                                 (relative-line-numbers-mode -1)
                                 (speedbar-toggle-show-all-files)
                                 (speedbar-toggle-updates)))

(setq omnisharp-mode-hook '(lambda ()
                             (flycheck-mode) ))
;; Example evil-mode config
(global-evil-tabs-mode t)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-define-key 'insert omnisharp-mode-map
  (kbd "M-.") 'omnisharp-auto-complete)

(evil-define-key 'normal omnisharp-mode-map
  (kbd "<f12>") 'omnisharp-go-to-definition)

(evil-define-key 'normal omnisharp-mode-map
  (kbd "g u") 'omnisharp-find-usages)

(evil-define-key 'normal omnisharp-mode-map
  (kbd "g o") 'omnisharp-go-to-definition-other-window)

(evil-define-key 'normal omnisharp-mode-map
  (kbd "g r") 'omnisharp-run-code-action-refactoring)

(evil-define-key 'normal omnisharp-mode-map
  (kbd "g f") 'omnisharp-fix-code-issue-at-point)

(evil-define-key 'normal omnisharp-mode-map
  (kbd "g R") 'omnisharp-rename)

(evil-define-key 'normal omnisharp-mode-map
  (kbd ", i") 'omnisharp-current-type-information)

(evil-define-key 'insert omnisharp-mode-map
  (kbd ".") 'omnisharp-add-dot-and-auto-complete)

(evil-define-key 'normal omnisharp-mode-map
  (kbd ", n t") 'omnisharp-navigate-to-current-file-member)

(evil-define-key 'normal omnisharp-mode-map
  (kbd ", n s") 'omnisharp-navigate-to-solution-member)

(evil-define-key 'normal omnisharp-mode-map
  (kbd ", n f") 'omnisharp-navigate-to-solution-file-then-file-member)

(evil-define-key 'normal omnisharp-mode-map
  (kbd ", n F") 'omnisharp-navigate-to-solution-file)

(evil-define-key 'normal omnisharp-mode-map
  (kbd ", n r") 'omnisharp-navigate-to-region)

(evil-define-key 'normal omnisharp-mode-map
  (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)

(evil-define-key 'insert omnisharp-mode-map
  (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)

(evil-define-key 'normal omnisharp-mode-map
  (kbd ",.") 'omnisharp-show-overloads-at-point)


;; Speed up auto-complete on mono drastically. This comes with the
;; downside that documentation is impossible to fetch.
;;(setq omnisharp-auto-complete-want-documentation nil)
(define-key evil-normal-state-map (kbd "C-w f") 'neotree-toggle)
(define-key evil-normal-state-map (kbd "C-p") 'fiplr-find-file)
(define-key evil-normal-state-map (kbd "C-w g") 'magit-status)
(define-key evil-normal-state-map (kbd "C-w t") 'evil-tabs-tabedit)
(define-key evil-normal-state-map (kbd "C-w x") 'tabclose)
(define-key evil-normal-state-map (kbd "C-w x") 'evil-tab-sensitive-quit)
(evil-leader/set-key "t" 'evil-tabs-tabedit)

(setq ace-jump-word-mode-use-query-char nil)
(evil-leader/set-key "e" 'evil-ace-jump-word-mode) ; ,e for Ace Jump (word)
(evil-leader/set-key "l" 'evil-ace-jump-line-mode) ; ,l for Ace Jump (line)
(evil-leader/set-key "x" 'evil-ace-jump-char-mode) ; ,x for Ace Jump (char)(evil-leader/set-key "e" 'evil-ace-jump-word-mode) ; ,e for Ace Jump (word)
(evil-leader/set-key "l" 'evil-ace-jump-line-mode) ; ,l for Ace Jump (line)
(evil-leader/set-key "x" 'evil-ace-jump-char-mode) ; ,x for Ace Jump (char)
(setq evil-leader/in-all-states 1)

;; Prevent evil mode in these
(loop for (mode . state) in '((commint-mode              . emacs)
                              (shell-mode                . emacs)
                              (term-mode                 . emacs)
                              (magit-branch-manager-mode . emacs))
      do (evil-set-initial-state mode state))

(setq yas/root-directory "~/.emacs.d/snippets")
(global-relative-line-numbers-mode t)

(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)
(global-hl-line-mode t)

(defun helm-my-buffers ()
  (interactive)
  (helm-other-buffer '(helm-c-source-buffers-list
                       helm-c-source-elscreen
                       helm-c-source-projectile-files-list
                       helm-c-source-ctags
                       helm-c-source-recentf
                       helm-c-source-locate)
                     "*helm-my-buffers*"))

(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "u") 'neotree-change-root)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
