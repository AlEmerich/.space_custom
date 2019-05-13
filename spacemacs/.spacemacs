;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (message "Layer initialisation")
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(systemd
     lua
     imenu-list
     csv
     yaml
     html
     ;;w3m ;; Needs to be downloaded from venmos github
     (python :variables
             python-test-runner '(pytest-nose)
             python-enable-yapf-format-on-save t
             python-sort-imports-on-save t)
     javascript
     floobits
     helm
     csharp
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory nil)
     syntax-checking
     (java :variables java-backend 'lsp)
     lsp
     dap
     ;; (lsp :variables
     ;;      lsp-groovy-server-install-dir "/home/alan/tools/language-servers/groovy-language-server/build/libs/")
     ipython-notebook
     ;; better-defaults
     emacs-lisp
     git
     debug
     ;; shaders
     imenu-list
     latex
     markdown
     docker
     neotree
     (org :variables
          org-confirm-babel-evaluate nil)
     (shell :variables
            shell-default-shell "/bin/zsh"
            shell-default-height 30
            shell-default-term-shell "/bin/zsh"
            shell-default-position 'bottom)
     ;; spell-checking
     ;; version-control
     (mu4e :variables
           mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu4e")
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-confg'.
   dotspacemacs-additional-packages '(
                                      (jedi :location elpa)
                                      (org-plus-contrib)
                                      (pretty-mode))

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (message "Initialization")
  (setq-default
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(all-the-icons)

   ;; iffeR non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner "../rick_morty.png"
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.5
                               )
   ;; the leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
  
  (add-to-list 'configuration-layer-elpa-archives '("melpa-stable" . "stable.melpa.org/packages/"))
  (add-to-list 'package-pinned-packages '(spaceline . "melpa-stable"))
  (add-to-list 'package-pinned-packages '(spaceline-all-the-icons . "melpa-stable"))
  (add-to-list 'package-pinned-packages '(spaceline-ml-all-the-icons . "melpa-stable"))
  (add-to-list 'package-pinned-packages '(all-the-icons . "melpa-stable"))

  (spacemacs/set-default-font dotspacemacs-default-font)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (message "User config")

  ;; FIXME: workaround
  ;; https://github.com/syl20bnr/spacemacs/issues/11798
  (when (version<= "9.2" (org-version))
    (require 'org-tempo))
  (setq create-lockfiles nil)

  (defun add-pcomplete-to-capf ()
    (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

  (add-hook 'org-mode-hook #'add-pcomplete-to-capf)

  (with-eval-after-load 'python
    (defun python-shell-completion-native-try ()
      "Return non-nil if can trigger native completion."
      (let ((python-shell-completion-native-enable t)
            (python-shell-completion-native-output-timeout
             python-shell-completion-native-try-output-timeout))
        (python-shell-completion-native-get-completions
         (get-buffer-process (current-buffer))
         nil "_"))))

  (require 'lsp)
  (add-hook 'groovy-mode-hook 'lsp)
  (add-hook 'java-mode-hook 'lsp)
  (add-hook 'python-mode-hook 'lsp)
   
  (require 'lsp-ui)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'lsp-ui-mode 'flycheck-mode)

  ;;=========================================================
  ;;====================== PRETTY MODE ======================
  ;;=========================================================
  (require 'pretty-mode)

  (defun pretty-greek ()
    (let ((greek '("alpha" "beta" "gamma" "delta" "epsilon" "zeta" "eta" "theta" "iota" "kappa" "lambda" "mu" "nu" "xi" "omicron" "pi" "rho" "sigma_final" "sigma" "tau" "upsilon" "phi" "chi" "psi" "omega")))
      (loop
       for word in greek
       for code = 97 then (+ 1 code)
       do
       (let ((greek-char (make-char 'greek-iso8859-7 code)))
         (font-lock-add-keywords
          nil
          `((,(concatenate 'string "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[a-zA-Z]")
             (0 (progn (decompose-region (match-beginning 2) (match-end 2))
                       nil)))))
         (font-lock-add-keywords
          nil
          `((,(concatenate 'string "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[^a-zA-Z]")
             (0 (progn (compose-region
                        (match-beginning 2) (match-end 2)
                        ,greek-char)
                       nil
                       )))))))))

  (add-hook 'python-mode-hook 'pretty-greek)
  
  ;; if you want to set it only for a specific mode
  ;; (add-hook 'my-pretty-language-hook 'turn-on-pretty-mode)
  ;; (setq omnisharp--curl-executable-path "/usr/bin/curl")
  ;; (setq-default omnisharp-server-executable-path "/Users/alan/omnisharp-server/OmniSharp/bin/Debug/omnisharp")
  ;; (setq org-startup-with-inline-images t)
  (require 'helm-bookmark)
  (delete-selection-mode 1)
  (cua-mode 1)

  (defun copy-line (arg)
    "Copy lines (as many as prefix argument) in the kill ring"
    (interactive "p")
    (kill-ring-save (line-beginning-position)
                    (line-beginning-position (+ 1 arg)))
    (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

  (global-set-key (kbd "M-<up>") 'move-text-up)
  (global-set-key (kbd "M-<down>") 'move-text-down)
  (global-set-key (kbd "\C-d") 'copy-line)
  (global-set-key (kbd "\C-c d") 'avy-copy-line)
  (global-set-key (kbd "\C-c r") 'avy-copy-region)

  (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
  (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (global-set-key (kbd "S-C-<down>") 'shrink-window)
  (global-set-key (kbd "S-C-<up>") 'enlarge-window)

  ;; DOT MODE
  ;; (require 'dot-mode)

  ;; (add-hook 'find-file-hooks 'dot-mode-on)
  ;; (dot-mode-on)
  ;; (global-set-key (kbd "C-.") 'dot-mode-execute)

  (global-company-mode 1)

  (require 'ox-taskjuggler)

  ;;=========================================================
  ;;====================== MAIL =============================
  ;;=========================================================

  ;; MU4E
  (require 'mu4e)

  ;; emacs allows you to select an e-mail program as the default program it uses when you press C-x m (compose-mail), call report-emacs-bug and so on.
  ;; If you want to use mu4e for this, you do so by adding the following to your configuration:
  (setq mail-user-agent 'mu4e-user-agent)

  ;; don't keep message buffers around
  (setq message-kill-buffer-on-exit t)

  ;; no need to confirm
  (setq mu4e-confirm-quit nil)

  ;; display is definitely nicer with these
  (setq mu4e-use-fancy-chars t)

  ;; open mail links in new frame
  ;;(defun mu4e-link-in-new-frame (MSGID) (select-frame (make-frame)))
  ;;(advice-add 'mu4e-view-message-with-message-id :before 'mu4e-link-in-new-frame)

  ;; single window mode (not useful to me, I like to have the split windows)
  ;;(setq mu4e-split-view 'single-window) 

  ;;mu4e buffers have a leading space...
  ;;" *mu4e-main"

  ;;------------------ servers

  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))
  
  ;; get mail
  (setq mu4e-get-mail-command "/usr/bin/mbsync -a -c ~/.emacs.d/.mbsyncrc" ;; -c ~/.mbsyncrc gmail" ;;use U in main view to update
        ;; mu4e-html2text-command "html2text -utf8 -width 72" ;;seems to be doing a better job than w3m
        ;; w3m-command "/usr/bin/w3m"
        ;; mu4e-html2text-command "w3m -dump -T text/html"
        ;; mu4e-html2text-command "w3m -dump -T text/html -cols 72 -o display_link_number=true -o auto_image=false -o display_image=false -o ignore_null_img_alt=true"
        mu4e-update-interval 60 ;;every minute
        mu4e-headers-auto-update t
        mu4e-view-prefer-html t
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        )

  ;; don't keep message buffers around
  (setq message-kill-buffer-on-exit t)

  ;; You can then get your e-mail using M-x mu4e-update-mail-and-index, or C-S-u in all mu4e-views;
  ;; alternatively, you can use C-c C-u, which may be more convenient if you use emacs in a terminal.
  ;;You can kill the (foreground) update process with q.

  ;; faster indexing, if that becomes a problem
                                        ;(setq
                                        ;  mu4e-index-cleanup nil      ;; don't do a full cleanup check
                                        ;  mu4e-index-lazy-check t)    ;; don't consider up-to-date dirs

  ;;------------------ folders, search

  ;; defaults
  (setq mu4e-maildir (expand-file-name "~/.mail"))
  ;; better to keep .mail and make link
  ;; don't do: (setq mu4e-maildir (expand-file-name "/media/DATA/Mail"))
  ;; but do: /!!!\ ln -s "/media/DATA/Mail" .mail

  ;; don't save message to Sent Messages, IMAP takes care of this
  (setq mu4e-sent-messages-behavior 'delete)

  ;; shortcuts
  ;; you can quickly switch to your Inbox -- press ``ji''
  ;; then, when you want archive some messages, move them to
  ;; the 'All Mail' folder by pressing ``ma''.
  (setq mu4e-maildir-shortcuts
        '( ("/Inbox"                    . ?i)
           ("/sent"  . ?s)
           ("/trash"      . ?t)
           ("/drafts"     . ?d)))


  ;;rename files when moving
  ;;NEEDED FOR MBSYNC
  (setq mu4e-change-filenames-when-moving t)

  ;; unbind default bookmarks
  (makunbound 'mu4e-bookmarks)
  (defvar mu4e-bookmarks
    `( ,(make-mu4e-bookmark
         :name  "Unread @CEA"
         :query "maildir:/Inbox AND flag:unread"
         :key ?u)))
  ;; bookmarks
  (add-to-list 'mu4e-bookmarks
               (make-mu4e-bookmark
                :name  "Today @CEA"
                :query "maildir:/Inbox AND date:today..now"
                :key ?t)  )
  (add-to-list 'mu4e-bookmarks
               (make-mu4e-bookmark
                :name  "Last 7 days @CEA"
                :query "maildir:/Inbox AND date:7d..now"
                :key ?w)  )
  (add-to-list 'mu4e-bookmarks
               (make-mu4e-bookmark
                :name  "w/ attachment @CEA"
                :query "maildir:/Inbox AND flag:attach"
                :key ?a)  )
  (add-to-list 'mu4e-bookmarks
               (make-mu4e-bookmark
                :name  "Big messages @CEA"
                :query "maildir:/Inbox AND size:5M..500M"
                :key ?b)  )

  ;;------------------ addresses

  ;; something about ourselves
  (setq
   user-mail-address "alan.guitard.pro@gmail.com"
   user-full-name  "Alan Guitard"
   mu4e-compose-signature
   (concat
    "Alan Guitard\n"
    "GitHub: https://github.com/AlEmerich\n"
    "LinkedIn: https://linkedin.com/in/alanguitard"))

  ;; To determine whether a message was sent by you, mu4e uses the variable mu4e-user-mail-address-list, a list of your e-mail addresses.
  (setq mu4e-user-mail-address-list '("guitard-alan@laposte.net" "alan.guitard.pro@gmail.com"))


  ;;------------------ compose

  ;; list of contacts
  ;;in shell: mu cfind

  ;; allows reading other emails while composing
  ;; (setq mu4e-compose-in-new-frame t)

  ;; please don't ever include me when I reply...
  (setq mu4e-compose-dont-reply-to-self t)

  ;; signature
  ;; (setq message-signature-file "/signature.txt") ; put your signature in this file
  ;;mu4e-compose-signature-auto-include nil

  ;; don't save message to Sent Messages, IMAP takes care of this in gmail
  (setq mu4e-sent-messages-behavior 'delete) ;redefined in contexts

  ;; spell check
  (add-hook 'mu4e-compose-mode-hook
            (defun my-do-compose-stuff ()
              "My settings for message composition."
              (set-fill-column 72)
              (flyspell-mode)))

  ;; SMTP
  (require 'smtpmail)

  ;; configuration for sending mail
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587)

  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-debug-info t)

  ;; following, when set to t, only consider addresses that were seen in personal messages — that is, messages in which one of my e-mail addresses (mu4e-user-mail-address-list) was seen in one of the address fields. This is to exclude mailing list posts.
  ;;(setq mu4e-compose-complete-only-personal t) ;;somehow removes everything... maybe wait till full sync is done?

  ;; warn if no attachments
  (defun message-attachment-present-p ()
    "Return t if an attachment is found in the current message."
    (save-excursion
      (save-restriction
        (widen)
        (goto-char (point-min))
        (when (search-forward "<#part" nil t) t))))
  (defcustom message-attachment-intent-re
    (regexp-opt '("attach"
                  "attached"
                  "fichier joint"
                  "PDF"
                  "attachment"))
    "A regex which - if found in the message, and if there is no attachment - should launch the no-attachment warning.")
  (defcustom message-attachment-reminder
    "Are you sure you want to send this message without any attachment? "
    "The default question asked when trying to send a message containing `message-attachment-intent-re' without an actual attachment.")
  (defun message-warn-if-no-attachments ()
    "Ask the user if s?he wants to send the message even though there are no attachments."
    (when (and (save-excursion
                 (save-restriction
                   (widen)
                   (goto-char (point-min))
                   (re-search-forward message-attachment-intent-re nil t)))
               (not (message-attachment-present-p)))
      (unless (y-or-n-p message-attachment-reminder)
        (keyboard-quit))))
  ;; add hook to message-send-hook (so also works with gnus)
  (add-hook 'message-send-hook #'message-warn-if-no-attachments)

  ;; It is possible to attach files to mu4e messages (using dired in the same frame process...)
  ;; mark the file(s) in dired you would like to attach and press C-c RET C-a, and you’ll be asked whether to attach them to an existing message, or create a new one.
  (require 'gnus-dired)
  ;; make the `gnus-dired-mail-buffers' function also work on
  ;; message-mode derived modes, such as mu4e-compose-mode
  (defun gnus-dired-mail-buffers ()
    "Return a list of active message buffers."
    (let (buffers)
      (save-current-buffer
        (dolist (buffer (buffer-list t))
          (set-buffer buffer)
          (when (and (derived-mode-p 'message-mode)
                     (null message-sent-message-via))
            (push (buffer-name buffer) buffers))))
      (nreverse buffers)))
  (setq gnus-dired-mail-mode 'mu4e-user-agent)
  (add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

  ;; highlight some words
  ;; http://emacs-fu.blogspot.co.uk/2008/12/highlighting-todo-fixme-and-friends.html
  (set-face-attribute 'font-lock-warning-face nil :foreground "red" :weight 'bold :background "yellow")
  (add-hook 'mu4e-compose-mode-hook
            (defun mu4e-highlight-words ()
              "Flag attachment keywords"
              (font-lock-add-keywords nil
                                      '(("\\(urgent\\|myname\\|reply\\)" 1 font-lock-warning-face t)))))

  ;; remove automatic wrapping of lines
  (add-hook 'mu4e-compose-mode-hook 'turn-off-auto-fill)

  ;;------------------ headers

  ;; the headers to show in the headers list -- a pair of a field
  ;; and its width, with `nil' meaning 'unlimited'
  ;; (better only use that for the last field.
  ;; These are the defaults:
  (setq mu4e-headers-fields
        '( (:human-date          .  11)    ;; date, human-date
           (:flags         .   6)
           (:from          .  22) ;; from , to, from-or-to
           (:to            .  22)
                                        ;(:mailing-list . 10)
           (:thread-subject       .  nil))) ;; subject, thread-subject

  ;; date format
  (setq mu4e-headers-date-format "%d-%m-%Y")
  (setq mu4e-headers-time-format "[%H:%M]")

  ;;thread options
  (setq
   ;; thread prefix marks
   mu4e-headers-has-child-prefix '("."  . "◼ ")
   mu4e-headers-default-prefix '(" "  . "│ ")
   )

  ;; show full addresses in view message (instead of just names)
  ;; toggle per name with M-RET
  ;; (setq mu4e-view-show-addresses 't)

  ;; ---- actions

  ;; add view in browser for html messages
  (add-to-list 'mu4e-view-actions
               '("ViewInBrowser" . mu4e-action-view-in-browser) t)

  ;; search for sender
  (defun search-for-sender (msg)
    "Search for messages sent by the sender of the message at point."
    (mu4e-headers-search
     (concat "from:" (cdar (mu4e-message-field msg :from)))))
  ;; define 'x' as the shortcut
  (add-to-list 'mu4e-view-actions
               '("xsearch for sender" . search-for-sender) t)

  ;; overwrite save attachment to propose making non-existing directories first
  ;; also allows using directory as input
  (defun mu4e-view-save-attachment-single (&optional msg attnum)
    "Save attachment number ATTNUM from MSG.
If MSG is nil use the message returned by `message-at-point'.
If ATTNUM is nil ask for the attachment number."
    (interactive)
    (let* ((msg (or msg (mu4e-message-at-point)))
           (attnum (or attnum
                       (mu4e~view-get-attach-num "Attachment to save" msg)))
           (att (mu4e~view-get-attach msg attnum))
           (fname  (plist-get att :name))
           (mtype  (plist-get att :mime-type))
           (path (concat
                  (mu4e~get-attachment-dir fname mtype) "/"))
           (index (plist-get att :index))
           (retry t) (fpath))
      ;;path is attachment dir (~)
      (while retry
        (setq fpath (mu4e~view-request-attachment-path fname path))
        (setq path2 (file-name-directory fpath))
        (setq retry
              (and (not (file-exists-p path2))
                   (not (y-or-n-p (mu4e-format "Create directory '%s'?" path2))))))
      (make-directory path2 t)
      ;;if input is a directory, append fname
      (if (file-directory-p (substitute-in-file-name fpath))
          (setq fpath (concat fpath "/" fname)))
      ;;should we overwrite?
      (while retry
        (setq retry
              (and (file-exists-p fpath)
                   (not (y-or-n-p (mu4e-format "Overwrite '%s'?" fpath))))))
      (mu4e~proc-extract
       'save (mu4e-message-field msg :docid)
       index mu4e-decryption-policy fpath)))

  ;; overwrite to save all attachments with no confirmation
  (defun mu4e-view-save-attachment-multi2 (&optional msg)
    "Offer to save multiple email attachments from the current message.
Default is to save all messages, [1..n], where n is the number of
attachments.  You can type multiple values separated by space, e.g.
  1 3-6 8
will save attachments 1,3,4,5,6 and 8.
Furthermore, there is a shortcut \"a\" which so means all
attachments, but as this is the default, you may not need it."
    (interactive)
    (let* ((msg (or msg (mu4e-message-at-point)))
           (count (hash-table-count mu4e~view-attach-map))
           (attachnums (mu4e-split-ranges-to-numbers "a" count)))
      (let* ((path (concat (mu4e~get-attachment-dir) "/"))
             (attachdir (mu4e~view-request-attachments-dir path)))
        (dolist (num attachnums)
          (let* ((att (mu4e~view-get-attach msg num))
                 (fname  (plist-get att :name))
                 (index (plist-get att :index))
                 (retry t)
                 fpath)
            (while retry
              (setq fpath (expand-file-name (concat attachdir fname) path))
              (setq retry
                    (and (file-exists-p fpath)
                         (not (y-or-n-p
                               (mu4e-format "Overwrite '%s'?" fpath))))))
            (mu4e~proc-extract
             'save (mu4e-message-field msg :docid)
             index mu4e-decryption-policy fpath))))
      ))
  (define-key mu4e-view-mode-map (kbd "s") 'mu4e-view-save-attachment-multi2)

  ;; overwrite fetch URL to propose making non-existing directories first and choosing the filename
  (defun mu4e-view-fetch-url (&optional multi)
    "Offer to fetch (download) urls(s). If MULTI (prefix-argument) is nil,
download a single one, otherwise, offer to fetch a range of
URLs. The urls are fetched to `mu4e-attachment-dir'."
    (interactive "P")
    (mu4e~view-handle-urls "URL to fetch" multi
                           (lambda (url)
                             (setq retry t)
                             (while retry
                               (setq fname (file-name-nondirectory url))
                               (setq path (concat
                                           (mu4e~get-attachment-dir fname) "/"))
                               (setq fpath (mu4e~view-request-attachment-path fname path))
                               (setq path2 (file-name-directory fpath))
                               (setq retry
                                     (and (not (file-exists-p path2))
                                          (not (y-or-n-p (mu4e-format "Create directory '%s'?" path2))))))
                             (make-directory path2 t)
                             (while retry
                               (setq retry
                                     (and (file-exists-p fpath)
                                          (not (y-or-n-p (mu4e-format "Overwrite '%s'?" fpath))))))
                             (url-copy-file url fpath)
                             (mu4e-message "Fetched %s -> %s" url fpath))
                           ))

  ;; remove all attachments from email. This works also for Gmail, with the tweak that the message is moved around so as to force an update on the IMAP server
  ;; This adds a new "attachment action" in Mu4e. When viewing an email, press A, then R to select the action defined above, then enter the number of the attachment. The action will ask you for confirmation before deleting the attachment. The header listing the attachments is not updates but when you leave the email and reopen it, the attachment is gone. By default remove all attachments (still asks for att. number through...)
  ;;also check mu4e-detach
  (defun my-remove-attachment (msg num) 
    "Remove attachment."

    (let* ((x (mu4e~view-construct-attachments-header msg));; Populate attachment map
           (count (hash-table-count mu4e~view-attach-map));; Count the attachments
           (attachnums (mu4e-split-ranges-to-numbers "a" count));; A list of numbers for all attachments
           )
      (let (fnamelist '())
        ;; Save all attachments
        (dolist (num attachnums)
          (let* ((att (mu4e~view-get-attach msg num))
                 (fname (plist-get att :name)))
            (add-to-list 'fnamelist fname)))

        (let* ((path (mu4e-msg-field msg :path))
               (disc-txt (format "Removed attachments:\n- %s\n"
                                 (s-join "\n- " fnamelist)))
               (disc-txt-fpath "/tmp/disclaimer.txt")
               (cmd (format "altermime --input=%s --removeall --disclaimer='%s'" path disc-txt-fpath)))
          (with-temp-file disc-txt-fpath (insert disc-txt))
          (shell-command cmd)
          (message cmd))

        ))
    ;; move mail around so it gets updated in IMAP
    (let* ((oldmaildir (mu4e-message-field msg :maildir)))
      (mu4e~proc-move (mu4e-message-field msg :message-id) "/gmailvl/[Gmail].Drafts/")
      (mu4e~proc-move (mu4e-message-field msg :message-id) oldmaildir))
    )
  (add-to-list 'mu4e-view-attachment-actions
               '("remove-attachments" . my-remove-attachment))

  ;; add action to show the local filename of the message
  (defun my-show-filename (msg)
    (kill-new (mu4e-message-field msg :path))
    )
  (add-to-list 'mu4e-view-actions
               '("filename in kill-ring" . my-show-filename))
  (add-to-list 'mu4e-headers-actions
               '("filename in kill-ring" . my-show-filename))

  ;;------------------ trash

  ;;somehow trash flag don't seem to work for gmail, it keeps showing
  ;;in all-mail. Just move them to Trash, gmail seems to take care of the
  ;;trashed flag just fine
  (add-to-list 'mu4e-marks
               '(archive
                 :char       ("D" . "❌❌")
                 :prompt     "Delete"
                                        ;:show-target (lambda (target) "trash!")
                 :dyn-target (lambda (target msg) (mu4e-get-trash-folder msg))
                 :action      (lambda (docid msg target)
                                ;; must come before proc-move since retag runs
                                ;; 'sed' on the file
                                (mu4e~proc-move docid (mu4e~mark-check-target target)))))
  (mu4e~headers-defun-mark-for archive)
  (define-key mu4e-headers-mode-map (kbd "D") 'mu4e-headers-mark-for-archive)
  ;;also overwrite other existing marks
  (add-to-list 'mu4e-marks
               '(archive
                 :char       ("d" . "❌❌")
                 :prompt     "delete"
                                        ;:show-target (lambda (target) "trash!")
                 :dyn-target (lambda (target msg) (mu4e-get-trash-folder msg))
                 :action      (lambda (docid msg target)
                                ;; must come before proc-move since retag runs
                                ;; 'sed' on the file
                                (mu4e~proc-move docid (mu4e~mark-check-target target)))))
  (mu4e~headers-defun-mark-for archive)
  (define-key mu4e-headers-mode-map (kbd "d") 'mu4e-headers-mark-for-archive)

  ;;------------------ help

  ;;help
  (defun show-mu4e-main-help ()
    (interactive)
    (message-box "
MU4E
----
?:?
"))

  (defun show-mu4e-view-help ()
    (interactive)
    (message-box "
MU4E-view
---------

R,F,C: reply, forward, compose
a: message actions
A: attachment actions

g: visit URLs
f: fetch URLs
e: save (extract) attachment
s: save all attachments

C-cr: capture reply to
C-ct: capture todo-mail
"))

  (defun show-mu4e-headers-help ()
    (interactive)
    (message-box "
MU4E-headers
------------

P:\t threading on/off
R,F,C: reply, forward, compose
E:\t edit (drafts)

d/=:  trash/untrash
DEL,D: deletion
m:\t move
r:\t refile
u/U: unmark (all) message(s)
t,T: mark (sub)thread
Flags: +/- importance
       ?,!: unread/read
x:\t execute actions

/,M-arrows: narrow-down and navigate queries

C-cr: capture reply to
C-ct: capture todo-mail
"))

  (defun show-mu4e-compose-help ()
    (interactive)
    (message-box "
MU4E-compose
------------
C-c C-a: attach
C-c C-c: send
C-c C-k: cancel
C-x C-s: save in drafts

TAB: cycle through email addresses suggestions

C-ct: capture todo-mail
"))

  ;;shortcut

  ;;====================== ORG CAPTURE =============================
  ;;https://orgmode.org/manual/Template-elements.html#Template-elements


  ;;store org-mode links to messages
  (require 'org-mu4e)
  ;;store link to message if in header view, not to header query. When you are in Headers view, M-x org-store-link links to the query if org-mu4e-link-query-in-headers-mode is non-nil, and to the particular message otherwise (which is the default).
  (setq org-mu4e-link-query-in-headers-mode nil)

  (setq org-capture-templates
        '(("t" "Todo-mail" entry (file+headline "~/workflow.org" "Captured todo-mails")
           "\n\n* TODO %:subject %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")
          ("r" "Reply to" entry (file+headline "~/workflow.org" "Reply to")
           "\n\n* TODO Reply to %:fromname on %:subject %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")
          ("b" "Bookmark" entry (file+headline "~/bookmarks.org" "Captured")
           "\n\n* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n"))
        )
  ;; https://orgmode.org/manual/Template-expansion.html

  ;; function to capture a bookmark
  (defun org-capture-bookmark ()
    (interactive)
    "Capture a bookmark item"
    (org-capture nil "b"))

  ;; function to capture a mail todo
  (defun org-capture-todomail ()
    (interactive)
    "Capture a todo-mail item"
    (org-capture nil "t"))

  ;; function to capture a mail todo
  (defun org-capture-replymail ()
    (interactive)
    "Capture a todo-mail item"
    (org-capture nil "r"))

  ;; bind
  (define-key global-map "\C-cc" 'org-capture)
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(ns-right-alternate-modifier (quote none))
 '(org-support-shift-select (quote always))
 '(package-selected-packages
   (quote
    (systemd pretty-mode org-projectile org-category-capture org-present org-pomodoro org-download jedi jedi-core python-environment epc ctable concurrent lv htmlize gnuplot transient polymode dockerfile-mode docker tablist docker-tramp company-quickhelp company-emacs-eclim eclim mu4e-maildirs-extension mu4e-alert ht alert log4e gntp lua-mode ghub csv-mode company-auctex auctex-latexmk auctex xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help color-theme-solarized color-theme floobits zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme yaml-mode omnisharp glsl-mode shut-up csharp-mode shader-mode imenu-list flyspell-correct-helm flyspell-correct auto-dictionary web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js-doc company-tern tern coffee-mode ein skewer-mode request-deferred websocket deferred js2-mode simple-httpd smeargle orgit mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F")))))


(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(ns-right-alternate-modifier (quote none))
 '(org-agenda-files (quote ("~/Documents/timetable/alphalog.org")))
 '(org-support-shift-select (quote always))
 '(package-selected-packages
   (quote
    (realgud test-simple loc-changes load-relative mu4e-maildirs-extension mu4e-alert ht alert log4e gntp lua-mode ghub csv-mode company-auctex auctex-latexmk auctex xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help color-theme-solarized color-theme floobits zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme yaml-mode omnisharp glsl-mode shut-up csharp-mode shader-mode imenu-list flyspell-correct-helm flyspell-correct auto-dictionary web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js-doc company-tern tern coffee-mode ein skewer-mode request-deferred websocket deferred js2-mode simple-httpd smeargle orgit mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F")))))
)
