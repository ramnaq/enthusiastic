(defun sqrt-delta (a b c)
    (sqrt (+ (expt b 2) (* ( *(- 4) a) c)))
)

(defun bhaskara (a b c)
  (setq posivite-root (/ (+ (- b) (sqrt-delta a b c)) (* 2 a)))
  (setq negative-root (/ (- (- b) (sqrt-delta a b c)) (* 2 a)))
  (values posivite-root negative-root)
)

(defun main()
  (setq a (read))
  (setq b (read))
  (setq c (read))
  (write-line (write-to-string (bhaskara a b c)))
)

(main)
