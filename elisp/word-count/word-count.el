;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:

(defun word-count (sentence)
  (seq-map (lambda (list) '((2 . 1))
             (seq-group-by #'string sentence))))
  

(provide 'word-count)
;;; word-count.el ends here
