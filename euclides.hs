mdc :: Int -> Int -> Int
mdc x 0 =
  x
mdc x remainder =
  mdc remainder (x `rem` remainder)
