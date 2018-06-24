(defun segundoMenor(v)
  (menor (delete (menor v) v))
)

(defun menor(l)
  (if (null l)
    0
    (if (or (eq (length l) 1) (< (car l) (menor (cdr l))) )
      (car l)
      (menor (cdr l))
      )
  )
)

(defun main()
  (print (segundoMenor (cons (- 1) '(4 10 8))))
)

(main)


