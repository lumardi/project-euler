# Project Euler

# Problem 16
#2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#What is the sum of the digits of the number 21000?

library(tidyverse)
library(gmp)

dat <- gmp::pow.bigz(2,1000) %>%
  as.character() %>%
  strsplit("") %>%
  unlist() %>%
  as.numeric() %>%
  sum()


# End of File