;; mtks-emacs-init --- what's to summarize??

;;; Commentary:
;;;
;;; this used to be too large to use directly and i went to great
;;; lengths to "dump" my own emacs (emacs is a "dumped" lisp
;;; environment).  but then i switched to emacsserver which means i
;;; started emacs infrequently.  but now i've fallen back to the
;;; traditional style which is simpler since startup is fast enough
;;; and i can use emacsclient to launch new windows.

;; everyone says they're here :-)
(defadvice load (before debug-log activate)
  (message "Advice: now loading: '%s'" (ad-get-arg 0)))



;;; requires
(require 'cperl-mode)

;; old favorites, some very old :-)
(require 'page-menu)
(require 'trim)



;;; package support

;(add-to-list '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))



;;; key bindings

;; everyone assumes Alt_L is Alt, so using xmodmap to change its
;; keysym to Meta_L is a losing proposition.  Instead, i make Alt_R be
;; Meta_R and then these two emacs variable bindings swap Alt and Meta
;; since Alt_L is much better as meta.
(setq x-meta-keysym 'alt)
(setq x-alt-keysym 'meta)

;; plain & control characters
(define-key global-map "\C-w" 'backward-kill-word) ; normal delete word

;; function keys

; f1 - alternate to ^H (help).  needed?
(define-key global-map [f2] 'fit-frame)
; f3 - kmacro start-or-insert-counter
; f4 - kmacro end or call macro
; f5 - empty
(define-key global-map [f6] 'winner-undo)
(define-key global-map [f7] 'delete-other-windows)
(define-key global-map [f8] 'quit-window)
(define-key global-map [f9] 'undo)
; f10 - menu bar open!
(define-key global-map [f11] 'server-edit)
(define-key global-map [f12] 'call-last-kbd-macro)
(define-key global-map [S-f7] 'delete-frame)
(define-key global-map [S-f8] 'page-menu)

(define-key global-map [up] 'up-one-line)
(define-key global-map [down] 'down-one-line)
(define-key global-map [right] 'scroll-left)
(define-key global-map [left] 'scroll-right)
(define-key global-map [C-right] 'my-scroll-left-one-column)
(define-key global-map [C-left] 'my-scroll-right-one-column)

;; Hyper key bindings! for the auto creation of yasnippets!
;; todo - figure out how this works
(global-set-key (kbd "H-w") 'aya-create)
(global-set-key (kbd "H-y") 'aya-expand)

;; mouse bindings
(define-key global-map [S-down-mouse-3] 'imenu)

;; control-x characters
;;(define-key ctl-x-map "\C-[" 'electric-command-history) ; nifty m-x review/edit
(define-key ctl-x-map "\C-b" 'bs-show) ; nifty buffer menu
(define-key ctl-x-map "'"    'next-error) ; for jde mode & cc-mode & maybe perl mode
(define-key ctl-x-map "="    'what-cursor-position) ; newer & better
(define-key ctl-x-map "l"    'ialign)	; interactive column alignment

;; meta characters
(define-key esc-map "=" 'count-words-region)  ; back to normal
(define-key esc-map "," 'beginning-of-buffer) ; easier to type
(define-key esc-map "." 'end-of-buffer)	      ; ditto
(define-key esc-map "<" 'find-tag)	      ; have to follow through
(define-key esc-map ">" 'tags-loop-continue) ; continue interrupted tags fn
(define-key esc-map "?" 'etags-select-find-tag-at-point) ; new
(define-key esc-map "n" 'down-comment-lines) ; hard to believe this was missing
(define-key esc-map "p" 'up-comment-lines)   ; this too
(define-key esc-map "o" 'goto-top-or-bottom) ; just a wrapper function
(define-key esc-map "s" 'center-line) ; manual says this, but not true?
(define-key esc-map [?\e] 'teco:command)

;; make a new prefix char -
(defvar ctl-rsb-map (make-sparse-keymap)      ; new, empty keymap
  "Keymap for control-rsb \"C-]\" functions")
(fset 'ctl-rsb-prefix ctl-rsb-map)    ; chain them together
(define-key global-map "\C-]" 'ctl-rsb-prefix) ; and define it

;; control-rsb characters - i mostly use ctl-rsb-ctl-char since
;; it is easy to keep a finger on the control key while typing both
;; the prefix char and the dispatch char.
(define-key ctl-rsb-map "\C-c" 'backward-capitalize-word)
(define-key ctl-rsb-map "\C-g" 'goto-line) ; easier then <arg> c-n
(define-key ctl-rsb-map "\C-l" 'backward-lowercase-word)
(define-key ctl-rsb-map "\C-r" 'revert-buffer) ; not on any key normally
(define-key ctl-rsb-map "\C-t" 'transpose-windows)	 ; convenient
(define-key ctl-rsb-map "\C-u" 'backward-uppercase-word) ; from the old days
(define-key ctl-rsb-map "\C-v" 'scroll-other-window) ; easier to type than m-c-v
(define-key ctl-rsb-map "\C-w" 'kill-region) ; safer place than bare c-w
(define-key ctl-rsb-map ";"    'kill-comment) ; forget why

;; tab-bar functions
(define-key global-map [s-left]    'tab-previous)
(define-key global-map [s-right]   'tab-next)
(define-key global-map (kbd "s-_") 'tab-bar-undo-close-tab)
(define-key global-map [s-return]  'tab-bar-select-tab-by-name)
(define-key global-map (kbd "s-o") 'tab-bar-switch-to-recent-tab)
(define-key global-map [S-s-left]  'tab-bar-move-tab-left)
(define-key global-map [S-s-right] 'tab-bar-move-tab)

;; try some built-in help alternatives
(define-key help-map "f" 'helpful-callable)
(define-key help-map "k" 'helpful-key)
(define-key help-map "v" 'helpful-variable)
(define-key help-map "C" 'helpful-command) ; don't need coding system help
(define-key help-map "F" 'helpful-function) ; has link to info node in output anyway
(global-set-key (kbd "C-c C-d") 'helpful-at-point) ; they claim it is useful for lisps?
(require 'helpful)
(define-key helpful-mode-map " " 'quit-window)	   ; this brings back such memories!

;; no bindings for these?
;(define-key help-map "" 'helpful-symbol)
;(define-key help-map "" 'helpful-macro)

(define-key global-map (kbd "s-t") 'treemacs)



;;; properties

(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)



;;; variables

(setq

 ;; file/mode mappings
 auto-mode-alist (append '(("README"				.	text-mode)
			   ("readme"				.	text-mode)
			   ("\\.notes$"				.	text-mode)
			   ("\\.\\([pP][Llm]\\|al\\)\\'"	.	cperl-mode)
			   ("\\.cgi$"				.	cperl-mode))
			 auto-mode-alist)

 ;; behavior
 abbrev-file-name "~/.emacs.d/abbrev_defs.el"
 default-major-mode 'text-mode		; might as well
 x-stretch-cursor t			; bloat for tabs
 default-indicate-empty-lines t		; show noise at the bottom of buffers
 comment-style 'indent			; default aligns on right margin (ugh)
 next-line-add-newlines t		; so C-N doesn't beep at you
 inhibit-startup-echo-area-message "mtk" ; too many drugs at MIT (see its implementation)
 initial-scratch-message nil		; i know my way around
 inhibit-startup-screen t		; no startup screen
 default-truncate-lines t               ; always truncate, we scroll horizontally
 truncate-partial-width-windows t       ; including buffers in part of a frame, not the entire frame
 disabled-command-hook nil		; i'm no novice
 version-control t			; tops-20 generation numbers live on
 trim-versions-without-asking t		; don't bother me with questions
 delete-auto-save-files t		; kill when real save takes place
 delete-old-versions 'no		; kill when real save takes place
 auto-save-default nil			; don't do autosaving by default
 search-highlight t			; highlight current match for incremental search
 default-indicate-buffer-boundaries 'left ; show beg/end of buffer in fringe
 mark-even-if-inactive t                ; from stallman - keeps the mark alive when transient is hidden
 desktop-save-buffer t                  ; says it saves buffer status but doesn't explain what that is
 window-divider-default-places t	; lets you resize both horizontally and veritcally using the bars

 ;; sizings
 window-min-height 2			; allow 1-line windows
 window-min-width 1			; allow 1-column windows
 max-lisp-eval-depth 6000		; (def 300, 20x)
 max-specpdl-size 6000			; (def 600, 10x)
 undo-limit 400000			; min at GC time (def 20,000)
 undo-strong-limit 500000		; max at GC time (def 30,000)
 undo-tree-visualizer-timestamps t	; can "go back in time" more easily with them
 kill-ring-max 200			; can be bigger but never smaller
 gc-cons-threshold 100000000		; 100 million, an LSP recommendation
 mark-ring-max 32			; default 16
 regexp-search-ring-max 32		; default 16
 search-ring-max 32			; default 16
 hscroll-margin 1			; default 5

 ;; column
 line-number-mode t			; put row in modeline
 column-number-mode t

 ;; font-lock
 font-lock-maximum-size nil		; def 256,000, but no max
 font-lock-verbose 50000		; >50,000 means blab about it

 ;; mouse-sel
 transient-mark-mode t
 highlight-nonselected-windows t	; they recommend nil. why?

 ;; emacs server
 server-use-tcp t
 server-host (getenv "GNU_HOST")
 server-log t

 ;; hmmm...
 case-fold-search t

 ;; for fit frame
 fit-frame-min-width 80
 fit-frame-min-height 48

 ;; make new-info or clone-info pop up in a new frame
 same-window-regexps
 '(
   "\\*rsh-[^-]*\\*\\(\\|<[0-9]*>\\)"
   "\\*telnet-.*\\*\\(\\|<[0-9]+>\\)"
   "^\\*rlogin-.*\\*\\(\\|<[0-9]+>\\)"
   "\\*gud-.*\\*\\(\\|<[0-9]+>\\)"
   "\\`\\*Customiz.*\\*\\'"
   )

 ;; mouse selects emacs window like an X window
 mouse-autoselect-window t

 ;; unlimited size
 message-log-max t

 ;; bring it!
 cperl-hairy t

 hippie-expand-try-functions-list (append '(yas-hippie-try-expand) hippie-expand-try-functions-list)

 ;; not sure why yet
 enable-recursive-minibuffers t

 ;; tab bar
 tab-bar-separator "   "		; easier to see them

 ;; source code indexer for lsp-mode & friends
 ccls-executable "/bin/ccls"

 read-process-output-max (* 1024 1024)	; for LSP

 custom-file "~/.emacs.d/custom.el"

)



;;; aliases

(defalias 'perl-mode 'cperl-mode)



;;; functions

;; three psuedo-functions:  makes the function pointer of a symbol
;; contain a string to be executed rather than the address of code).
;; this is how keyboard command macros are implemented.  can't
;; be called by hand, but can be invoked from the command loop.
(fset 'up-one-line "\^[1\^v")
(fset 'down-one-line "\^[1\^[v")
(fset 'c-down-conditional "\^[-1\C-f8")

;; don't like to type "yes" all the time.  pre-emacs 19, this
;; didn't work for primitives implemented in C, but now they
;; do it right (just for this function!).
(fset 'yes-or-no-p (symbol-function 'y-or-n-p))
; (defalias 'yes-or-n-p 'y-or-n-p)?

;; just a wrapper...
(defun goto-top-or-bottom (arg)
"Front end for move-to-window-line with a predetermined
arg of 0 (so it goes to the top of the window)	.	Uses -1
as arg when it detects any arg, so with anything it goes
to the bottom of the window			.	"
   (interactive "P")
   (move-to-window-line
    (cond ((null arg) 0)
	  (t -1))))

(defun my-scroll-left-one-column ()
  "Front end for scroll-left which passes 1 as its arg."
  (interactive)
  (scroll-left 1))

(defun my-scroll-right-one-column ()
  "Front end for scroll-right which passes 1 as its arg."
  (interactive)
  (scroll-right 1))

;; scrolls the other window up a screenful
(defun scroll-other-window-up (n)
  "Scrolls other window up a screenful."
  (interactive "P")
  (let ((current-w (selected-window)))
    (other-window 1)
    (scroll-down n)
    (select-window current-w)))

;; stuff from the old days
(defun backward-uppercase-word (n)  "uppercase previous word"
  (interactive "p")
  (upcase-word (- 0 n)))

(defun backward-lowercase-word (n)  "lowercase previous word"
  (interactive "p")
  (downcase-word (- 0 n)))

(defun backward-capitalize-word (n)  "capitalize previous word"
   (interactive "p")
   (capitalize-word (- 0 n)))

(defun down-comment-lines (n)  "Comment next lines"
  (interactive "*p")
  (if (< n 0)
      (up-comment-lines (- 0 n))
    (while (>= (setq n (1- n)) 0)
      (progn
	(kill-empty-comment)
	(next-line 1)
	(indent-for-comment)))))

(defun up-comment-lines (n)  "Comment Previous lines"
  (interactive "*p")
  (if (< n 0)
      (down-comment-lines (- 0 n))
    (while (>= (setq n (1- n)) 0)
      (progn
	(kill-empty-comment)
	(previous-line 1)
	(indent-for-comment)))))

(defun kill-empty-comment () "If a comment is empty, delete it"
  (interactive)
  (save-excursion
    (let ((eolpos (save-excursion (next-line 1) (beginning-of-line) (point)))
	  (x nil)
	  (ce comment-end))
      (if (equal ce "") (setq ce "\n"))
      (save-excursion
	(beginning-of-line nil)
	(setq x (re-search-forward
		 (concat "\\(" comment-start-skip "\\)" (quotedstring ce)) eolpos 'move)))
      (if x (kill-comment 1)))))

(defun quotedstring (string)
  "quote a string so that it does not interfere with a regexp"
  (interactive "k")
  (let ((len (- (length string) 1)) (ret "") (i 0))
    (while (<= i len)
      (let ((c (aref string i)))
    (cond ((equal c ?$) (setq ret (concat ret "\\")))
	  ((equal c ?^) (setq ret (concat ret "\\")))
;; why?
;;	  ((equal c ?.) (setq ret (concat ret "\\")))
	  ((equal c ?*) (setq ret (concat ret "\\")))
	  ((equal c ?\[) (setq ret (concat ret "\\")))
	  ((equal c ?\]) (setq ret (concat ret "\\")))
	  ((equal c ?\\) (setq ret (concat ret "\\"))))
    (setq ret (concat ret (char-to-string c))))
      (setq i (+ i 1)))
    ret))

(defun trim ()
  "strip trailing blanks and tabs from a buffer, and then tabify "
  (interactive "*")            ; barf if buffer is read only
  (save-excursion            ; remember where we are and	.	..
    (goto-char (point-min))
    (replace-regexp "\\s +$" "" nil))
    (tabify (point-min) (point-max)))    ; strip trailing white space

(defun transpose-windows (n) "switch this window with another one"
  (interactive "p")
  (let ((f1 (buffer-name)) (f2 0))
    (other-window n)
    (setq f2 (buffer-name))
    (switch-to-buffer f1)
    (other-window (- 0 n))
    (switch-to-buffer f2)
    (other-window n)))

;; must be lazily loaded.  force it now so the following fix overrides the native binding.
(require 'tab-line)
;https://andreyorst.gitlab.io/posts/2020-05-07-making-emacs-tabs-work-like-in-atom/
(defun tab-line-close-tab (&optional e)
  "Close the selected tab.
If tab is presented in another window, close the tab by using `bury-buffer` function.
If tab is uniq to all existing windows, kill the buffer with `kill-buffer` function.
Lastly, if no tabs left in the window, it is deleted with `delete-window` function."
  (interactive "e")
  (let* ((posnp (event-start e))
         (window (posn-window posnp))
         (buffer (get-pos-property 1 'tab (car (posn-string posnp)))))
    (with-selected-window window
      (let ((tab-list (tab-line-tabs-window-buffers))
            (buffer-list (flatten-list
                          (seq-reduce (lambda (list window)
                                        (select-window window t)
                                        (cons (tab-line-tabs-window-buffers) list))
                                      (window-list) nil))))
        (select-window window)
        (if (> (seq-count (lambda (b) (eq b buffer)) buffer-list) 1)
            (progn
              (if (eq buffer (current-buffer))
                  (bury-buffer)
                (set-window-prev-buffers window (assq-delete-all buffer (window-prev-buffers)))
                (set-window-next-buffers window (delq buffer (window-next-buffers))))
              (unless (cdr tab-list)
                (ignore-errors (delete-window window))))
          (and (kill-buffer buffer)
               (unless (cdr tab-list)
                 (ignore-errors (delete-window window)))))))
    (force-mode-line-update)))

(defun tab-bar-move-tab-left ()
  "Front end for scroll-left which passes 1 as its arg."
  (interactive)
  (tab-bar-move-tab -1))



;;; use-package invocations

(setq use-package-verbose t)

(use-package ialign
  :config
  (setq ialign-initial-regexp "(\s+)"
        ialign-initial-repeat t
	ialign-pcre-mode t))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package hl-todo
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#FF0000")
          ("todo"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("fixme"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("why"    . "#FF4500")
          ("STUB"   . "#1E90FF")))
  (define-key hl-todo-mode-map (kbd "C-c H p") 'hl-todo-previous)
  (define-key hl-todo-mode-map (kbd "C-c H n") 'hl-todo-next)
  (define-key hl-todo-mode-map (kbd "C-c H o") 'hl-todo-occur)
  (define-key hl-todo-mode-map (kbd "C-c H i") 'hl-todo-insert)
  (add-hook 'prog-mode-hook 'hl-todo-mode))

(use-package importmagic
    :ensure t
    :config
    (add-hook 'python-mode-hook 'importmagic-mode))

(use-package git-grep
    :commands (git-grep git-grep-repo)
    :bind (("C-c g g" . git-grep)
           ("C-c g r" . git-grep-repo)))



;;; lsp

; TODO - figure this out
;(setq lsp-keymap-prefix (kbd "s-q"))
;(global-set-key (kbd "s-q") lsp-command-map)

;; lsp mode for scala w/metals

;; Enable defer and ensure by default for use-package
;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Enable scala-mode for highlighting, indentation and motion commands
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false")))

;; we turn it only for prog modes
;; Enable nice rendering of diagnostics like compile errors.;
(use-package flycheck)
;  :init (global-flycheck-mode))

(setq lsp-keymap-prefix "s-s")

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook  (scala-mode . lsp)
         (lsp-mode . lsp-lens-mode)
         (lsp-mode . lsp-enable-which-key-integration)
  :config (setq lsp-prefer-flymake nil))

;; Add metals backend for scala lsp-mode
(use-package lsp-metals)

;; Enable nice rendering of documentation on hover
(use-package lsp-ui :commands lsp-ui-mode)
;(use-package lsp-treemacs)

;; we turn it on only for prog modes
;;(use-package yasnippet)

;; Add company-lsp backend for metals
;(use-package company-lsp)

;; Posframe is a pop-up tool that must be manually installed for dap-mode
(use-package posframe)

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

;; Use the Tree View Protocol for viewing the project structure and triggering compilation
;(use-package lsp-treemacs
; :config
; (lsp-metals-treeview-mode)
; (setq lsp-metals-treeview-show-when-views-received t))

;; for lsp-java
(use-package projectile)
(use-package flycheck)
(eval-after-load 'flycheck
  '(flycheck-package-setup))
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package hydra)
(use-package company)
(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil);
(use-package lsp-treemacs)

;; for lsp-python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp))))

(use-package python
  :delight "π "
  :bind (("M-[" . python-nav-backward-block)
         ("M-]" . python-nav-forward-block))
  :preface
  (defun python-remove-unused-imports()
    "Removes unused imports and unused variables with autoflake."
    (interactive)
    (if (executable-find "autoflake")
        (progn
          (shell-command (format "autoflake --remove-all-unused-imports -i %s"
                                 (shell-quote-argument (buffer-file-name))))
          (revert-buffer t t t))
      (warn "python-mode: Cannot find autoflake executable."))))



;;; hooks

(add-hook 'lisp-mode-hook
	  (lambda ()
	    (setq comment-start "; ")))	; is this needed??  the space, that is.

;; need this for yas-minor-mode to work
(require 'yasnippet)
(yas-reload-all)

;; for any programming mode, use hippie-expand for expansions
(add-hook 'prog-mode-hook
	  (lambda ()
	    (yas-minor-mode)		; expansions of templates from single keyword
	    (subword-mode)		; backward-delete-word stops on Caps or dashes or underbars
	    (flycheck-mode)		; syntax checking
	    (hlinum-activate)		; highlight current line number
	    (electric-indent-mode)	; automatic re-indenting
	    (indent-guide-mode)		; show some kind of indentation helper?
	    (setq comment-column 40)
	    (local-set-key [tab] 'hippie-expand))) ; not sure if this is best with lsp mode?

(add-hook 'java-mode-hook #'lsp)

;; the magic needed to persist the *Packages* buffer using emacs desktop

; this restores the buffer contents via a fresh 'list-packages' call
(defun package-menu-restore-desktop-buffer (file-name buffer-name misc-data)
  "Restore a *Packages* buffer specified in a desktop file by freshly loading it."
  (list-packages)
  (current-buffer))

; this connects the handler to desktop-restore
(add-to-list 'desktop-buffer-mode-handlers ; tells how to restore *Packages* from major mode ID
	     '(package-menu-mode . package-menu-restore-desktop-buffer))

; this tells desktop to save the packages frame info, etc so it can restore it later.
(add-hook 'package-menu-mode-hook
	  (lambda () (setq desktop-save-buffer t))) ; buffer local to trigger saving



;;; runtime customization

(server-start)				; no need for vi
(icomplete-mode)			; show the alternatives as you type (good way to learn)
(if (display-mouse-p)
    (mouse-avoidance-mode 'exile))      ; move mouse when typing near it
(read-abbrev-file nil t)	        ; suck in ~/.abbrev_defs quietly
(cperl-set-style "GNU")		        ; doesn't work in perl-mode-hook?
(show-paren-mode)			; finally some help
(global-font-lock-mode)			; pretty colors
(global-hi-lock-mode)			; who knows?
(global-page-break-lines-mode)		; turns ^L into big lines
(which-function-mode)			; some people write big functions
(size-indication-mode)			; put file size in modeline
(auto-compression-mode)			; handle *.gz and *.Z
(savehist-mode)				; persist minibuffer history
(winner-mode)		                ; winner-undo pops down help & friends sanely
(msb-mode)				; better mouse buffer menu
(dynamic-completion-mode)		; [new]
(prettify-symbols-mode)
(pcre-mode)			        ; all perl regexps, all the time!
(elpy-enable)				; snazzy python support, just in case
(beacon-mode)				; cursor gets some attention as you scroll the buffer
(global-display-line-numbers-mode)	; hmm... why did i only add this recently?
(global-undo-tree-mode)			; try this
;(key-chord-mode)			; allow binding to chords until it screws up something :-)
;(lsp-treemacs-sync-mode)		; bi-directional sync between treemacs & lsp
(desktop-save-mode)			; persist *everything*!  so wonderful!

(load custom-file 'noerror)		; separate custom file

(switch-to-buffer "*scratch*")		; pretend to be a "bare" emacs
(lisp-interaction-mode)
(message "")		                ; only way to really clear out echo area.



;; Local Variables:
;; comment-column: 40
;; comment-start: "; "
;; End:

