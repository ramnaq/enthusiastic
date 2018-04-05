module Problema12 (apagar) where

apagar :: Int -> [t] -> [t]
apagar 0 list = list
apagar _ [] = []
apagar n (head:tail) = apagar (n-1) tail
    
