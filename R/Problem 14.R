# Project Euler

# Problem 14
# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
#   13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.


collatz.chain <- function(n) {
  aux <- 0
  while (n != 1) {
    if (n %% 2 == 0) {
      n = n/2
      aux = aux + 1
    }
    else {
      n = 3*n + 1
      aux = aux + 1
    }
  }
  aux
}


max.collatz.chain <- list(
  n = c(),
  chain = c()
)

for(i in 1:1e6){
  max.collatz.chain$n[[i]] = i
  max.collatz.chain$chain[[i]] = collatz.chain(i)
  print(i)
}


max.collatz.chain$n[as.numeric(which.max(max.collatz.chain$chain))]



#End of File