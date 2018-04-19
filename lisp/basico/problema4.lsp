(defun exclusive-or (bool1 bool2)
  (if bool1
    (not bool2)
    bool2 )
)

(defun main()
  (setq a (read))
  (setq b (read))
  (write-line (write-to-string (exclusive-or a b)))
)

(main)
