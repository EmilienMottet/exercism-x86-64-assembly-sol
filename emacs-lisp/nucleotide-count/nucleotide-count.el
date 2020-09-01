;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)

;;; Commentary:

;;; Code:

(setq nucleotides '(?A ?C ?G ?T))

(defun nucleotide-count (args)
  (if (not (seq-difference args nucleotides))
      (mapcar (lambda (nucleotide)
                (cons nucleotide
                      (seq-count (lambda (n)
                                   (eq n
                                       nucleotide))
                                 args)))
              nucleotides)
    (error "invalid nucleotide found")))

(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
