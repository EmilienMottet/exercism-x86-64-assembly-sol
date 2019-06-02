;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun sqr (num)
  (expt num 2))

(defun square-of-sum (num)
  (sqr (apply '+ (number-sequence 1 num))))

(defun sum-of-squares (num)
  (apply '+ (seq-map 'sqr (number-sequence 1 num))))

(defun difference (num)
  (- (square-of-sum num) (sum-of-squares num)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
