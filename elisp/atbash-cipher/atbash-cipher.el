;;; atbash-cipher.el --- Atbash-Cipher (exercism)

;;; Commentary:




;;; Code:

(require 'seq)

(defun encode-atbash-char (c)
  (+ (- ?a 1) (+ (/ (+ 1 (- ?z ?a)) 2)
                 (/ (- (+ 1 (- ?z ?a))
                       (* 2
                          (- c ?a))) 2 ))))

(defun format-plaintext (plaintext)
  (replace-regexp-in-string "[.]$" ""
                            (replace-regexp-in-string " " "" (downcase plaintext))))

(defun make-space (txt)
  (replace-regexp-in-string "\\([a-z]\\{5\\}\\)\\([a-z]\\{5\\}\\)" "\\1 \\2" txt))

(defun make-spaces (encoded_text)
  (seq-reduce (lambda (a b) (make-space a) )
              (number-sequence 0 (/ (length encoded_text) 5)) encoded_text))

(defun encode (plaintext)
  (make-spaces (mapconcat 'string (mapcar
                                   'encode-atbash-char
                                   (format-plaintext plaintext)) "")))


  (provide 'atbash-cipher)
;;; atbash-cipher.el ends here
