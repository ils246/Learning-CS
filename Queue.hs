data Queue t = EmptyQ | NonEmptyQ t (Queue t) deriving (Show)

dequeue :: Queue t -> (t, Queue t)
dequeue EmptyQ = error "Jason is boo"
dequeue (NonEmptyQ a b ) = ( a, b )

{-enqueue :: Queue -> String -> Queue
enqueue EmptyQ a = NonEmptyQ a EmptyQ
enqueue NonEmptyQ a = 
-}

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

peek :: Queue t -> t
peek EmptyQ = error "This is empty"
peek (NonEmptyQ t x ) = t  
