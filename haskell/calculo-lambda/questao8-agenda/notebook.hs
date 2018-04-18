module Notebook (writeContact, searchContact, showAll) where

import Contact

writeContact :: Record r -> String
searchContact :: Record r -> String -> Bool
showAll :: String -> IO()

writeContact record file = do
    h <- openFile file WriteMode
    
