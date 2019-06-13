;;; robot-name.el --- Robot Name (exercism)

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;

;;; Code:

(setq robot-set (list))

(defun random-uppercase-letter (_)
  (string (+ (random (- ?Z ?A)) ?A)))

(defun build-robot ()
  (push (seq-map #'random-uppercase-letter (number-sequence 0 1)) robot-set))

(defun robot-name (robot))

(defun robot-reset (robot))


(provide 'robot-name)
;;; robot-name.el ends here
