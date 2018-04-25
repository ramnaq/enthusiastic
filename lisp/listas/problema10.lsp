(defun my-map(f l)
  (if (null l)
    ()
    (cons (funcall f (car l)) (my-map f (cdr l)))
  )
)

(defun inc(a)
  (+ 1 a)
)

(defun main()
  (write-line (write-to-string (my-map 'inc '(1 2 3 4 5))))
)

(main)
