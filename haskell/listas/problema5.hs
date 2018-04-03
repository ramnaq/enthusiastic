module Problema5 (busca) where

busca :: [Int] -> Int -> Bool
busca [] n = False
busca (head:tail) n
    | head == n = True
    | otherwise = busca tail n
