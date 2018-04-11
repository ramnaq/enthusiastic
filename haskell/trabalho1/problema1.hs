mesmosElementos :: [Int] -> [Int] -> Bool
mesmosElementos [] [] = True
mesmosElementos _ [] = False
mesmosElementos [] _ = False
mesmosElementos (head1:tail1) l2
	| deletaElemento head1 l2 == l2 = False
	| otherwise = mesmosElementos tail1 (deletaElemento head1 l2)

deletaElemento :: Int -> [Int] -> [Int]
deletaElemento _ [] = []
deletaElemento n (head:tail)
	| n == head = deletaElemento n tail  -- elemento pode se repetir
	| otherwise = [head] ++ deletaElemento n tail

main = do
	print $ mesmosElementos [1..5] [5, 1, 4, 3, 2, 1]        -- True
	print $ mesmosElementos [1, 2, 3, 4, 5] [5, 1, 4, 2, 1]  -- False
