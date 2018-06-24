mcd :: Int -> Int -> Int
mcd a 0 = a
mcd 0 b = b
mcd a b =
	if a >= b then mcd (a-b) b
	else mcd a (b-a)

mcdBetween3 :: Int -> Int -> Int -> Int
mcdBetween3 a b c =
	mcd (mcd a b) c

main = do
	aStr <- getLine
	bStr <- getLine
	cStr <- getLine
	let a = read aStr :: Int
	let b = read bStr :: Int
	let c = read cStr :: Int
	print (mcdBetween3 a b c)
