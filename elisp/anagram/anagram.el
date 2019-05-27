;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun anagram? (a b)
  (and (not (equal (downcase a) (downcase b)) ) (equal (cl-sort (downcase a ) #'<) (cl-sort (downcase b ) #'<))))

(defun anagrams-for (a b)
  (cl-remove-if-not (apply-partially #'anagram? a) b))



(provide 'anagram)
;;; anagram.el ends here
