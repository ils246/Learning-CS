--Hash Tables 

import Data.Array(array)
import Data.Char (toLower, ord, isAlphaNum)
import Data.Text (pack, unpack, strip)

x = array (1, 26) (fmap (\x -> (x, [])) [1..26])


stringToIndex :: String -> Int
stringToIndex "" = error "Empty String"
stringToIndex x = if b then a else error "String starts with Special Character"
  where a = (ord(toLower c )) - 96
        b = isAlphaNum c
        c = head (unpack (strip (pack x)))
        -- c = head $ unpack $ strip $ pack x

    
