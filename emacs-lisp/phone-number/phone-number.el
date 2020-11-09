;;; phone-number.el --- phone-number Exercise (exercism)

;;; Commentary:

;;; Code:


(provide 'phone-number)

(defun numbers (str)
  "Clean a phone number"
  (let ((n (replace-regexp-in-string "[^0-9]" "" str)))
    (cond ((eq 10 (length n)) n)
          ((and (eq 11 (length n)) (string-equal "1" (substring n 0 1))) (substring n 1 nil))
          (t "0000000000"))))

(defun area-code (number)
  "get area from a phone-number"
  (substring (numbers number) 0 3))

(defun pprint (number)
  "pretty print for phone-number"
  (let ((number (numbers number)))
    (concat "(" (substring number 0 3) ") " (substring number 3 6) "-" (substring number 6 10))))

;;; phone-number.el ends here
