--Hash Tables 

import Data.Array(array, Array, (!), (//))
import Data.Char (toLower, ord, isAlphaNum)
import Data.Text (pack, unpack, strip)
import Data.List (delete)

x = array (1, 26) (fmap (\x -> (x, [])) [1..26])


stringToIndex :: String -> Integer
stringToIndex "" = error "Empty String"
stringToIndex x = if b then a else error "String starts with Special Character"
  where a = toInteger((ord(toLower c )) - 96)
        b = isAlphaNum c
        c = head (unpack (strip (pack x)))
        -- c = head $ unpack $ strip $ pack x

    
add :: String -> Set -> Set 
add str (Set x) = if a == True then (Set x) else newSet 
    where 
        a = exists str (Set x)
        (ind,oldList) = indexAndItem str x 
        newList = str : oldList
        newSet = Set (x // [(ind, newList)])


remove :: String-> Set -> Set
remove str (Set arr) = if a == False then (Set arr) else newSet
   where 
       a = exists str (Set arr)
       (ind, listOfStrings) = indexAndItem str arr
       newList = delete str listOfStrings
       newSet = Set (arr // [(ind, newList)])
 

exists :: String -> Set -> Bool 
exists str (Set arr) =  existIn listOfStrings str
  where 
   (ind,listOfStrings) = indexAndItem str arr 
   existIn:: [String] -> String -> Bool
   existIn [] myvar = False
   existIn mylist myvar = if head mylist == myvar then True else existIn (tail mylist) myvar


data Set = Set (Array Integer [String]) deriving (Show)


indexAndItem :: String -> Array Integer [String] -> (Integer, [String])
indexAndItem str arr = (ind, list)
  where 
    ind = stringToIndex str 
    list = arr ! ind 

