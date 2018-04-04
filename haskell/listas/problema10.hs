module Problema10 (filtrar) where

filtrar :: (t -> Bool) -> [t] -> [t]
filtrar _ [] = []
filtrar f list
    | otherwise = [x | x <- list, f x]
