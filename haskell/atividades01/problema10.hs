maxValue :: Int -> Int -> Int -> Int
maxValue a b c = max (max a b) c

main = do
	numAStr <- getLine
	numBStr <- getLine
	numCStr <- getLine
	let a = read numAStr :: Int
	let b = read numBStr :: Int
	let c = read numCStr :: Int
	print (maxValue a b c)
