simple :: Float -> Float -> Int -> Float
simple amount _ 0 =
  amount
simple amount tax times =
  simple (amount + (amount * tax / 100)) tax (times - 1)
