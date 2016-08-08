factorial :: Integer -> Integer

factorial 0 = 1
factorial 1 = 1 
factorial x = x * (factorial (x - 1))

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
