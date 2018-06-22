(defun fibonacci (n)
  (if (or (eq n 2) (eq n 1))
    1
    (+ (fibonacci (- n 1)) (fibonacci (- n 2)))
  )
)

(defun main()
  (setq n (read))
  (write-line (write-to-string (fibonacci n)))
)

(main)
