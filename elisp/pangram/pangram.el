;;; pangram.el --- Pangram (exercism)

;;; Commentary:

;;; Code:

(setq alphabet '("a" "z" "e" "r" "t" "y" "u" "i" "o" "p" "q" "s" "d" "f" "g" "h" "j" "k" "l" "m" "w" "x" "c" "v" "b" "n"))

(defun is-in-word (word letter)
  (string-match-p letter word))

(defun is-pangram (word)
  (cl-every (apply-partially 'is-in-word (downcase word)) alphabet))

(provide 'pangram)
;;; pangram.el ends here
