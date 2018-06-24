(defun remove-while (f l)
  (if (null l)
    ()
    (if (funcall f (car l))
      (remove-while f (cdr l))
      l
    )
  )
)

(defun pair(a)
  (eq (mod a 2) 0)
)

(defun main()
  (write-line (write-to-string (remove-while 'pair '(2 2 4 4 5))))
  (write-line (write-to-string (remove-while 'pair '(2 1 4 4 5))))
  (write-line (write-to-string (remove-while 'pair '(2 2 4 4 10))))
)

(main)
