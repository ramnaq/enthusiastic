mesmosElementos :: [Int] -> [Int] -> Bool
mesmosElementos [] [] = True
mesmosElementos _ [] = False
mesmosElementos [] _ = False
mesmosElementos (h1:t1) (h2:t2)
    | deletaElemento h1 (h2:t2) == (h2:t2) = False
    | otherwise = mesmosElementos (deletaElemento h1 (h1:t1)) (deletaElemento h1 (h2:t2))

deletaElemento :: Int -> [Int] -> [Int]
deletaElemento _ [] = []
deletaElemento n (head:tail)
    | n == head = deletaElemento n tail  -- elemento pode se repetir
    | otherwise = [head] ++ deletaElemento n tail

main = do
	print $ mesmosElementos [1..5] [5, 1, 4, 3, 2, 1]        -- True
	print $ mesmosElementos [5, 1, 4, 3, 2, 1] [1..5]        -- True
	print $ mesmosElementos [1, 2, 3, 4, 5] [5, 1, 4, 2, 1]  -- False
