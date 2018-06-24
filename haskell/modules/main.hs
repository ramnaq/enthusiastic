module Main (main) where

import Formas
import Arvore
import Pilha
import Fila

main = do
    print $ area $ Retangulo 5 2
    print $ area $ Circulo 5
    print $ area $ Trapezio 10 5 2

    -- uso da árvore
    print $ somaElementos minhaArvore
    print $ buscaElemento minhaArvore 30
    print $ minimoElemento minhaArvore
    print $ ocorrenciasElemento minhaArvore 56
    print $ mediaElementos minhaArvore
    print $ elementos minhaArvore

    -- uso da pilha
    putStrLn (show (push (push emptyStack 1) 2))
    putStrLn (show (top (Stack [1,2,3,4,5])))
    putStrLn (show (pop (Stack [1,2,3,4,5])))

    -- uso da fila
    print $ enqueue (enqueue emptyQueue 1) 2
    print $ dequeue $ Queue [1..5]
    print $ first $ Queue [1..5]

