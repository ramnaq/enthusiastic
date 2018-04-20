(defun is-prime (n k)
  (cond
    ((< n 2) NIL)
    ((eq n 2) T)  ; 2 is the first prime (the only pair prime)
    ((eq (mod n 2) 0) NIL)  ; n cannot be pair (except 2)
    ((> k (isqrt n)) T)  ; we have to test just until (isqrt n)
    ; k doesn't divide n? Great, so continue recursively with odd k's
    ((<= k (isqrt n)) (and (not (eq (mod n k) 0)) (is-prime n (+ 2 k))))  
  )
)

(defun main ()
  (setq n (read))
  (write-line (write-to-string (is-prime n 3)))
)

(main)
