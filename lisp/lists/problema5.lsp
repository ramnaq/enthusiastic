(defun busca(l x)
    (if (null l)
        NIL
        (if (eq (car l) x)
            T
            (busca (cdr l) x)
        )
    )
)

(defun main()
    (write-line(write-to-string(busca '(1 2 6 4 5 1 8 7 2 7) 0)))
    (write-line(write-to-string(busca '(1 2 6 4 5 1 8 7 2 7) 7)))
)

(main)
