module Problema3 (menor) where

menor :: [Int] -> Int
menor [] = 0
menor (head:tail)
    | tail == [] = head
    | head < menor tail = head
    | otherwise = menor tail
