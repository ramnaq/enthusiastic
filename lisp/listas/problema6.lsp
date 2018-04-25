(defun busca(l x)
    (if (null l)
        NIL
        (if (eq (car l) x)
            T
            (busca (cdr l) x)
        )
    )
)

(defun ocorrencias(l x)
    (if (null l)
        0
        (if (eq (car l) x)
            (+ 1 (ocorrencias (cdr l) x))
            (ocorrencias (cdr l) x)
        )
    )
)

(defun main()
    (write-line(write-to-string(ocorrencias '(1 2 6 4 5 1 8 7 2 7) 0)))
    (write-line(write-to-string(ocorrencias '(1 2 6 4 5 1 8 7 2 7) 6)))
    (write-line(write-to-string(ocorrencias '(1 2 6 4 5 1 8 7 2 7) 7)))
)

(main)
