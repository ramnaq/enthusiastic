(defun main()
    (setq a (read))
    (setq b (read))
    (print ((lambda (a b) (if a (not b) b)) a b))
)

(main)
