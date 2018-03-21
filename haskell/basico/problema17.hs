intSqrt :: Int -> Int
intSqrt 0 = 0
intSqrt 1 = 1
intSqrt n = head $ dropWhile (\x -> x*x > n) $ iterate (\x -> (x + n `div` x) `div` 2) (n `div` 2)

isPrime :: Int -> Bool
isPrime k = null [ x | x <- [2..intSqrt k], k `mod` x == 0]

main = do
	numStr <- getLine
	let k = read numStr :: Int
	print (isPrime k)
