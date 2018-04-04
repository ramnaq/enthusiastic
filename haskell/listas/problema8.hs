module Problema8 (inverte) where

inverte :: [t] -> [t]
inverte [] = []
inverte (head:tail)
    | length tail == 0 = [head]
    | otherwise = inverte tail ++ [head]
