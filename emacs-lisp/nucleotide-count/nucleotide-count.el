;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)

;;; Commentary:

;;; Code:

(defun nucleotide-count (nucleotide)
  (seq-map (lambda (x) (string-to-char x)) '(?A ?C ?G ?T)))

(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
