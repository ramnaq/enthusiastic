type Nome = String
type Disciplina = String
type Nota = Float
type Aluno = (Nome, Disciplina, Nota, Nota, Nota)

aluno :: Int -> Aluno
aluno 1 = ("Joaum", "Paradigmas e Programacao", 10, 10, 10)
aluno 2 = ("Enzo", "Paradigmas e Programacao", 7, 5, 9)
aluno 3 = ("Julia", "Paradigmas e Programacao", 10, 10, 10)

getNome :: Aluno -> Nome
getNome (nome, _, _, _, _) = nome

mediaFinal :: Aluno -> Float
mediaFinal (_, _, n1, n2, n3) = (n1 + n2 + n3)/3

mediaFinalTurma :: Int -> Float
mediaFinalTurma 3 = mediaFinal (aluno 1)
mediaFinalTurma id =
	mediaFinalTurma (id+1) + (mediaFinal $ aluno (id))

main = do
	print $ getNome $ aluno 1
	print $ getNome $ aluno 2
	print $ mediaFinal $ aluno 3
	print $ mediaFinalTurma 1
