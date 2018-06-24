data Arvore = Null | No Int Arvore Arvore

minhaArvore :: Arvore
minhaArvore = No 52 (No 31 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 64 Null Null))

-- nova
minhaArvore2 :: Arvore
minhaArvore2 = No 52 (No 31 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 64 (No 64 Null Null) Null))

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x 
    | (n == x) = True                           
    | otherwise = (buscaElemento esq x) || (buscaElemento dir x)

limiteSup :: Int
limiteSup = 1000 --Define um limite superior para o maior número

minimo :: Int -> Int -> Int
minimo x y | (x < y) = x
           | otherwise = y

minimoElemento :: Arvore -> Int
minimoElemento Null = limiteSup 
minimoElemento (No n esq dir) = 
    minimo n (minimo (minimoElemento esq) (minimoElemento dir))


{- NOVAS FUNÇÕES -}

-- A
ocorrenciasElemento :: Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) k
	| n == k = 1 + (ocorrenciasElemento esq k) + (ocorrenciasElemento dir k)
	| otherwise = ocorrenciasElemento esq k + ocorrenciasElemento dir k


-- B
maioresQueElemento :: Arvore -> Int -> Int
maioresQueElemento Null _ = 0
maioresQueElemento (No n esq dir) k
	| n > k = 1 + (maioresQueElemento esq k) + (maioresQueElemento dir k)
	| otherwise = (maioresQueElemento esq k) + (maioresQueElemento dir k)


-- C
subtraiParesImpares :: Arvore -> Int
subtraiParesImpares Null = 0
subtraiParesImpares a = somaImpares a - somaPares a

-- auxiliar de C
somaImpares :: Arvore -> Int
somaImpares Null = 0
somaImpares (No n esq dir)
	| n `mod` 2 == 1 = somaImpares esq + somaImpares dir
	| otherwise = n + somaImpares esq + somaImpares dir

-- auxiliar de C
somaPares :: Arvore -> Int
somaPares Null = 0
somaPares (No n esq dir)
	| (n `mod` 2 == 0) = somaPares esq + somaPares dir
	| otherwise = n + somaPares esq + somaPares dir


-- D
igual :: Arvore -> Arvore -> Bool
igual Null Null = True
igual Null _ = False
igual _ Null = False
igual (No n esq1 dir1) (No m esq2 dir2)
	| n /= m = False
	| otherwise = (igual esq1 esq2) && (igual dir1 dir2)


-- E
altura :: Arvore -> Int
altura Null = 0
altura (No n Null Null) = 0
altura (No n esq dir) = 1 + max (altura esq) (altura dir)


-- F
folhas :: Arvore -> Int
folhas Null = 0
folhas (No n Null Null) = 1
folhas (No n esq dir) = folhas esq + folhas dir


-- G
emOrdem :: Arvore -> [Int]
emOrdem Null = []
emOrdem (No n esq dir) = (emOrdem esq) ++ [n] ++ (emOrdem dir)

-- H
menoresQueElemento :: Arvore -> Int -> [Int]
menoresQueElemento Null _ = []
menoresQueElemento (No n esq dir) k
	| (n `mod` 2 == 0) && n < k =
			[n] ++ menoresQueElemento esq k ++ menoresQueElemento dir k
	| otherwise = menoresQueElemento esq k ++ menoresQueElemento dir k


main = do putStrLn (show (somaElementos minhaArvore))
          putStrLn (show (buscaElemento minhaArvore 30))
          putStrLn (show (buscaElemento minhaArvore 55))
          putStrLn (show (minimoElemento minhaArvore))

          putStrLn (show (ocorrenciasElemento minhaArvore 2))   -- 0
          putStrLn (show (maioresQueElemento minhaArvore 31))   -- 5
          putStrLn (show (subtraiParesImpares minhaArvore))     -- 63
          putStrLn (show (igual minhaArvore minhaArvore))       -- True
          putStrLn (show (igual minhaArvore minhaArvore2))      -- False
          putStrLn (show (altura minhaArvore2))                 -- 3
          putStrLn (show (folhas minhaArvore2))                 -- 4
          putStrLn (show (emOrdem minhaArvore2))                -- 4
          putStrLn (show (menoresQueElemento minhaArvore 55))  -- [52, 12]


