accesses :: [Int]
accesses = [15, 5, 7, 18, 7, 0, 5]

count_accesses :: [Int] -> Int
count_accesses = foldl (+) 0

