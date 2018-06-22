(defun mapear(f l)
   (if (null l)
     ()
     (cons (funcall f (car l)) (mapear f (cdr l)))
    )
)

(defun main()
  (write-line (write-to-string (mapear (lambda (x) (eq (mod x 2) 0)) '(1 2 3 4 5))))
  (write-line (write-to-string (mapear (lambda (x) (eq (mod x 2) 1)) '(1 2 3 4 5))))
)

(main)
