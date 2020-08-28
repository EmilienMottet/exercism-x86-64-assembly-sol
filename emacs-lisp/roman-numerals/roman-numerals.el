;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-roman-base (number unit five decade)
  (cond
   ((zerop number) "")
   ((< number 4) (make-string number unit))
   ((= number 4) (string unit five))
   ((< number 9) (concat (string five) (make-string (- number 5) unit)))
   ((= number 9) (string unit decade))))

(defun to-roman-1000 (number)
  (cond
   ((zerop number) "")
   (t (make-string number ?M))))


(defun to-roman (number)
  (concat
   (to-roman-1000 (/ (mod number 10000) 1000))
   (to-roman-base (/ (mod number 1000) 100) ?C ?D ?M)
   (to-roman-base (/ (mod number 100) 10) ?X ?L ?C)
   (to-roman-base (mod number 10 ) ?I ?V ?X)))


(provide 'roman-numerals)
;;; roman-numerals.el ends here
