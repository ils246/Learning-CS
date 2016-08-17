--Hash Tables 

import Data.Array(array)
import Data.Char (toLower, ord, isAlphaNum)
import Data.Text (pack, unpack, strip)

--strip

{-

  1. Empty string
  2. Special characters
  3. Leading/trailing whitespace

-}

x = array (1, 26) (fmap (\x -> (x, [])) [1..26])

{-

stringToIndex :: String -> Int
stringToIndex "" = error "Empty String"
stringToIndex x = (ord(Data.Char.toLower(Prelude.head x))) - 96 

    
-}

{-
stringToIndex :: Text -> Int
stringToIndex x | isAlphaNum(Prelude.head (x)) = (ord(Data.Char.toLower(Prelude.head(unpack(strip(x)))))) - 96 
stringToIndex x = error "The string is empty or starts with non alphanumeric characters"

-}


stringToIndex :: String -> Int
stringToIndex "" = error "Empty String"
stringToIndex x = if b then a else error "String starts with Special Character"
  where a = (ord(toLower c )) - 96
        b = isAlphaNum c
        c = head (unpack (strip (pack x)))
        -- c = head $ unpack $ strip $ pack x

    
