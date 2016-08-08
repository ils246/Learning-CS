data NumList = EmptyList | NonEmpty Integer NumList deriving (Show)

addList :: NumList  -> Integer
addList  EmptyList = 0 
addList (NonEmpty x y)  =  x + (addList y)


data AnyList value = AEmptyList | ANonEmpty value (AnyList value) deriving (Show)

prepend :: a -> AnyList a -> AnyList a
prepend x xs = ANonEmpty x xs

addAList :: AnyList Integer -> Integer
addAList  AEmptyList = 0 
addAList (ANonEmpty x y)  =  x + (addAList y)
