# Project Euler

# Problem 28
#Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#It can be verified that the sum of the numbers on the diagonals is 101.
#What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
  
library(tidyverse)

# To deal with this problem we should notice that the proposed matrix is an Ulam Spiral (https://en.wikipedia.org/wiki/Ulam_spiral)
# Lines of the Ulam Spiral correspond to the form: f(n) = 4*n_i^2 + b*n_i + c, 
# where size of the diagonal vector 
# For diagonals we have, c = 1, b = {-2,0,2,4}
# Resolving for n we have that sum = 4*(4*n^2) + 4*(1)

m <- 1001
n <- ceiling((m-1)/2)
c <- 1
b <- c(-2,0,2,4)
dat <- 0

for(i in 1:n){
  aux <- sum(4*i^2 + b*i + c)
  dat <- sum(dat + aux)
}

diag.sum <- 1 + dat

size <- 7 # Size of matrix
answer <- 1 # Starting number

## Define corners of subsequent matrices
for (n in seq(from = 3, to = size, by = 2)) {
  corners <- seq(from = n * (n - 3) + 3, by = n - 1, length.out = 4)
  answer <- answer + sum(corners)
}
print(answer)

# End of File