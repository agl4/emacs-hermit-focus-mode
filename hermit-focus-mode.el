;;; hermit-focus-mode.el --- Toggle to focused writing environment -*- coding: utf-8; lexical-binding: t -*-

;; x-release-please-start-version

;; Author: Attila GOLONCSER <agl@glnc.hu>
;; Maintainer: Attila GOLONCSER <agl@glnc.hu>
;; Version: 0.0.1
;; Package-Requires: ((emacs "27.1"))
;; Created: 2025
;; Homepage: https://github.com/agl4/emacs-hermit-focus-mode.git
;; Keywords: local

;;; Commentary:
;;
;; This minor mode builds on Olivetti's focused writing environment.  It closes
;; other windows, enlarges the buffer text, and hides modelines to create a
;; minimal, distraction-free writing workspace.
;;
;; Rather than introducing new functionality, this package composes existing
;; modules to provide a more compact writing environment.
;;
;; To further adjust layout and appearance, use the `olivetti' keybindings.  To
;; change text size, use the `text-scale-increase' and `text-scale-decrease'
;; commands.
;;
;; Heavily based on this article: https://lucidmanager.org/productivity/ricing-org-mode/

;;; Code:

;; x-release-please-end

(require 'olivetti)
(require 'hide-mode-line)

(define-minor-mode hermit-focus-mode
  "Toggle to a focused writing environment."
  :lighter "Focus"
  (if hermit-focus-mode
      (progn
        (window-configuration-to-register
         1)
        (delete-other-windows)
        (text-scale-increase 2)
        (hide-mode-line-mode 1)
        ;; (when (eq major-mode 'org-mode) (org-narrow-to-subtree))
        (olivetti-mode t))
    (progn
      (jump-to-register 1)
      ;; (when (eq major-mode 'org-mode) (widen))
      (olivetti-mode 0)
      (hide-mode-line-mode 0)
      (text-scale-decrease 2))))

(provide 'hermit-focus-mode)
;;; hermit-focus-mode.el ends here
