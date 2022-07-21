# Project Euler

# Problem 27
# Euler discovered the remarkable quadratic formula: n^2 + n + 41
# It turns out that the formula will produce 40 primes for the consecutive integer values 0 <= n <= 39.
# However, when n = 40, it is divisible by 31, and certainly when n = 41, it clearly is divisible by 41.
# The incredible formula n^ -79n + 1601 was discovered, which produces 80 primes for the consecutive values 0 <= n <= 79. The product of the coefficients, −79 and 1601, is −126479.
# Considering quadratics of the form: n^2 + an + b, where |a| < 1000 and |b| <= 1000
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum 
# number of primes for consecutive values of n, starting with n=0.


library(tidyverse)
library(gmp)

n <- 1:1000

a <- seq(-999,999,by=2)  # a necessarily will be odd

b <- -1000:1000 %>% # |b| necessarily will be prime
  subset(gmp::isprime(abs(.)) == 2)


primes <- tibble(
  xa = rep(rep(a, each = length(b)), times = length(n)),
  xb = rep(rep(b, times = length(a)), times = length(n)),
  xn = rep(n, each = length(a)*length(b))) %>%
  filter(gmp::isprime(xn^2 + xa*n + xb) == 2) %>%
  group_by(xa,xb) %>%
  summarise(n = n()) %>%
  filter(n == max(n))


primes$xa*primes$xb



# End of File