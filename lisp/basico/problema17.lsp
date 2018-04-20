(defun is-prime (n k)
  (cond
    ((< n 2) NIL)
    ((eq n 2) T)  ; 2 is the first prime (the only pair prime)
    ((eq (mod n 2) 0) NIL)  ; n is a pair number different of 2
    ((> k (isqrt n)) T)  ; already reached the sqrt of n
    ; k doesn't divide n, class recursively
    ((<= k (isqrt n)) (and (not (eq (mod n k) 0)) (is-prime n (+ 2 k))))  
    (t T)
  )
)

(defun main ()
  (setq n (read))
  (write-line (write-to-string (is-prime n 3)))
)

(main)
