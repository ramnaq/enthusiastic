(defun interssecao(a b)
  (setq c ())
  (dotimes (i (length a))
    (if (eq NIL (set-difference (list (nth i a)) b))
      (setq c (put (nth i a) c))
    )
  )
  c
)

(defun put(x intersec)
  (if (null (find x intersec))
    (cons x intersec)
    intersec
  )
)

(defun main()
  (print (interssecao '() '(2 2 4 10 8)))
  (print (interssecao '(4 10 4 1) '(2 2 4 10 8)))
  (print (interssecao '(2 10 4) '(2 2 4 10 8)))
)

(main)

