;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:


(defun two-fer (&optional u )
  (if (not u) ( setq u "you"))
  (format "One for %s, one for me." u))


(provide 'two-fer)
;;; two-fer.el ends here
