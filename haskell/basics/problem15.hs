mcd :: Int -> Int -> Int
mcd a 0 = a
mcd 0 b = b
mcd a b =
	if a >= b then mcd (a-b) b
	else mcd a (b-a)

eulersTotient :: Int -> Int -> Int
eulersTotient 1 _ = 1
eulersTotient _ 1 = 1
eulersTotient n i =
	if (mcd n i) == 1 then eulersTotient n (i-1) + 1
	else eulersTotient n (i-1)

main = do
	nStr <- getLine
	let n = read nStr :: Int
	print $ eulersTotient n (n-1)
