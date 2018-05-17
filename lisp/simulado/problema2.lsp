(defun pell(n)
  (if (eq n 0)
    0
    (if (eq n 1)
      1
      (+ (* 2 (pell (- n 1))) (pell (- n 2)))
    )
  )
)

(defun main()
  (print (pell 1))
  (print (pell 2))
  (print (pell 3))
  (print (pell 4))
  (print (pell 5))
  (print (pell 10))
)

(main)
