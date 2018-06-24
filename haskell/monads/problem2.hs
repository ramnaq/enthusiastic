mydiv :: Float -> Float -> Maybe Float
mydiv n m
    | m == 0 = Nothing
    | otherwise = Just (n / m)

mymult :: Float -> Float -> Maybe Float
mymult n m = Just (n * m)

mysum :: Float -> Float -> Maybe Float
mysum n m = Just (n + m)

mysqrt :: Float -> Maybe Float
mysqrt n
    | n < 0 = Nothing
    | otherwise = Just (sqrt n)

data Expr = Val Float
        | Add Expr Expr | Sub Expr Expr | Mult Expr Expr | Div Expr Expr
        | Sqrt Expr

eval :: Expr -> Maybe Float
eval (Val n) = Just n
eval (Mult x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                                Nothing -> Nothing
                                Just m -> mymult n m
eval (Div x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                                Nothing -> Nothing
                                Just m -> (mydiv n m)
eval (Add x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                                Nothing -> Nothing
                                Just m -> (mysum n m)
eval (Sub x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                                Nothing -> Nothing
                                Just m -> (mysum n (- m))  -- n-m = n+(-m)
eval (Sqrt x) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> (mysqrt n)

evalmonad :: Expr -> Maybe Float
evalmonad (Val n) = return n
evalmonad (Mult x y) = evalmonad x >>=
                        (\n -> evalmonad y >>=
                            \m -> (mymult n m))
evalmonad (Div x y) = evalmonad x >>=
                        (\n -> evalmonad y >>=
                            \m -> (mydiv n m))
evalmonad (Add x y) = evalmonad x >>=
                        (\n -> evalmonad y >>=
                            \m -> (mysum n m))
evalmonad (Sub x y) = evalmonad x >>=
                        (\n -> evalmonad y >>=
                            \m -> (mysum n (- m)))  -- n-m = n+(-m)
evalmonad (Sqrt x) = evalmonad x >>= \n -> mysqrt n

evalfinal :: Expr -> Maybe Float
evalfinal (Val x) = return x
evalfinal (Mult x y) = do
    n <- evalfinal x
    m <- evalfinal y
    mymult n m
evalfinal (Div x y) = do
    n <- evalfinal x
    m <- evalfinal y
    mydiv n m
evalfinal (Add x y) = do
    n <- evalfinal x
    m <- evalfinal y
    mysum n m
evalfinal (Sub x y) = do
    n <- evalfinal x
    m <- evalfinal y
    mysum n (- m)  -- n-m = n+(-m)
evalfinal (Sqrt x) = do
    n <- evalfinal x
    mysqrt n

main = do
    print $ mysqrt (3)                   -- sqrt (3) = 1.73...
    print $ eval (Sqrt (Val 3))          -- sqrt (3) = 1.73...
    print $ evalmonad (Sqrt (Val 3))     -- sqrt (3) = 1.73...
    print $ evalfinal (Sqrt (Val 3))     -- sqrt (3) = 1.73...
    print $ evalfinal (Sqrt (Val (-1)))  -- sqrt (-1) = Nothing
