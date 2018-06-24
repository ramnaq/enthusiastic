module Problema6 (ocorrencias) where

ocorrencias :: [Int] -> Int -> Int
ocorrencias [] n = 0
ocorrencias (head:tail) n
    | head == n = 1 + ocorrencias tail n
    | otherwise = ocorrencias tail n
