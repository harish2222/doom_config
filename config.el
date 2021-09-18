;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Harish Kalva"
      user-mail-address "harishkalva4126@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "CaskaydiaCove NF" :size 12 :weight 'semi-light)
       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-machine)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  (python-shell-interpreter "python3")
  (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

(use-package! pyvenv
  :after python-mode
  :config
  (pyvenv-mode 1))
       (use-package! lsp-pyright
         :ensure t
         :hook (python-mode . (lambda ()
                                (require 'lsp-pyright)
                                (lsp))))  ; or lsp-deferred

;;(defun efs/org-font-setup ()
  ;;;; Replace list hyphen with dot
  ;;(font-lock-add-keywords 'org-mode
                          ;;'(("^ *\\([-]\\) "
                             ;;(0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;;
  ;;;; Set faces for heading levels
 ;;(dolist (face '((org-level-1 . 1.2)
                  ;;(org-level-2 . 1.1)
                  ;;(org-level-3 . 1.05)
                  ;;(org-level-4 . 1.0)
                  ;;(org-level-5 . 1.1)
                  ;;(org-level-6 . 1.1)
                  ;;(org-level-7 . 1.1)
                  ;;(org-level-8 . 1.1)))))
;;;; Set faces for heading levels

(use-package! org
  :pin org
  :commands (org-capture org-agenda)
  :config
  (setq org-ellipsis " ")

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files
        '("~/Org/Agenda/Agenda.org"
          "~/Org/Agenda/Schedule.org"
          "~/Org/Agenda/Journal.org"
          "~/Org/Agenda/TimeTable.org")))

(use-package! org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("" "◉" "" "" "●" "○" "")))

;;(with-eval-after-load 'org
  ;;(org-babel-do-load-languages
      ;;'org-babel-load-languages
      ;;'((emacs-lisp . t)
      ;;(python . t)))
;;
  ;;(push '("conf-unix" . conf-unix) org-src-lang-modes))
