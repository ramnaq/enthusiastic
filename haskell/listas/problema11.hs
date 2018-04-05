module Problema11 (primeiros) where

primeiros :: Int -> [t] -> [t]
primeiros 0 _ = []
primeiros _ [] = []
primeiros n (head:tail) = [head] ++ primeiros (n-1) tail
