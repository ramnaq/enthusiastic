fib :: Int -> Int
fib = (\k -> if k == 1 then 1 else if k == 0 then 0 else fib (k-1) + fib (k-2))

main = do print $ fib 8
