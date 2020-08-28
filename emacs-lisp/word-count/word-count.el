;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun word-count (sentence)
  (seq-map
   (lambda (elt)
     (cons (car elt) (length (cdr elt))))
   (seq-group-by #'identity
                 (sort
                  (split-string (downcase sentence)
                                "[^a-z0-9A-Z]" t)
                  #'string<))))

(provide 'word-count)
;;; word-count.el ends here
