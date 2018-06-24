bhaskara :: Float -> Float -> Float -> (Float, Float)
bhaskara a b c =
		((-b + ((b^2 - 4*a*c))**(0.5))/(2*a),
		 (-b - ((b^2 - 4*a*c))**(0.5))/(2*a))

main = do
	coef1 <- getLine
	coef2 <- getLine
	coef3 <- getLine
	let a = read coef1 :: Float
	let b = read coef2 :: Float
	let c = read coef3 :: Float

	print (bhaskara a b c)
