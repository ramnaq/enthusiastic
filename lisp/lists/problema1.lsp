(defun soma(l)
    (if (null l)
        0
        (+ (car l) (soma(cdr l)))
    )
)

(defun main()
    (write-line(write-to-string(soma '(1 2 3 4))))
)

(main)
