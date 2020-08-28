;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun anagramp (word_a word_b)
  (let ((d_word_a (downcase word_a)) (d_word_b (downcase word_b)))
    (and (not (string= d_word_a d_word_b))
       (string= (cl-sort d_word_a #'<) (cl-sort d_word_b #'<)))))

(defun anagrams-for (word word_list)
  (cl-remove-if-not (apply-partially #'anagramp word) word_list))



(provide 'anagram)
;;; anagram.el ends here
