import Notebook
import Contact
import Data.Maybe

main = do
    contact0Str <- searchContact 0
    contact1Str <- searchContact 1
    putStrLn $ getVisualForm (fromJust contact1Str)
    putStrLn $ getVisualForm (fromJust contact0Str)
