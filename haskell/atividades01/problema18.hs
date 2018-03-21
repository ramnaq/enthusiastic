operate :: Char -> Float -> Float -> Float
operate '+' x y = x + y
operate '-' x y = x - y
operate '*' x y = x * y
operate '/' x y = x / y

main = do
	num1 <- getLine
	num2 <- getLine
	op <- getChar
	let x = read num1 :: Float
	let y = read num2 :: Float

	print (operate op x y)
