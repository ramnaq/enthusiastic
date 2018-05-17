(setf x (make-array '(9 9) ;criando uma matriz 3x3
   :initial-contents '((1 3 2 5 7 9 4 6 8)
                       (4 9 8 2 6 1 3 7 5)
                       (7 5 6 3 8 4 2 1 9)
                       (6 4 3 1 5 8 7 9 2)
                       (5 2 1 7 9 3 8 4 6)
                       (9 8 7 4 2 6 5 3 1)
                       (2 1 4 9 3 5 6 8 7)
                       (3 6 5 8 1 7 9 2 4)
                       (8 7 9 6 4 2 1 5 3))
                    ) ;inicializando a matriz com alguns valores
)

(defun maior(a) 
    (setq m (aref a 0 0)) ;aref permite acessar uma posição i j da matriz, neste caso acesso a posição 0,0 da matriz a
    (dotimes (i 3) ;dotimes permite realizar um número fixo de iterações
        (dotimes (j 3)
            (if (> (aref a i j) m)
                (setq m (aref a i j))
            )
        )
    )
    m ;é o retorno da minha função
)


#| sudoku verification solution |#

#| receives a squared matrix 'a' which has dimension 'i'
    return:
        T: all the lines of 'a' are the same 'set' of 'numbers'
        NIL: otherwise
|#
(defun valid-raws(m d)
  (setq valid T)
  (dotimes (i d)
    (dotimes (j d)
      (setq valid (AND valid (valid-sequence (get-raw m i) numbers)))
    )
  )
  valid
)

(defun valid-columns(m d)
  (setq valid T)
  (dotimes (j d)
    (dotimes (i d)
      (setq valid (AND valid (valid-sequence (get-column m j) numbers)))
    )
  )
  valid
)

(defun valid-sequence(seq nums)
  (if (AND (eq (length seq) 1) (eq (length nums) 1))
    (eq (aref seq 0) (car nums))
    (if (AND (not (null seq)) (not (null nums)))
      (if (null (delete (car nums) seq))
        NIL
        (AND T (valid-sequence (delete (car nums) seq) (cdr nums)))
      )
      NIL
    )
  )
)

(defun get-raw(m r)
  (make-array (array-dimension m 1)
    :displaced-to m
      :displaced-index-offset (* r (array-dimension m 1)))
)

(defun get-column(m c)
  (make-array (array-dimension m 1)
    :displaced-to m
      :displaced-index-offset (* c (array-dimension m 1)))
)

(defun cars (matrix)
  "Return a list with all the cars of the lists in matrix"
  (if (null matrix)
      nil
      (cons (car (car matrix)) (cars (cdr matrix))))
)
#|
(defun sudoku-solution (a)
  (AND (AND (valid-columns a) (valid-raws a))
       (perfect-squares a))
)
|#

(defun main()
    ; a list with the numbers that should be in a raw or column
    (setq numbers '(1 2 3 4 5 6 7 8 9))

    (write-line (write-to-string x)) ;imprimindo uma matriz
    (print (valid-raws x 9))
    (setf (aref x 8 1) 33) ;alrerando o elemento da posiÃ§Ã£o 0,1 para 33
    (print (cars x))
)


(main)
