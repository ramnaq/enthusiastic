(defun divides(a b)
    (eq 0 (mod b a))
)

(defun main()
	(setq a (read))
	(setq b (read))
	(write-line(write-to-string(divides a b)))
)

(main)
