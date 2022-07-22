# Project Euler

# Problem 23
# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
# the smallest number that can be written as the sum of two abundant numbers is 24.
# By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum
# of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though 
# it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less
# than this limit.
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.


library(tidyverse)



abundant <- function(n){
  if(n != 1){
    aux = subset(1:(n-1),  purrr::map_dbl(1:n, ~{n %% .x == 0})  == 1)
    aux = sum(aux, na.rm = T)
    aux = ifelse(aux > n, 1, 0)  
  } else{aux = 0}
  return(aux)
}

#abundant(28)
#abundant(12)
#abundant(1)

#note: we only need to account for the sum of TWO abundant numbers

abundant.sum <- function(n){
  aux = tibble(
    a = 1:(n-1),
    b = (n-1):1) %>%
    mutate(across(everything(), ~map(.x,abundant))) %>%
    filter(a == 1 & b == 1)
  
  aux = ifelse(nrow(aux) == 0, 0, 1)
  return(aux)
}

non.abundants <- subset(1:28123, map_dbl(1:28123, abundant.sum) == 0)

sum(non.abundants)




#End of File