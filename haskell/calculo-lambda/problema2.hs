aprovado :: Float -> Float -> Float -> Bool
aprovado = (\x y z -> (x+y+z)/3 >= 6)

main = do
	print $ aprovado 3 7 7
	print $ aprovado 5 7 7
