fib :: Int -> Int
fib n = last $ fib_list n

fib' 0 = 1
fib' 1 = 1
fib' n = fib(n - 1) + fib(n - 2)

fib'' n
  | n == 0 = 1
  | n == 1 = 1
  | n > 1 = fib''(n - 1) + fib''(n - 2)

fib_sum :: Int -> Int
fib_sum n = foldl (+) 0 (fib_list n)

fib_list :: Int -> [Int]
fib_list 0 = [1]
fib_list 1 = [1, 1]
fib_list n = fib_list' n [1, 1]

fib_list' 1 acc = reverse acc
fib_list' n (x:y:xs) = fib_list' (n - 1) (x + y : x : y : xs)

