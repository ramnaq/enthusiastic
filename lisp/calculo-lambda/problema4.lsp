(defun squared-diff (x y)
  (expt (- x y) 2)
)

(defun main()
  (setq x1 (read))
  (setq y1 (read))
  (setq z1 (read))
  (setq x2 (read))
  (setq y2 (read))
  (setq z2 (read))
  (print ((lambda (a1 b1 c1 a2 b2 c2)
            (sqrt (+ (+ (squared-diff a2 a1) (squared-diff b2 b1)) (squared-diff c2 c1))))
          x1 y1 z1 x2 y2 z2))  ; args to the lambda function
)

(main)
