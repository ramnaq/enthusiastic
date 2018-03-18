xor :: Bool -> Bool -> Bool
xor a b =
	if (a == True) then not b
	else b

main = do
	aStr <- getLine
	bStr <- getLine
	let a = read aStr :: Bool
	let b = read bStr :: Bool

	print (xor a b)
