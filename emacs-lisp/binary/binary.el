;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:


(require 'seq)

(defun to-decimal (binary)
  (apply '+
         (seq-map-indexed
          (lambda (val index)
            (if (eq val ?1) (lsh 1 index) 0))
          (reverse binary))))

(provide 'binary)
;;; binary.el ends here
