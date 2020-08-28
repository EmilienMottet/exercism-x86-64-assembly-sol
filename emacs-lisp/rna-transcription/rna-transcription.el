;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:



;;; Code:

(require 'seq)
(setq rna-converter #s(hash-table size 4
                                  test equal
                                  data (
                                        ?G ?C
                                        ?A ?U
                                        ?C ?G
                                        ?T ?A)))

(defun convert-dna-char (dna-char)
  (gethash dna-char rna-converter))

(defun to-rna (dna)
  (seq-concatenate 'string (mapcar 'convert-dna-char dna)))



(provide 'rna-transcription)
;;; rna-transcription.el ends here
