(defun comprimento(l)
    (if (null l)
        0
        (+ 1 (comprimento (cdr l)))
    )
)

(defun menor(l)
  	(if (null l)
	  	0
	    	(if (or (eq (comprimento l) 1) (< (car l) (menor (cdr l))) )
			(car l)
			(menor (cdr l))
	    	)
	)
)

(defun main()
    (write-line(write-to-string(menor '(1 -4 2 -7))))
)

(main)
