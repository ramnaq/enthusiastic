(setf x (make-array '(8 9) ;criando uma matriz 3x3
   :initial-contents '((1 1 6 5 7 5 4 6 8)
                       (4 9 8 2 6 1 3 7 5)
                       (7 5 6 3 8 4 2 1 9)
                       (9 8 7 4 2 6 5 3 1)
                       (9 8 7 4 2 6 5 3 1)
                       (1 1 1 1 1 1 1 1 5)
                       (1 1 1 1 5 1 1 1 1)
                       (8 7 9 6 4 2 1 5 3))
                    ) ;inicializando a matriz com alguns valores
)

(defun rotacionar(m l c n)
  (if (eq (length (get-raw m 0)) n)
    m
    (dotimes (i l)
      (setq linha (get-raw m i))
      (setq linha-rotacionada (rotacionar-lista linha n))
      (setq m (set-nova-linha m i linha-rotacionada))
    )
  )
  m
)

(defun rotacionar-lista(l n)
    (dotimes (i n)
      (setq l (remove-ultimo (cons (car (last l)) l)))
    )
    l
)

(defun set-nova-linha(m l nl)
    (dotimes (j (length nl))
      (setf (aref m l j) (nth j nl))
    )
    m
)

(defun remove-ultimo(l)
  (if (null (cdr l))
    ()
    (cons (car l) (remove-ultimo (cdr l)))
  )
)

(defun get-raw(m r)
  (setq raw ())
  (dotimes (i (array-dimension m 1))
    (setq raw (append raw (list (aref m r i))))
  )
  raw
)

(defun main()
  (write-line (write-to-string (rotacionar x 8 9 2)))
)

(main)
