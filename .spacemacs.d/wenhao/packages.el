;;; packages.el --- wenhao layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: wenhaossd <wenhaossd@localhost.localdomain>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `wenhao-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `wenhao/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `wenhao/pre-init-PACKAGE' and/or
;;   `wenhao/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst wenhao-packages
  '(youdao-dictionary
    company
    ycmd
    ;; python
    nxml
    ;; anaconda-mode
    )
  "The list of Lisp packages required by the wenhao layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun wenhao/init-youdao-dictionary ()
  (use-package youdao-dictionary
    :defer t
    :init
    (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
    )
  )

(defun wenhao/post-init-company ()
  (progn
    (setq company-minimum-prefix-length 1
          company-idle-delay 0.08)
    ))

(setq helm-ag-base-command "c:\\Users\\Administrator\\AppData\\Roaming\\ag --vimgrep")
(add-to-list 'exec-path "C:\\Program Files\\Git\\bin\\")
(setq ispell-dictionary "american")
(add-hook 'after-init-hook'global-company-mode)
(add-to-list 'exec-path "C:\\Program Files (x86)\\Aspell\\bin\\")
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "C:/path/to/your/.ispell")
(require 'ispell)
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-<f8>") 'flyspell-mode)

;;; packages.el ends here
