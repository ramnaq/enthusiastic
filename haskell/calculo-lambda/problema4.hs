bhaskara :: Float -> Float -> Float -> (Float, Float)
bhaskara = (\a b c -> if delta a b c < 0 then error "Delta < 0"
	else ((-b + (delta a b c)**0.5)/(2*a), (-b - (delta a b c)**0.5)/(2*a)))

delta :: Float -> Float -> Float -> Float
delta = (\a b c -> (b^2 - 4*a*c))

main = do
	print $ bhaskara 2 5 2
