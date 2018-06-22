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

(defun pico(m l c)
  (setq p (aref m 0 0))
  (dotimes (i (- l 1))
    (setq curr-raw (get-raw m i))
    (dotimes (j (- c 2))
      (if (pico-linha j curr-raw)
        (if (pico-coluna i j m)
          (return-from pico (aref m i j))
          (setq j (+ j 1))  ; é pico linha (mas não coluna); (j+1) não é pico
        )
        (if (maior-que-proximo m i (+ j 1))
          (if (pico-coluna i (+ j 1) m)  ;não é pico-linha, então próximo é, vê pico-columa de (j+1)
            (return-from pico (aref m i (+ j 1)))
            (setq j (+ j 1))
          )
          (setq j (+ j 1))
        )
      )
    )
  )
  p
)

(defun maior-que-proximo(m i j)
  (>= (aref m i j) (aref m i (+ j 1)))
)

(defun pico-linha(j l)
  (if (eq j 0)
    (>= (aref l j) (aref l (+ j 1)))
    (AND (>= (aref l j) (aref l (- j 1))) (>= (aref l j) (aref l (+ j 1))))
  )
)

(defun pico-coluna(i j m)
  (if (eq 0 i)
    (>= (aref m i j) (aref m (+ i 1) j))
    (AND (>= (aref m i j) (aref m (- i 1) j))
         (>= (aref m i j) (aref m (+ i 1) j)) )
  )
)

(defun get-raw(m r)
  (make-array (array-dimension m 1)
    :displaced-to m
      :displaced-index-offset (* r (array-dimension m 1)))
)

(defun main()
  (write-line (write-to-string (pico x 8 9)))
)

(main)


