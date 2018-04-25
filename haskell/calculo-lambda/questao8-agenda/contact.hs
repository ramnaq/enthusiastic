module Contact (Record, getId, getName, getVisualForm) where

                    -- id, name, age, sex, phone number, email
type Id = Int
type Name = String
type Age = Int
type Gender = Char
type Phone = String
type Email = String

type Record = (Id, Name, Age, Gender, Phone, Email)

getId :: Record -> Id
getId (Person _ _ age _ _ _) = age

getName :: Record -> Name
getName (Person _ name _ _ _ _) = name

getVisualForm :: Record -> String
getVisualForm (Person id name age sex phone email) =
    "id: " ++ show id ++
    "\nname: " ++ name ++
    "\nage: " ++ show age ++
    "\ngender:" ++ show Gender ++
    "\nphone number: " ++ phone ++
    "\nemail: " ++ email ++ "\n"
