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
