mcd :: Int -> Int -> Int
mcd a 0 = a
mcd 0 b = b
mcd a b =
	if a >= b then mcd (a-b) b
	else mcd a (b-a)

main = do
	aStr <- getLine
	bStr <- getLine
	let a = read aStr :: Int
	let b = read bStr :: Int
	print (mcd a b)
