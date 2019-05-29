;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(defun leap-year-p (year)
  (or (zerop (mod year 400))
      (and (zerop (mod year 4)) (not (zerop (mod year 100))))))

(provide 'leap)
;;; leap.el ends here
