;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'subr-x)
(require 'seq)


(setq rain-converter #s(hash-table size 3
                                   test equal
                                   data (
                                         3 "Pling"
                                         5 "Plang"
                                         7 "Plong"
                                         )))


(defun convert (n)
  (let ((res
         (mapconcat
          (lambda (x) (if (equal (mod n x) 0) (gethash x rain-converter) ""))
          (hash-table-keys rain-converter) "")))
    (if (string=  "" res) (number-to-string n) res)))



(provide 'raindrops)
;;; raindrops.el ends here
