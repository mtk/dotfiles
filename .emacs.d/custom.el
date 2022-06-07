(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   [solarized-bg red green yellow blue magenta cyan solarized-fg])
 '(bs-max-window-height 80)
 '(column-number-mode t)
 '(comment-column 40)
 '(custom-safe-themes
   '("ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" default))
 '(desktop-base-file-name "desktop")
 '(desktop-base-lock-name "desktop.lock")
 '(desktop-clear-preserve-buffers
   '("\\*scratch\\*" "\\*Messages\\*" "\\*server\\*" "\\*tramp/.+\\*" "\\*Warnings\\*" "\\*Packages\\*"))
 '(desktop-globals-to-save
   '(desktop-missing-file-warning tags-file-name tags-table-list search-ring regexp-search-ring register-alist file-name-history kill-ring))
 '(desktop-load-locked-desktop 'check-pid)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(fci-rule-color "#eee8d5")
 '(fit-window-to-buffer-horizontally t)
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-indent-guides-method 'character)
 '(highlight-indent-guides-responsive 'stack)
 '(lsp-file-watch-threshold 20000)
 '(lsp-keymap-prefix "s-s")
 '(lsp-metals-show-implicit-arguments t)
 '(lsp-metals-show-implicit-conversions-and-classes t)
 '(lsp-metals-show-inferred-type nil)
 '(lsp-metals-super-method-lenses-enabled t)
 '(lsp-ui-doc-position 'bottom)
 '(lsp-ui-doc-use-childframe nil)
 '(lsp-ui-sideline-show-hover t)
 '(magit-repository-directories
   '(("/home/mtk/IdeaProjects" . 1)
     ("/home/mtk/proj/git" . 1)))
 '(next-error-message-highlight 'keep)
 '(on-screen-global-mode t)
 '(package-selected-packages
   '(0x0 a inspector ac-c-headers ac-capf clang-capf vundo highlight-indent-guides company-quickhelp flycheck-pos-tip pos-tip company-shell treemacs-tab-bar evm git-grep python-docstring python-info pipenv importmagic python-black lsp-pyright lxc git-link pandoc pandoc-mode company-lsp elpy company-plsense key-chord pastebin pydoc recursive-narrow restclient slack vline whois windresize comment-tags crontab-mode dad-joke beacon teco elisp-format elpygen projectile helpful hl-indent hl-todo hlinum aws-snippets gist git-timemachine gitattributes-mode smartparens indent-guide ack lsp-metals lsp-java dap-mode lsp-ui ac-etags flycheck-eldev smart-backspace page-break-lines ccls treemacs-icons-dired treemacs-magit auto-yasnippet yasnippet-snippets yasnippet project-explorer company company-c-headers company-nginx eglot aggressive-indent csv-mode filladapt js2-mode json-mode register-list vlf which-key flycheck-package package-lint flycheck flylisp markdown-preview-mode memory-usage elmacro posframe ialign list-register list-utils logview magithub sx 0blayout autofit-frame autofit-frame fit-frame browse-kill-ring ensime fit-frame go-add-tags go-autocomplete go-complete go-direx go-eldoc go-errcheck go-fill-struct go-gen-test go-gopath go-guru go-imports go-mode go-playground go-playground-cli go-rename go-scratch go-snippets go-stacktracer go-tag haskell-mode help-mode+ indent-info jetbrains k8s-mode key-quiz scala-mode browse-kill-ring kubernetes kubernetes-tramp kwin magit magit-filenotify magit-find-file magit-gh-pulls magit-gitflow magit-imerge pcre2el sbt-mode use-package volatile-highlights yaml-mode zenburn-theme zoom-frm zoom-window zop-to-char))
 '(projectile-switch-project-action 'projectile-dired)
 '(safe-local-variable-values
   '((flycheck-disabled-checkers emacs-lisp-checkdoc)
     (eval when
	   (and
	    (buffer-file-name)
	    (not
	     (file-directory-p
	      (buffer-file-name)))
	    (string-match-p "^[^.]"
			    (buffer-file-name)))
	   (unless
	       (derived-mode-p 'emacs-lisp-mode)
	     (emacs-lisp-mode))
	   (setq-local flycheck-checkers nil))
     (checkdoc-minor-mode . 1)))
 '(save-place-mode t)
 '(send-mail-function 'smtpmail-send-it)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode t)
 '(smtpmail-default-smtp-server "smtp.gmail.com")
 '(smtpmail-servers-requiring-authorization "smtp[.]gmail[.]com")
 '(smtpmail-smtp-server "smtp.gmail.com" t)
 '(smtpmail-smtp-service 587 t)
 '(smtpmail-smtp-user "mark.t.kennedy@gmail.com")
 '(smtpmail-stream-type nil)
 '(tab-bar-mode t)
 '(tab-bar-new-tab-to 'rightmost)
 '(tab-bar-select-tab-modifiers '(alt))
 '(tab-bar-tab-hints t)
 '(tooltip-resize-echo-area t)
 '(treemacs-follow-mode nil)
 '(treemacs-is-never-other-window t)
 '(treemacs-width 45)
 '(truncate-lines t)
 '(use-short-answers t)
 '(user-mail-address "mtk@acm.org")
 '(warning-suppress-types '((comp) (comp) (comp) (comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "JB  " :slant normal :weight normal :height 120 :width normal))))
 '(highlight-indent-guides-character-face ((t (:foreground "yellow"))))
 '(highlight-indent-guides-even-face ((t (:background "dark sea green"))))
 '(highlight-indent-guides-odd-face ((t (:background "lavender"))))
 '(highlight-indent-guides-stack-character-face ((t (:foreground "#ffff00"))))
 '(highlight-indent-guides-stack-even-face ((t (:foreground "blue"))))
 '(highlight-indent-guides-stack-odd-face ((t (:foreground "firebrick"))))
 '(lsp-ui-sideline-symbol ((t (:foreground "grey" :box (:line-width (1 . -1) :color "grey") :height 0.99)))))
