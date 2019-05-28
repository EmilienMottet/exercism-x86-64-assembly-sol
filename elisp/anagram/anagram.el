;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun anagramp (word_a word_b)
  (and (not (string= (downcase word_a) (downcase word_b)))
       (string= (cl-sort (downcase word_a ) #'<) (cl-sort (downcase word_b ) #'<))))

(defun anagrams-for (word word_list)
  (cl-remove-if-not (apply-partially #'anagramp word) word_list))



(provide 'anagram)
;;; anagram.el ends here
