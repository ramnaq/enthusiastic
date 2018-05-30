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


#| sudoku verification solution |#

; verify if all the rows of the matrix 'a' are valid sequences.
(defun valid-raws(a d)
  (dotimes (i d)
    (if (not (valid-sequence (get-raw-slice a i 0 d) numbers))
      (return-from valid-raws NIL)
    )
  )
  T
)

; verify if all the columns of the matrix 'a' are valid sequences.
(defun valid-columns(a d)
  (dotimes (j d)
    (if (not (valid-sequence (get-column-slice a 0 j d) numbers))
      (return-from valid-columns NIL)
    )
  )
  T
)

; verify if all the squares of the "sudoku matrix" 'a' are valid squares.
(defun valid-squares(a d)
  (setq sqrs (sqrt d))  ; number of squares to check
  (dotimes (i sqrs)
    (dotimes (j sqrs)
      (if (not (valid-square a (* i sqrs) (* j sqrs) sqrs))
        (return-from valid-squares NIL)
      )
    )
  )
  T
)

; verify if the square of dimension 'd', that has its first position (r, c) in the matrix 'a'
; is a valid square of a sudoku matrix (a).
(defun valid-square (a r c d)
  (setq sqr-list ())  ; the list that represents the elements of the square
  (dotimes (i d)
    (setq sqr-list (append sqr-list (get-raw-slice a (+ r i) c d)))
  )
  (valid-sequence sqr-list numbers)
)

; verify if the given sequence 'seq' has the same elements as nums (without repetitions)
(defun valid-sequence(seq nums)
  (if (not (eq (length seq) (length nums)))
    NIL
    (if (AND (eq (length seq) 1) (eq (length nums) 1))
      (eq (car seq) (car nums))
      (AND T (valid-sequence (delete (car nums) seq) (cdr nums)))
    )
  )
)

; returns a list that is a slice starting with the element (r, c) and
; getting the next d elements of the raw of the matrix 'a'.
(defun get-raw-slice(a r c d)
  (setq raw ())
  (dotimes (j d)
    (setq raw (append raw (list (aref a r (+ c j)))))
  )
  raw 
)

; returns a list that is a slice starting with the element (r, c) and
; getting the next d elements of the column of the matrix 'a'.
(defun get-column-slice(a r c d)
  (setq column ())
  (dotimes (i d)
    (setq column (append column (list (aref a (+ r i) c))))
  )
  column
)

; given a sudoku matrix 'a', with dimension 'd', returns if it is a sudoku solution.
(defun verify-sudoku(a d)
  (AND (valid-raws a d) (valid-columns a d) (valid-squares a d))
)

(defun main()
    (setq d 9)  ; the dimension
    (setq numbers '(1 2 3 4 5 6 7 8 9)) ; a list with the numbers that should be in a raw or column

    (print (verify-sudoku x d))
)


(main)
