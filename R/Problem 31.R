# Project Euler

# Problem 31
# In the United Kingdom the currency is made up of pound (£) and pence (p). There are eight coins in general circulation:
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
# It is possible to make £2 in the following way:
# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?
  

coins <- c(1, 2, 5, 10, 20, 50, 100, 200)

change <- function(coins, totalmoney, ncoins){
  if(ncoins == 1){
    aux = 1
  } else{
    aux = 0
    for(n in 1:ncoins){
     remainder = totalmoney - coins[n] 
     if(remainder == 0){
       aux = aux + 1
     }
     if(remainder > 0){
       aux = aux + change(coins,remainder,n)
     }
    }
  }
  return(aux)
}

change(coins = coins, totalmoney = 200, ncoins = length(coins))




#End of File