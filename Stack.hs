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
