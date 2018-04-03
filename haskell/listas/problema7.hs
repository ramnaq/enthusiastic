module Problema7 (alunos, getNome, getPrimeiroAluno, gerarPares) where

alunos :: [(Int, String, Float)]
getNome :: (Int, String, Float) -> String
getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
gerarPares :: [t] -> [u] -> [(t,u)] 

{- funções do exercício -}
aprovados :: [(Int, String, Float)] -> [String]
aprovados2 :: [(Int, String, Float)] -> [String]

getNotas :: [(Int, String, Float)] -> [Float]


alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome (a,b,c) = b

getPrimeiroAluno (a:_) = a

gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2]

aprovados ((a, b, nota):xs) =
    map (getNome) (filter (nota>=6) xs)

aprovados2 [(a, b, c)] = ["bla"]

getNotas ((_, _, nota):xs) = [nota] ++ getNotas xs

main = do
    print (getPrimeiroAluno alunos)
