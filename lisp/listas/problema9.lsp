(defun my-reverse(l)
  (if (null l)
    ()
    (concatenate 'list (my-reverse (cdr l)) (list (car l)))
  )
)

(defun main()
    (write-line(write-to-string (my-reverse '(1 2 3 4 5))))
)

(main)
