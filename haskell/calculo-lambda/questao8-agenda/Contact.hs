module Contact (Record, getId, getIOId, getName, getVisualForm) where

type Id = Int
type Name = String
type Age = Int
type Gender = Char
type Phone = String
type Email = String

type Record = (Id, Name, Age, Gender, Phone, Email)

getId :: Record -> Id
getId (id, _, _, _, _, _) = id

getIOId :: Record -> IO Id
getIOId c = return $ getId c

getName :: Record -> Name
getName (_, name, _, _, _, _) = name

getVisualForm :: Record -> String
getVisualForm (id, name, age, gender, phone, email) =
    "id: " ++ show id ++
    "\n" ++ "name: " ++ name ++
    "\n" ++ "age: " ++ show age ++
    "\n" ++ "gender:" ++ show gender ++
    "\n" ++ "phone number: " ++ phone ++
    "\n" ++ "email: " ++ email
