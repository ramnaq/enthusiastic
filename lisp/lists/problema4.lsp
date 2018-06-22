(defun comprimento(l)
    (if (null l)
        0
        (+ 1 (comprimento (cdr l)))
    )
)

(defun menor(l)
    (if (null l)
        0
        (if (or (eq (comprimento l) 1) (< (car l) (menor (cdr l))) )
            (car l)
            (menor (cdr l))
        )
    )
)

(defun maior(l)
    (if (null l)
        0
        (if (> (car l) (maior (cdr l)))
            (car l)
            (maior (cdr l))
        )
    )
)

(defun diferencaMaiorMenor(l)
    (- (maior l) (menor l))
)

(defun main()
    (write-line(write-to-string(diferencaMaiorMenor '(1 2 6 4 5 1 8 7 2 7))))
)

(main)
