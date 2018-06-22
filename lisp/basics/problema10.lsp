(defun major (x y z)
  (if (and (>= x y) (>= x z))
    x
    (if (and (>= y x) (>= y z))
      y
      z
    )
  )
)

(defun main()
	(setq a (read))
	(setq b (read))
	(setq c (read))
	(write-line(write-to-string(major a b c)))
)

(main)
