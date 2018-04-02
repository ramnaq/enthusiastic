module Main (main) where

import Soma
import Media

main = do
    let nums = [1, 2, 3, 4]
    print $ soma nums
    print $ media nums
