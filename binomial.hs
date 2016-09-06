binomial :: (Int, Int) -> Int
binomial (n, k)
  | k == 0 = 1
  | k == n = 1
  | n > k = binomial (n - 1, k - 1) + binomial (n - 1, k)
  | otherwise = error "n deve ser maior do que k"
