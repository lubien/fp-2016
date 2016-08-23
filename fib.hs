fib :: Int -> Int
fib n = last $ fib_list n

fib_sum :: Int -> Int
fib_sum n = foldl (+) 0 (fib_list n)

fib_list :: Int -> [Int]
fib_list 0 = [1]
fib_list 1 = [1, 1]
fib_list n = fib_list' n [1, 1]

fib_list' 1 acc = reverse acc
fib_list' n (x:y:xs) = fib_list' (n - 1) (x + y : x : y : xs)

