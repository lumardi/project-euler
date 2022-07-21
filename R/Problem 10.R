# Project Euler

# Problem 10
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.


# Via outside library

library(primes)

primes <- nth_prime(1:148933) %>%
  sum()

# Brute Force

is.prime <- Vectorize(
  function(x) {
    if(!identical(round(x), x)){
      check = F
    } 
    if(x == 1){
      check = F
    }
    if(x %in% c(2,3)){
      check = T
    } else {
      check = !any(x %% 2:(floor(sqrt(x))) == 0)
    }
    return(check)
  }
) 

primes <- c(2,3)
i <- 3
while(max(primes) < 20e6){
  if(is.prime(i) == T){
    primes = c(primes,i)
  } 
  i = i + 2
  print(i)
}

sum(primes)

# End of File