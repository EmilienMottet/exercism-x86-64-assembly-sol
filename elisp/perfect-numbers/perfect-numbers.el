;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun divisor-list (n)
  (seq-filter (lambda (i) (zerop (mod n i)))
              (number-sequence 1 (/ n 2))))

(defun perfect-number? (n)
  (= (apply #'+ (divisor-list n)) n))

(defun perfect-numbers (n)
  (seq-filter #'perfect-number? (number-sequence 1 n)))


(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
