(defun delete-first(n l)
  (if (OR (null l))
    ()
    (if (NOT (eq n 0))
      (delete-first (- n 1) (cdr l))
      l
    )
  )
)

(defun main()
  (write-line (write-to-string (delete-first 0 '(1 2 3))))
  (write-line (write-to-string (delete-first 1 '(1 2 3))))
  (write-line (write-to-string (delete-first 2 '(1 2 3))))
  (write-line (write-to-string (delete-first 3 '(1 2 3))))
)

(main)
