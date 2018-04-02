module Media (size, media) where

import Soma

size :: [Int] -> Int
size [] = 0
size (head:tail) = 1 + size tail

media :: [Int] -> Float
media [] = 0
media nums = fromIntegral (soma nums) / fromIntegral (size nums)
