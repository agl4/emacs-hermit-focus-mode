(require 'olivetti)
(require 'hide-mode-line)
(require 'default-text-scale)

(defun focus ()
  "Distraction-free writing environment"
  (interactive)
  (if (equal olivetti-mode nil)
      (progn
        (window-configuration-to-register 1)
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

(provide 'focus)
