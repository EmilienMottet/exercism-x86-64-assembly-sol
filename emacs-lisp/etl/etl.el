;;; etl.el --- etl Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'seq)
(require 'subr-x)

(defun etl (h_t)
  (seq-reduce
    (lambda (table key)
      (if (> key 0)
          (seq-do
           (lambda (value)
             (if (stringp value)
                 (puthash (downcase value) key table)
               (error "value must be string")))
           (gethash key h_t))
          (error "key must be > 0"))
      table)
    (hash-table-keys h_t)
    (make-hash-table :test 'equal)))

(provide 'etl)
;;; etl.el ends here
