(defun main()
  (setq a (read))
  (setq b (read))
  (setq c (read))
  (print ((lambda (x y z) (if (>= (/ (+ (+ x y) z) 3) 6)
                "Approved :)"
                "Not yet approved :(")) a b c)
  )
)

(main)
