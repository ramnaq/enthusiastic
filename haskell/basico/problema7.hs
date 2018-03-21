fib_n :: Int -> Int
fib_n 0 = 0
fib_n 1 = 1
fib_n n = fib_n (n-1) + fib_n (n-2)

main = do
	nStr <- getLine
	let n = read nStr :: Int
	print (fib_n n)
