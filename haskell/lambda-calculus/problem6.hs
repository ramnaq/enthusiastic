maior :: Float -> Float -> Float -> Float
maior = (\x y z -> max (max x y) z)

main = do print $ maior 5 57 44
