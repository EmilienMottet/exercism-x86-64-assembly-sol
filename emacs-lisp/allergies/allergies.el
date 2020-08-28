;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun all-allergen ()
  (seq-map-indexed (lambda (elt idx)
                     (list (lsh 1 idx) elt))
                   '("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")))

(defun allergen-list (num)
  (seq-map
   (apply-partially 'nth 1)
   (seq-filter
    (lambda (x)
      (equal (logand num (car x)) (car x)))
    (all-allergen))))

(defun allergic-to-p (num allergen)
  (seq-some (lambda (x) (equal (logand num (car x)) (car x))) (all-allergen)))

(provide 'allergies)
;;; allergies.el ends here
