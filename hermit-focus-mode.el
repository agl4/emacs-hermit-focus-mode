;;; hermit-focus-mode.el --- Switch to focused writing environment

;;; Commentary:
;;
;; This mode improves a bit over Olivetti-s clean writing environment by closing
;; all the opened windows except the focused ones, making the text bigger and
;; also hide modelines.
;;
;; As you see this is not really a plugin but stiching together some existing
;; modules to create an even cleaner environment for writing text.
;;
;; The mode provides some defaults on how the text is showed, for further tuning
;; on how the text body looks like, see `olivetti' bindings, for the size of the
;; text see `text-scale-increase' and `text-scale-decrease' bindings.
;;
;; Credit should go to https://lucidmanager.org/productivity/ricing-org-mode/

;;; Code:

(require 'olivetti)
(require 'hide-mode-line)

(define-minor-mode hermit-focus-mode
  "Switch to a focused writing environment"
  nil
  "Focus"
  nil
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
