(defun main()
  (setq a ((lambda (a b c) (max (max a b) c)) (- 1) 0 1))
  (setq b ((lambda (a b c) (max (max a b) c)) 2 2 3))
  (print a)
  (print b)
)

(main)
