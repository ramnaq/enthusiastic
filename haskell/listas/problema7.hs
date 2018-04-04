-- arquivo alunos.hs modificado

module Problema7 (alunos, getNome, getPrimeiroAluno, gerarPares, aprovados, aprovados2) where

alunos :: [(Int, String, Float)]
getNome :: (Int, String, Float) -> String
getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)

-- função modificada
gerarPares :: [(Int, String, Float)] -> [(Int, String, Float)] -> [(String,String)]

{- funções do exercício -}
aprovados :: [(Int, String, Float)] -> [String]
aprovados2 :: [(Int, String, Float)] -> [String]
aprovado :: (Int, String, Float) -> Bool  -- função auxiliar


alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome (a,b,c) = b

getPrimeiroAluno (a:_) = a

{- modificada do arquivo original "alunos.hs" -}
gerarPares l1 l2 = [((nomeA, nomeB)) | (idA, nomeA, _) <- l1, (idB, nomeB, _) <- l2, idA /= idB]

aprovados turma =
    map (getNome) (filter (aprovado) turma)

aprovado (_, _, nota) = nota >= 6

aprovados2 [] = []
aprovados2 ((_, nome, nota):tail)
    | nota >= 6 = [nome] ++ aprovados2 tail
    | otherwise = aprovados2 tail
