module Problema13 (apagarEnquanto) where

apagarEnquanto :: (t -> Bool) -> [t] -> [t]
apagarEnquanto _ [] = []
apagarEnquanto f (head:tail) =
    if f head then apagarEnquanto f tail
    else (head:tail)
