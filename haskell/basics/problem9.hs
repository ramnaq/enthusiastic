distante :: Float -> Float -> Float -> Float -> Float -> Float -> Float
distante x1 y1 z1 x2 y2 z2 =
	((x1 - x2)**2 +
	 (y1 - y2)**2 +
	 (z1 - z2)**2 )**(0.5)

main = do
	aStr <- getLine
	bStr <- getLine
	cStr <- getLine
	dStr <- getLine
	eStr <- getLine
	fStr <- getLine
	let a = read aStr :: Float
	let b = read bStr :: Float
	let c = read cStr :: Float
	let d = read dStr :: Float
	let e = read eStr :: Float
	let f = read fStr :: Float

	print (distante a b c d e f)
