pow :: Float -> Float -> Float
pow x y = x ** y

main = do
	xStr <- getLine
	yStr <- getLine
	let x = read xStr :: Float
	let y = read yStr :: Float

	print (pow x y)

