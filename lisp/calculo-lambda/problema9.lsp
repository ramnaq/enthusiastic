(setf x (make-array '(4 4) ;criando uma matriz 3x3
   :initial-contents '((0 0 0 1)
                       (0 1 0 0)
                       (1 0 0 0)
                       (0 0 1 0))
                    ) ;inicializando a matriz com alguns valores
)

(defun is-permutation-matrix (a d)
  (setq ones (get-raw a 0 d))
  (dotimes (i (- d 1))
    (if (> (count 1 (get-raw a (+ i 1) d)) 1)
      (return-from is-permutation-matrix NIL)
      (if (not (eq (count 1 (or-list ones (get-raw a (+ i 1) d))) (+ i 2)))
        (return-from is-permutation-matrix NIL)
        (setq ones (or-list ones (get-raw a (+ i 1) d)))
      )
    )
  )
  T
)

; returns a list containing the 'd' elements of the raw 'r' of the square 'a'
(defun get-raw(a r d)
  (setq raw ())
  (dotimes (j d)
    (setq raw (append raw (list (aref a r j))))
  )
  raw 
)

(defun or-list(l1 l2)
  (if (not (eq (length l1) (length l2)))
    NIL
    (if (eq (length l1) 1)
      (list (logior (car l1) (car l2)))
      (cons (logior (car l1) (car l2)) (or-list (cdr l1) (cdr l2)))
    )
  )
)

(defun main()
  (print (is-permutation-matrix x 4))
)


(main)
