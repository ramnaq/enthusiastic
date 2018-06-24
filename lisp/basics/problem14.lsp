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

(defun main()
	(setq a (read))
	(setq b (read))
	(write-line(write-to-string(coprimes a b)))
)

(main)