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

(defun main()
    (write-line (write-to-string (medias (alunos))))
    (write-line (write-to-string (mediaTurma (alunos))))    
)

(main)
