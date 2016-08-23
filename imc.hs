imc :: Float -> Float -> Float
imc height weight = height / (weight**2)

imc_show :: Float -> String
imc_show imc
  | imc < 25 = "Raquítico"
  | imc < 28 = "Normal"
  | imc < 30 = "Subpeso"
  | imc < 35 = "Pré-obeso"
  | imc >= 35 = "Obeso"

