(defun mcd2(a b)
    (cond
        ((eq 0 a) b)
        ((eq 0 b) a)
        ((> a b) (mcd2 (- a b) b))
        (t (mcd2 a (- b a)))
    )
)

(defun coprimes(a b)
    (eq 1 (mcd2 a b))
)

(defun phi(n k)
    (if (eq n k)
        0
        (if (coprimes n k)
           (+ 1 (phi n (+ 1 k)))
           (phi n (+ 1 k))
        )
    )
)

(defun main()
	(setq n (read))
	(write-line(write-to-string(phi n 1)))
)

(main)
