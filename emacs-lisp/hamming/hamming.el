;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun hamming-distance (a b)
  (if (not (equal (string-width a) (string-width b)) ) (error nil)
    (seq-count (lambda (elt) (eq elt nil)) (cl-mapcar 'eq a b) )
    )
  )

(provide 'hamming)
;;; hamming.el ends here
