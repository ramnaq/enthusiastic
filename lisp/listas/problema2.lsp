(defun soma(l)
    (if (null l)
        0
        (+ (car l) (soma (cdr l)))
    )
)

(defun comprimento(l)
    (if (null l)
        0
        (+ 1 (comprimento (cdr l)))
    )
)

(defun media(l)
    (if (null l)
        0
        (/ (soma l) (comprimento l)))
)

(defun main()
    (write-line(write-to-string(media '(10 10 10))))
)

(main)
