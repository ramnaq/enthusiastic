module Problema4 (diferencaMaiorMenor) where

import Problema3

maior :: [Int] -> Int
maior [] = 0
maior (head:tail)
    | head > maior tail = head
    | otherwise = maior tail

diferencaMaiorMenor :: [Int] -> Int
diferencaMaiorMenor nums = maior nums - menor nums
