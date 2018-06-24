(setf sqr (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '((1 3 2)
                       (4 6 5)
                       (8 7 9))
                    ) ;inicializando a matriz com alguns valores
)

; the list containing the elements that should be i the square
(defun numbers (d)
  (setq nums ())
  (dotimes (i (* d d))
    (setq nums (cons (+ i 1) nums))
  )
  nums
)

(defun valid-square (a d)
  (setq sqr-list ())  ; the list that represents the elements of the square
  (dotimes (i d)
    (setq sqr-list (append sqr-list (get-raw a i d)))
  )
  (valid-sequence sqr-list (numbers d))
)

(defun valid-diagonals (a d)
    (eq (sum (fst-diagonal a d) 0) (sum (snd-diagonal a d) 0))
)

; return the sum of all the elements of the list 'l'. 'accum' should be 0 when sum is called
(defun sum (l accum)
  (if (null l)
    0
    (+ (car l) (sum (cdr l) accum))
  )
)

; returns a list with the elements of the main diagonal of the matrix 'a', that has dimension 'd'
(defun fst-diagonal (a d)
  (setq diagonal ())
  (dotimes (i d)
    (setq diagonal (cons (aref a i i) diagonal))
  )
  diagonal
)

; returns a list with the elements of the secondary diagonal of the matrix 'a', that has dimension 'd'
(defun snd-diagonal (a d)
  (setq diagonal ())
  (dotimes (i d)
    (setq diagonal (cons (aref a i (- (- d 1) i)) diagonal))
  )
  diagonal
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

; returns a list containing the 'd' elements of the raw 'r' of the square 'a'
(defun get-raw(a r d)
  (setq raw ())
  (dotimes (j d)
    (setq raw (append raw (list (aref a r j))))
  )
  raw 
)

(defun is-magic-sqr (sqr d)
  (AND (valid-square sqr d) (valid-diagonals sqr d))
)

(defun main()
  (print (is-magic-sqr sqr 3))
)

(main)
