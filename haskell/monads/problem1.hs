mydiv :: Float -> Float -> Maybe Float
mydiv n m
    | m == 0 = Nothing
    | otherwise = Just (n / m)

mymult :: Float -> Float -> Maybe Float
mymult n m = Just (n * m)

mysum :: Float -> Float -> Maybe Float
mysum n m = Just (n + m)

data Expr = Val Float | Add Expr Expr | Sub Expr Expr | Mult Expr Expr | Div Expr Expr

eval :: Expr -> Maybe Float
eval (Val n) = Just n
eval (Mult x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                                Nothing -> Nothing
                                Just m -> (mymult n m)
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

main = do
    {-
    print $ mydiv 5 0
    print $ eval (Div (Val 3) (Val 0))
    print $ eval (Div (Val 3) (Val 2))
    print $ evalmonad (Div (Val 3) (Val 0))
    print $ evalmonad (Div (Val 3) (Val 2))
    print $ evalfinal (Div (Val 3) (Val 0))
    print $ evalfinal (Div (Val 3) (Val 2))
    -}
    print $ evalfinal $ Add (Add (Val 1) (Val 1)) (Val 1)  -- 1 + 1 + 1 = 3
    print $ evalfinal $ Add (Val 3) (Val 0)  -- 3 + 0 = 3
    print $ evalfinal $ Mult (Mult (Val 2) (Val 2)) (Mult (Val 2) (Val 2))  -- 2*2*2*2 = 16
