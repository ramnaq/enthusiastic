canBuildTriangle :: Int -> Int -> Int -> Bool
canBuildTriangle a b c =
	if a >= b && a >= c then
		b + c > a
	else if b >= a && b >= c then
		a + c > b
	else
		a + b > c

main = do
	n1 <- getLine
	n2 <- getLine
	n3 <- getLine
	let a = read n1 :: Int
	let b = read n2 :: Int
	let c = read n3 :: Int

	print (canBuildTriangle a b c)
