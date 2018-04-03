module Problema2 (tamanho, media) where

import Problema1

tamanho :: [Int] -> Int
tamanho [] = 0
tamanho (_:tail) = 1 + tamanho tail

media :: [Int] -> Float
media [] = 0
media nums = fromIntegral (soma nums) / fromIntegral (tamanho nums)
