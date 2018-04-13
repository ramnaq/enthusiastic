paridadeElementos :: [Int] -> [Bool]
paridadeElementos nums = map (\n -> n `mod` 2 == 0) nums

main = do
	print $ paridadeElementos [0, 1, 2, 3, 4, 4, 5]
