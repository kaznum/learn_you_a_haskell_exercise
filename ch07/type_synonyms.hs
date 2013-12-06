import Data.Map
--- Making Our Phonebook Prettier

phoneBook :: [(String, String)]
phoneBook = [("betty", "555-2938")
            ,("bonnie", "452-2928")
            ,("patsy", "493-2928")
            ,("lucille", "205-2928")
            ,("wendy", "939-8282")
            ,("penny", "853-2492")]

-- type PhoneBook = [(String, String)]
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

--- Parameterizing Type Synonyms
type AssocList k v = [(k, v)]

type IntMap v = Map Int v
type IntMap' = Map Int

-- [(1,2), (3,5),(8,9)] :: AssocList Int Int

--- Go Left, Then Right

-- to be continued