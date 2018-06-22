(defun major (x y z)
  (if (and (>= x y) (>= x z))
    x
    (if (and (>= y x) (>= y z))
      y
      z
    )
  )
)

(defun builds-triangle (x y z)
  (if (and (eq (major x y z) x) (> (+ y z) x))
    T
    (if (and (eq (major x y z) y) (> (+ x z) y))
      T
      (and (eq (major x y z) z) (> (+ x y) z))
    )
  )
)

(defun main()
  (setq x (read))
  (setq y (read))
  (setq z (read))
  (write-line (write-to-string (builds-triangle x y z)))
)

(main)
