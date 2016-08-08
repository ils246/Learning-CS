data PrimaryColor = Red | Green | Blue deriving (Show)

giveBirthColors :: PrimaryColor -> PrimaryColor -> CompositeColor
giveBirthColors Red Green = Yellow
giveBirthColors Green Red = Yellow
giveBirthColors Red Blue = Magenta
giveBirthColors Blue Red = Magenta
giveBirthColors Green Blue = Cyan 
giveBirthColors Blue Green = Cyan 

data CompositeColor = Yellow | Magenta | Cyan deriving (Show)
