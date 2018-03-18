triangleArea :: Float -> Float -> Float
triangleArea base height = base * height / 2

main = do
	baseStr <- getLine
	heightStr <- getLine
	let base = read baseStr :: Float
	let height = read heightStr :: Float

	print (triangleArea base height)
