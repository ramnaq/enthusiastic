(defun bhaskara(a b c)
  (setq delta (- (expt b 2) (* (* 4 a) c)))
  (if (>= delta 0)
    ((lambda (x y z) (cons (/ (+ (- b) (sqrt delta)) 2) (/ (- (- b) (sqrt delta)) 2 ))) a b c)
    "Error! Negative square root."
  )
)


(defun main()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (print (bhaskara a b c))
)


(main)
