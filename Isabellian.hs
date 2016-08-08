

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

data PrimaryColor = Red | Green | Blue deriving (Show)

giveBirthColors :: PrimaryColor -> PrimaryColor -> CompositeColor
giveBirthColors Red Green = Yellow
giveBirthColors Green Red = Yellow
giveBirthColors Red Blue = Magenta
giveBirthColors Blue Red = Magenta
giveBirthColors Green Blue = Cyan 
giveBirthColors Blue Green = Cyan 

data CompositeColor = Yellow | Magenta | Cyan deriving (Show)

factorial :: Integer -> Integer

factorial 0 = 1
factorial 1 = 1 
factorial x = x * (factorial (x - 1))

{-
factorial 
1) take x and put it in a list 
2) subtract 1 from it and store that in the same list (until x = 1)
3) when x = stop
4) multiply all the numbers in the list 

x| 

-}

add2 :: Integer -> Integer -> Integer
add2 x 0 = x
add2 x y = 1 + (add2 x (y - 1))


{-

add2 3 5 = 1 + (add2 3 (5 - 1)) -- 8
add2 3 4 = 1 + (add2 3 (4 - 1)) -- 7
add2 3 3 = 1 + (add2 3 (3 - 1)) -- 6
add2 3 2 = 1 + (add2 3 (2 - 1)) -- 5
add2 3 1 = 1 + (add2 3 (1 - 1)) -- 4
add2 3 0 = 3

factorial 3 = 3 * (factorial 2)
factorial 2 = 2 * factorial 1
factorial 1 = 1

-}




length2 :: [a] -> Integer
length2 [] = 0 
length2 (h : x ) = 1 + length2 x



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



data Stack b = EmptyStack | NonEmptyStack b (Stack b) deriving (Show) 

push :: Stack b -> b -> Stack b
push stack c = NonEmptyStack c stack

peek :: Stack b -> b
peek EmptyStack = error "This thing is empty"
peek (NonEmptyStack a stack) = a  

pop :: Stack b -> (b, Stack b)
pop EmptyStack = error " You can't pop an EmptyStack, you dingus"
pop (NonEmptyStack a stack ) = (a , stack)

existIn :: (Eq b) => Stack b -> b -> Bool
existIn EmptyStack a = False 
existIn (NonEmptyStack a stack) x = if x == a then True else existIn (stack) x
--existIn (NonEmptyStack a stack) x = (x == a) || (existIn stack x)

{-
 existIn (NonEmptyStack a stack) x | x == a = True
 existIn (NonEmptyStack a stack) x          = existIn stack x
-}

length3 :: Stack b -> Integer
length3 EmptyStack          = 0
length3 (NonEmptyStack x t) = 1 + (length3 t)

data StackWithLength x = SSWithLength Integer (Stack x) deriving (Show) 

pushWL :: StackWithLength x -> x -> StackWithLength x
pushWL (SSWithLength a b) c = SSWithLength (a + 1) (push b c) 

peekWL :: StackWithLength x -> x
peekWL (SSWithLength a b) = peek b 

popWL :: StackWithLength x -> (x, StackWithLength x)
popWL (SSWithLength a b) = ( x , SSWithLength (a - 1) y )
  where
    (x, y) = pop b 

existInWL :: (Eq x) => StackWithLength x -> x -> Bool
existInWL (SSWithLength x y) a = existIn y a 

lengthWL :: StackWithLength x -> Integer
lengthWL (SSWithLength a b) = a 

type Radius = Float 
type Side = Float 
type Vertex = (Float, Float)

data Shape = Rectangle Side Side 
            | RtTriangle Side Side 
            | Ellipse Radius Radius 
            | Polygon [Vertex]
    deriving (Show)
 

myPi = 3.141592



area :: Shape -> Float 
area (Rectangle x y) = x * y 
area (RtTriangle x y)  = x * (y / 2 )
area (Ellipse x y) = x * y * myPi
area (Polygon xs) = error "Not yet defined"




--enqueue
--dequeue


data Queue t = EmptyQ | NonEmptyQ t (Queue t) deriving (Show)

dequeue :: Queue t -> (t, Queue t)
dequeue EmptyQ = error "Jason is boo"
dequeue (NonEmptyQ a b ) = ( a, b )

{-enqueue :: Queue -> String -> Queue
enqueue EmptyQ a = NonEmptyQ a EmptyQ
enqueue NonEmptyQ a = 
-}

--nQHelper :: Queue -> 

{-
finds the emptyQ within a nonEmptyQ
-}


reverseQ :: Queue t -> Queue t
reverseQ x =  reverseHelper x EmptyQ

reverseHelper:: Queue t -> Queue t -> Queue t 
reverseHelper EmptyQ ac = ac
reverseHelper (NonEmptyQ a b ) ac = reverseHelper b (NonEmptyQ a ac)

enqueue :: Queue t -> t -> Queue t
enqueue b x = reverseQ (NonEmptyQ x (reverseQ b))
--            reverseQ >>> (NonEmptyQ x) >>> reverseQ