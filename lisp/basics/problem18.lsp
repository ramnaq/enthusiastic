(defun do-operation(a op b)
    (cond
        ((char= op #\+) (+ a b))
        ((char= op #\-) (- a b))
        ((char= op #\*) (* a b))
        ((char= op #\/) (/ a b))
    )
)

(defun main()
	(print "Insert the operation, with spaces between the characters. For example: 3 + 4. (Supported operations (symbols): +, -, *, /)")
	(setq a (read))
	(setq op (read-char))
	(setq ignored-space (read-char))
	(setq b (read))
	(print (do-operation a op b))
)

(main)

