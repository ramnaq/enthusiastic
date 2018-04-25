module Notebook (writeContact, searchContact, showAll) where

import System.IO
import Contact

PATH = "notebook.db"
writeContact :: Record -> IO()
searchContact :: Int -> IO() -> Maybe Record
showAll :: String -> IO()

writeContact (id, name, age, gender, phone, email) = do
    let contact = (id, name, age, gender, phone, email)
    appendFile PATH ((show contact ++ "\n")

searchContact id = do
    handle <- openFile PATH ReadMode
	contactsList <- map read . lines . hGetContents handle
	contactsIds <- map getId . contactsList
	if (find (== id) contactsIds) != Nothing then
		$ find (== (_, id, _, _, _, _ ,_)) contactsList
	else
		Nothing
