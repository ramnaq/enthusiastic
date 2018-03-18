divide :: Int -> Int -> Bool
divide _ 0 = False
divide 0 _ = False
divide a b =
	if b `mod` a == 0 then
		True
	else
		False

main = do
	aStr <- getLine
	bStr <- getLine
	let a = read aStr :: Int
	let b = read bStr :: Int
	print (divide a b)
