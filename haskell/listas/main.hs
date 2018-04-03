module Main (main) where

import Problema1  -- soma
import Problema2  -- média
import Problema3  -- menor elemento
import Problema4  -- diferença entre maior e menor elementos
import Problema5  -- verificação de presença de dado elemento (busca)
import Problema6  -- número de ocorrências de dado elemento
import Problema7  -- adição de funções ao arquivo aluno.hs

main = do
    let nums = [3, 2, 4, 7, 1, 4]
    let nums2 = [1, 2, 3, 1]

    print $ soma nums  -- 21
    print $ media nums  -- 3.5
    print $ menor nums  -- 1
    print $ diferencaMaiorMenor nums  -- 6 = 7 - 1

    print $ busca nums 6  -- False
    print $ busca nums 7  -- True

    print $ ocorrencias nums2 1  -- 2
    print $ ocorrencias nums2 3  -- 1
    print $ ocorrencias nums2 7  -- 0
