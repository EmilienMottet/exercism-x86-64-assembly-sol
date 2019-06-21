;;; robot-name.el --- Robot Name (exercism)

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;

;;; Code:

(setq robot-table #s(hash-table test equal))

(defun random-digit (_)
  (string (+ (random (- ?9 ?0)) ?0)))

(defun random-uppercase-letter (_)
  (string (+ (random (- ?Z ?A)) ?A)))

(defun make-robot-name ()
  (concat (mapconcat #'random-uppercase-letter (number-sequence 0 1) "") (mapconcat #'random-digit (number-sequence 0 2) "")))

(defun make-uniq-robot-name ()
  (let ((name (make-robot-name))
        (while (gethash name robot-table) (setq name (make-robot-name))) name)))

(defun build-robot ()
  (let* ((name (make-robot-name))) (puthash name name robot-table)))

(defun robot-name (robot)
  (gethash robot robot-table))

(defun reset-robot (robot)
  (puthash robot (make-robot-name) robot-table))


(provide 'robot-name)
;;; robot-name.el ends here
