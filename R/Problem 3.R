# Project Euler

# Problem 3

#The prime factors of 13195 are 5, 7, 13 and 29.

#What is the largest prime factor of the number 600851475143 ?
  

# With outside help from library

library(gmp)
library(tidyverse)

dat <- max(factorize(600851475143))


# Without outside help from library

# We can guess whether a natural number is not prime if any x %% 2:sqrt(x) == 0 (x>3)

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

# We also know that the divider cannot be larger than sqrt(600851475143)

dat <- 1:floor(sqrt(600851475143)) %>%
  subset(., is.prime(.)) %>%
  subset(., 600851475143 %% . == 0) %>%
  max()



# End of File