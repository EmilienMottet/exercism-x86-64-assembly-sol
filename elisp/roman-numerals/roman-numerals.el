;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-roman-1 (number)
  (cond
   ((zerop number) "")
   ((< number 4) (make-string number ?I))
   ((= number 4) "IV")
   ((< number 9) (concat "V" (make-string (- number 5) ?I)))
   ((= number 9) "IX")))

(defun to-roman-10 (number)
  (cond
   ((zerop number) "")
   ((< number 4) (make-string number ?X))
   ((= number 4) "XL")
   ((< number 9) (concat "L" (make-string (- number 5) ?X)))
   ((= number 9) "XC")))

(defun to-roman-100 (number)
  (cond
   ((zerop number) "")
   ((< number 4) (make-string number ?C))
   ((= number 4) "CD")
   ((< number 9) (concat "D" (make-string (- number 5) ?C)))
   ((= number 9) "CM")))

(defun to-roman-1000 (number)
  (cond
   ((zerop number) "")
   (t (make-string number ?M))))


(defun to-roman (number)
  (concat (to-roman-1000 (/ (mod number 10000) 1000)) (to-roman-100 (/ (mod number 1000) 100)) (to-roman-10 (/ (mod number 100) 10)) (to-roman-1 (mod number 10))))


(provide 'roman-numerals)
;;; roman-numerals.el ends here
