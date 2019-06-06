;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:


(require 'seq)

(defun to-decimal (binary)
  (apply '+ (seq-map-indexed (lambda (val index) (* (lsh 1 index) (if (eq val 49) 1 0))) (reverse binary))))

(provide 'binary)
;;; binary.el ends here
