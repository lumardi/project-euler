# Project Euler

# Problem 30

#Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
  
#  1634 = 14 + 64 + 34 + 44
#  8208 = 84 + 24 + 04 + 84
#  9474 = 94 + 44 + 74 + 44
#  As 1 = 14 is not a sum it is not included.
#  The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#  Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
  
library(tidyverse)

# We can guess the floor and ceiling of our search range, given the parameters
# it will necessarily fall in the range of 2^5 + 2^5 + 2^5 + 2^5 + 2^5 to 9^5 + 9^5 + 9^5 + 9^5 + 9^5
# (1^5 is not included since it's not a sum)
# ie, 5 to 295245, so our numbers will most likely be 6 digit numbers

# We can also find the digit sum of any number in base 10 (https://en.wikipedia.org/wiki/Digit_sum)

n <- 5
floor <- n*2^n
ceiling <- n*9^n
dat <- c()

for(i in floor:ceiling){
  x <- 0:log10(i)
  aux <- sum(((1/10^x) * (i %% 10^(x + 1) - i %% 10^x))^n)
  
  if(i == aux){
    dat <- c(dat,aux)
  }
}

sum(dat)


# End of File