data Isabellian = Yes | No  deriving (Eq, Show)

invert2 :: Isabellian -> Isabellian
invert2 Yes = No 
invert2 No = Yes 

and2 :: Isabellian -> Isabellian -> Isabellian
and2 Yes Yes = Yes 
and2 _ _  = No 

or2 :: Isabellian -> Isabellian -> Isabellian
or2 No No = No 
or2 _ _ = Yes 
