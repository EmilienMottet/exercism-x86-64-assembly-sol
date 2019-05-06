;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:
(require 'subr-x)

(defun is_question (sentence )
  (equal "?" (substring (string-trim sentence) -1 nil))
  )

(defun is_yeld (sentence )
  (and (equal (upcase sentence) sentence) (not (equal (downcase sentence) sentence)))
  )

(defun response-for( sentence )
  (cond
   ((equal "" (string-trim sentence)) "Fine. Be that way!")
   ((and (is_yeld sentence) (is_question sentence) ) "Calm down, I know what I'm doing!")
   ((is_yeld sentence) "Whoa, chill out!")
   ((is_question sentence) "Sure.")
   (t "Whatever."))
  )


(provide 'bob)
;;; bob.el ends here
