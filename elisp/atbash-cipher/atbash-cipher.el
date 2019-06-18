;;; atbash-cipher.el --- Atbash-Cipher (exercism)

;;; Commentary:




;;; Code:

(defun encode-atbash-char (c)
  (+ (- ?a 1) (+ (/ (+ 1 (- ?z ?a)) 2)
                 (/ (- (+ 1 (- ?z ?a))
                       (* 2
                          (- c ?a))) 2 ))))

(defun format-plaintext (plaintext)
  (replace-regexp-in-string "(yes)" "toto"
                            (replace-regexp-in-string "[.]$" ""
                                                      (replace-regexp-in-string " " "" (downcase plaintext)))))

(defun make-space (encoded_text)
  (replace-regexp-in-string "\\([a-z]\\{4\\}\\)\\([a-z]\\{4\\}\\)" "\\1 \\2" encoded_text))

(defun encode (plaintext)
  (make-space (mapconcat 'string (mapcar
                                  'encode-atbash-char
                                  (format-plaintext plaintext)) "")))


  (provide 'atbash-cipher)
;;; atbash-cipher.el ends here
