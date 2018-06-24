(defun mcd (a b)
    (if (eq 0 a)
        b
        (if (eq 0 b)
            a
            (if (> a b)
                (mcd (- a b) b)
                (mcd a (- b a))
            )
        )
    )
)

(defun main()
	(setq a (read))
	(setq b (read))
	(write-line(write-to-string(mcd a b)))
)

(main)
