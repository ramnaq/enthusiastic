mcd :: Int -> Int -> Int
mcd a 0 = a
mcd 0 b = b
mcd a b =
	if a >= b then mcd (a-b) b
	else mcd a (b-a)

areCoprime :: Int -> Int -> String
areCoprime a b =
	if mcd a b == 1 then
		"Coprime"
	else
		"Not coprime"

eulersTotient :: Int -> Int
eulersTotient 0 = 0
eulersTotient n = do
	if areCoprime n (n-1) == "Coprime" then
		eulersTotient n-1 + 1
	else
		eulersTotient n-1

main = do
	nStr <- getLine
	let n = read nStr :: Int
	print (eulersTotient n)
