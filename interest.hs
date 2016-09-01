compound :: Float -> Float -> Int -> Float
compound amount _ 0 =
  amount
compound amount tax times =
  compound (amount + (amount * tax / 100)) tax (times - 1)
