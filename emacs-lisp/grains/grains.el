;;; grains.el --- Grains exercise (exercism)

;;; Commentary:

;;; Code:



(provide 'grains)

(defun square (n)
  (ash 1 (- n 1))
  )

(defun total ()
  (seq-reduce (lambda (acc n) (+ (square n) acc) ) (number-sequence 1 64) 0)
  )
;;; grains.el ends here
