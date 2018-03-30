module Arvore (Arvore (Null, No),
			   minhaArvore,
			   somaElementos,
			   buscaElemento,
			   limiteSup,
			   minimoElemento,
			   ocorrenciasElemento,
			   maioresQueElemento,
			   ordem,
			   mediaElementos,
			   elementos) where

data Arvore = Null | No Int Arvore Arvore
	deriving (Eq)

minhaArvore :: Arvore
minhaArvore = No 52 (No 32 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 64 Null Null))

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x 
    | (n == x) = True                           
	| otherwise = (buscaElemento esq x) || (buscaElemento dir x)

limiteSup :: Int
limiteSup = 1000  --Define um limite superior para o maior número
		
minimo :: Int -> Int -> Int
minimo x y | (x < y) = x
           | otherwise = y

minimoElemento :: Arvore -> Int
minimoElemento Null = limiteSup 
minimoElemento (No n esq dir) = 
	minimo n (minimo (minimoElemento esq) (minimoElemento dir))


{- funções acrescentadas -}

ocorrenciasElemento :: Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) x =
	if n == x then
		ocorrenciasElemento esq x + ocorrenciasElemento dir x + 1
	else
		ocorrenciasElemento esq x + ocorrenciasElemento dir x


maioresQueElemento :: Arvore -> Int -> Int
maioresQueElemento Null _ = 0
maioresQueElemento (No n esq dir) x =
	if n > x then
		maioresQueElemento esq x + maioresQueElemento dir x + 1
	else
		maioresQueElemento esq x + maioresQueElemento dir x


ordem :: Arvore -> Int
ordem Null = 0
ordem (No n esq dir) =
	1 + ordem esq + ordem dir


mediaElementos :: Arvore -> Float
mediaElementos Null = 0
mediaElementos (No n esq dir) =
	fromIntegral (somaElementos (No n esq dir)) / fromIntegral (ordem (No n esq dir))


elementos :: Arvore -> [Int]
elementos Null = []
elementos (No n esq dir) =
	[n] ++ elementos esq ++ elementos dir
