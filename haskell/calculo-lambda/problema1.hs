xor :: Bool -> Bool -> Bool
xor = (\a b -> if a then not(b) else b)

main = do
	print $ xor True False
	print $ xor False False
	print $ xor True True
