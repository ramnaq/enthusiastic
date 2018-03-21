mcd :: Int -> Int -> Int
mcd a 0 = a
mcd 0 b = b
mcd a b =
	if a >= b then mcd (a-b) b
	else mcd a (b-a)

leastCommonMultiple :: Int -> Int -> Int
leastCommonMultiple k 1 = k
leastCommonMultiple 1 k = k
leastCommonMultiple a b = (a*b) `div` (mcd a b)

main = do
	num1Str <- getLine
	num2Str <- getLine
	let a = read num1Str :: Int
	let b = read num2Str :: Int

	print(leastCommonMultiple a b)
