formaTriangulo :: (Float, Float) -> (Float, Float) -> (Float, Float) -> Maybe Float
formaTriangulo (a1, a2) (b1, b2) (c1, c2) = do
    if ((a1*b2) + (a2*c1) + (b1*c2) - (b2*c1) - (a2*b1) - (c2*a1)) == 0 then
        Nothing
    else do
        let a = sqrt ((b1-a1)**2 + (b2-a2)**2)
        let b = sqrt ((b1-c1)**2 + (b2-c2)**2)
        let c = sqrt ((a1-c1)**2 + (a2-c2)**2)
        if (max (max a b) c == a) &&  (a >= b + c)
            && (max (max a b) c == b) && (b >= a + c)
            && (max (max a b) c == c) && (c >= a + b)
            then
                Nothing
        else do
            let p = (a+b+c)/2
            Just $ sqrt $ p * (p-a) * (p-b) * (p-c)
    
main = do
    putStrLn $ show $ formaTriangulo (1, 1) (2, 2) (3, 1)
