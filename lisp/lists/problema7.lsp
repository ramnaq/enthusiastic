(defun comprimento(l)
    (if (null l)
        0
        (+ 1 (comprimento (cdr l)))
    )
)

(defun enesimo(l n)
    (if (OR (null l) (OR (>= n (comprimento l)) (< n 0) ) )
        NIL
        (if (eq n 0)
            (car l)
            (enesimo (cdr l) (- n 1))
        )
    )
)

(defun main()
    (write-line(write-to-string(enesimo '(1 2 6 4 5 1 8 7 2 7) 9)))
    (write-line(write-to-string(enesimo '(1 2 6 4 5 1 8 7 2 7) 10)))
    (write-line(write-to-string(enesimo '(1 2 6 4 5 1 8 7 2 7) 3)))
)

(main)
