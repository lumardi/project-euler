# Project Euler

# Problem 9
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52. There exists exactly one Pythagorean triplet for which
# a + b + c = 1000. Find the product abc.

library(tidyverse)

# Definition of Pythagorean Triplet:
## a < b < c, all natural numbers
## c^2 = a^2 + b^2

# Euclid's Formula:
## a = m^2 - n^2
## b = 2*m*n
## c = m^2 + n^2

# We are given: 
## a + b + c = 1000

# Simplifying:
## (m^2 - n^2) + (2*m*n) + (m^2 + n^2) = 1000
## 2*m^2 + 2*m*n = 1000
## m^2 + m*n = 500
## m(m + n) = 500
## n = - m + (500/m)
##
## We can guess that 500 %% m == 0 & 500 %% (m+n) == 0  (note a)
## Also, 250 < m^2 < 500 // sqrt(250) < m < sqrt(500)   (note b)

m <- ceiling(sqrt(250)):floor(sqrt(500)) %>% # note a
  subset(500 %% . == 0)                      # note b

n <- - m + (500/m)

a <- m^2 - n^2
b <- 2*m*n
c <- m^2 + n^2

a*b*c


# End of File