finalResult :: Float -> Float -> Float -> String
finalResult n1 n2 n3 =
	if (n1 + n2 + n3)/3 >= 6 then
		"Approved"
	else
		"Disapproved"

main = do
	n1 <- getLine
	n2 <- getLine
	n3 <- getLine
	let a = read n1 :: Float
	let b = read n2 :: Float
	let c = read n3 :: Float

	print (finalResult a b c)
