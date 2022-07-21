# Project Euler

# Problem 4

# A palindromic number reads the same both ways. The largest palindrome made from the product of two
# 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

library(tidyverse)

# We can assume that the largest palindrome will be a product of 9XX numbers

start <- proc.time()
palindrome <- function(x){
  x = x[x == stringi::stri_reverse(x)]
  return(x)
}

dat <- 900:999 %>%
  map(~{palindrome(.x * 900:999)}) %>%
  unlist() %>%
  max()

end <- proc.time()
print(end - start)




# End of File