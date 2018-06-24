; 
; considering that 5 is the element 0 (n = 0)
(defun sequencia(n)
  (if (< n 0)
    (- 1)
    (if (eq n 0)
      (+ 5)
      (+ (sequencia (- n 1)) (+ 6 (* 2 (- n 1))))
    )
  )
)

(defun main()
  (print (sequencia 1))
  (print (sequencia 7))
)

(main)
