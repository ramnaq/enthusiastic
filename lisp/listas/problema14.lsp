(defun alunos()
    '((1 "Bob" (5.6 8 9.3))
      (2 "Ana" (8.2 9 7 6.5))
      (3 "Tom" (3.2 7 5.7 8.3))
      (4 "Bin" (7.5 5.3 8.5 6.2 3.1))
      (5 "Bia" (6.7 4.1 5.5)))
)

(defun getNome (aluno)
    (car (cdr aluno))
)

(defun getNotas (aluno)
    (car (last aluno))
)

(defun getNomes (lista)
    (if (null lista)
        ()
        (cons (getNome (car lista)) (getNomes (cdr lista)))
    )
)

(defun soma(l)
    (if (null l)
        0
        (+ (car l) (soma (cdr l)))
    )
)

(defun comprimento(l)
    (if (null l)
        0
        (+ 1 (comprimento (cdr l)))
    )
)

(defun media(l)
    (if (null l)
        0
        (/ (soma l) (comprimento l)))
)

(defun getValuesFromMedias(medias)
    (if (null medias)
        ()
        (cons (cdr (car medias)) (getValuesFromMedias (cdr medias)))
    )
)

; A
(defun medias(alunos)
    (if (null alunos)
        ()
        (cons (cons (getNome (car alunos)) (media (getNotas (car alunos)))) (medias (cdr alunos)))
    )
)

; B
(defun mediaTurma(alunos)
    (if (null alunos)
        ()
        (media (getValuesFromMedias (medias alunos)))
    )
)

; C
(defun acimaMedia(alunos)
  (if (null alunos)
    ()
    (if (> (media (getNotas (car alunos))) media-turma)
      (cons (cons (getNome (car alunos)) (media (getNotas (car alunos)))) (acimaMedia (cdr alunos)))
    )
  )
)

; D
(defun aprovados(alunos)
  (if (null alunos)
    ()
    (if (>= (media (getNotas (car alunos))) 6)
      (cons (getNome (car alunos)) (aprovados (cdr alunos)))
    )
  )
)

; E
(defun duplas(alunos)
  (if (null alunos)
    ()
    (if (not (null (cdr alunos)))
        (cons (cons (getNome (car alunos)) (getNome (car (cdr alunos)))) (duplas (cdr (cdr alunos))))
        (cons (getNome (car alunos)) ())
    )
  )
)

(defun ordenarAlunos(alunos)
  (if (null alunos)
    ()
    (if (null (cdr alunos))
      (car alunos)
      (if (<= (car alunos) (car (cdr alunos)))
        (cons (car alunos) (ordenarAlunos (cdr alunos)))
        (cons (car (cdr alunos)) (ordenarAlunos (cons (car alunos) (cdr (cdr alunos)))))
      )
    )
  )
)


(defun main()
    (write-line (write-to-string (medias (alunos))))
    (write-line (write-to-string (mediaTurma (alunos))))    
    (setq media-turma (mediaTurma (alunos)))
    (write-line (write-to-string (acimaMedia (alunos))))    
    (write-line (write-to-string (aprovados (alunos))))    
    (write-line (write-to-string (duplas (alunos))))    
    (write-line (write-to-string (ordenarAlunos '(9 1 1 4 3))))  
)

(main)
