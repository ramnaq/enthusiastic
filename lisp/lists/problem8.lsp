(defun comprimento(l)
    (if (null l)
        0
        (+ 1 (comprimento (cdr l)))
    )
)

(defun valid-args(l n m)
    (setq empty-list (null l))
    (setq negative-n (< n 0))
    (setq m-out-of-bound (>= m (comprimento l)))
    (NOT (OR empty-list (OR (<= m n) (OR m-out-of-bound negative-n))))
)

(defun get-slice(l n m)
    (if (NOT (eq n 0))                                ; if it is not the beginning of the slice
        (slice (cdr l) (- n 1) (- m 1))               ; ignore the head and continue recursively
        (if (not (eq m 0))                            ; otherwise, while it isnt the last slice elem
            (cons (car l) (slice (cdr l) n (- m 1)))  ; obtein the following elements, one by one
            ()                                        ; (the end of the slice reached)
        )
    )
)

(defun slice(l n m)
    (if (valid-args l n m)
        (get-slice l n m)
        NIL
    )
)

(defun main()
    (setq l (list 1 2 6 4 5 1 8 7 2 7))
    (write-line (write-to-string (slice l 0 9)))  ; 1 2 6 4 5 1 8 7 2
    (write-line (write-to-string (slice l 0 1)))  ; 1
    (write-line (write-to-string (slice l 0 2)))  ; 1 2
    (write-line (write-to-string (slice l 0 3)))  ; 1 2 6
    (write-line (write-to-string (slice l 2 7)))  ; 6 4 5 1 8
    (write-line (write-to-string (slice l 8 9)))  ; 2
    (write-line (write-to-string (slice l 9 9)))  ; NIL
)

(main)
