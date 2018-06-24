module Problema1 (soma) where

soma :: [Int] -> Int
soma [] = 0
soma (head:tail) = head + soma tail

