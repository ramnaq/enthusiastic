module Problema9 (mapear) where

mapear :: (t -> y) -> [t] -> [y]
mapear _ [] = []
mapear f (head:tail)
    | length tail == 0 = [f head]
    | otherwise = [f head] ++ mapear f tail
