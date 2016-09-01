mdc :: Int -> Int -> Int
mdc x 0 =
  x
mdc x y =
  mdc y (x `rem` y)
