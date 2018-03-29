class (Integral x) => MeuInt x where
	bigger :: x -> x -> x
	smaller :: x -> x -> x

	{- new methods -}
	isPair :: x -> Bool
	isOdd :: x -> Bool
	isPrime :: x -> Bool
	mcd :: x -> x -> x
	(===) :: x -> x -> Bool

	{- my methods -}
	--myIntSqrt :: x -> x
	major :: x -> x -> x
	(***) :: x -> x -> x


	{- implementations -}

	bigger n m
		| n > m = n
		| otherwise = m

	smaller n m
		| (n == bigger n m) = m
		| otherwise = n

	isPair n
		| n `mod` 2 == 0 = True
		| otherwise = False

	isOdd n
		| isPair n = False
		| otherwise = True

	isPrime n = null [ k | k <- [2..n], n `mod` k == 0]

	mcd n m
		| n == 0 = m
		| m == 0 = n
		| n >= m = mcd (n-m) m
		| otherwise = mcd n (m-n)

	(===) n m
		| n - m <= 1 = True
		| otherwise = False

	{-
	myIntSqrt n
		| 0 = 0
		| 1 = 1
		| otherwise = head $ dropWhile (\x -> x*x > n) $ iterate (\x -> (x + n `div` x) `div` 2) (n `div` 2)
	-}

	major n m
		| n > m = n
		| otherwise = m
	
	(***) n m = n*n * m

instance MeuInt Integer
instance MeuInt Int

main = do
	print "bla"
