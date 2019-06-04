;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:

(require 'seq)

(defun from (s min h d mon y)
  (seq-subseq (decode-time (time-add (encode-time s min h d mon y "ETC") (seconds-to-time 1000000000)) "ETC") 0 6))





(provide 'gigasecond)
;;; gigasecond.el ends here
