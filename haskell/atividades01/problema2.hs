absoluteValue :: Int -> Int
absoluteValue x = if x >= 0 then
			x
		else
			x - 2*x
main = do
	xStr <- getLine
	let x = (read xStr :: Int)
	print (absoluteValue x)
