module Contact (Record, getId, getName, getVisualForm) where

                    -- id, name, age, sex, phone number, email
type Id = Int
type Name = String
type Age = Int
type Sex = Char
type Phone = String
type Email = String

data Record r = Person Id Name Age Sex Phone Email

getId :: Record r -> Id
getId (Person _ _ age _ _ _) = age

getName :: Record r -> Name
getName (Person _ name _ _ _ _) = name

getVisualForm :: Record r -> String
getVisualForm (Person id name age sex phone email) =
    "id: " ++ show id ++
    "\nname: " ++ name ++
    "\nage: " ++ show age ++
    "\nsex:" ++ show sex ++
    "\nphone number: " ++ phone ++
    "\nemail: " ++ email ++ "\n"
