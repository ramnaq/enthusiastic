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

	isPrime n = null [ k | k <- [2..n-1], n `mod` k == 0]

	mcd n m
		| n == 0 = m
		| m == 0 = n
		| n >= m = mcd (n-m) m
		| otherwise = mcd n (m-n)

	(===) n m
		| n - m <= 1 = True
		| otherwise = False

	major n m
		| n > m = n
		| otherwise = m
	
	(***) n m = n*n * m


instance MeuInt Integer
instance MeuInt Int

main = do
	print $ bigger (4::Integer) (12::Integer)
	print $ smaller (4::Integer) (12::Integer)

	print $ isPair (9::Integer)               -- False
	print $ isOdd (17::Integer)                -- True
	print $ isPrime (9::Integer)              -- False
	print $ isPrime (13::Integer)             -- True
	print $ mcd (45::Integer) (9::Integer)    -- 9
	print $ (===) (8::Integer) (9::Integer)   -- True
	print $ (===) (7::Integer) (9::Integer)   -- False
	print $ major (45::Integer) (9::Integer)  -- 45
	print $ (***) (2::Integer) (3::Integer)   -- 12
