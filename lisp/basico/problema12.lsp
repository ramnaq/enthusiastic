(defun mcd2 (a b)
    (cond
        ((eq 0 a) b)
        ((eq 0 b) a)
        ((> a b) (mcd2 (- a b) b))
        (t (mcd2 a (- b a)))
    )
)

(defun mcd3 (a b c)
    (mcd2 (mcd2 a b) c)
)

(defun main()
	(setq a (read))
	(setq b (read))
	(setq c (read))
	(write-line(write-to-string(mcd3 a b c)))
)

(main)
