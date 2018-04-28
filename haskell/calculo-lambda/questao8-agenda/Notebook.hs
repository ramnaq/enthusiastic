module Notebook (saveContact, searchContact, getContactWithId, showAll) where

import System.IO
import Data.List
import Contact


-- declarations

_path = "notebook.db"
saveContact :: Record -> IO ()
searchContact :: Int -> IO (Maybe Record)
getContactWithId :: Int -> [Record] -> Maybe Record
showAll :: [Record] -> IO ()


--implementations

saveContact (id, name, age, gender, phone, email) = do
    let contact = (id, name, age, gender, phone, email)
    appendFile _path (show contact ++ "\n")

searchContact id = do
    handle <- openFile _path ReadMode
    contactsList <- map read <$> lines <$> hGetContents handle :: IO [Record]
    contactsIds <- mapM getIOId contactsList
    if (find (== id) contactsIds) /= Nothing then
        return $ getContactWithId id contactsList
    else
        return Nothing

getContactWithId id contactsList
    | contactsList == [] = Nothing
    | otherwise =
        if (getId (head contactsList) == id) then
            Just (head contactsList)
        else
            getContactWithId id (tail contactsList)

showAll (x:s) = do
    if s == [] then
        print $ Contact.getVisualForm x
    else do
        print $ Contact.getVisualForm x ++ "\n"
        showAll s
