# Project Euler

# Problem 100
#If a box contains twenty-one coloured discs, composed of fifteen blue discs and six red discs, and two discs were taken at random, it can be seen that the probability of taking two blue discs, P(BB) = (15/21)×(14/20) = 1/2.
#The next such arrangement, for which there is exactly 50% chance of taking two blue discs at random, is a box containing eighty-five blue discs and thirty-five red discs.
#By finding the first arrangement to contain over 1012 = 1,000,000,000,000 discs in total, determine the number of blue discs that the box would contain.



# We can solve this mathematically by realizing this is a Hypergeometric Distribution
# Hypergeometric probability: H = (C(k,x) * C(N-k,n-x))/C(N,n)
# We are given: N = 1e12, n = x = 2, H(N,k,n,x) = 1/2
# by replacing given values we find that: k*(k-1) = 0.5*N*(N-1)
# We can solve this equation for N = 1e12: k^2 - k - -10^12*(10^12 - 1)/2) = 0
# Since we are dealing with probabilities, we only need positive values of k


quad <- function(a, b, c){
  a = as.complex(a)
  answer = c(
    (-b + sqrt(b^2 - 4 * a * c)) / (2 * a),
    (-b - sqrt(b^2 - 4 * a * c)) / (2 * a))
  if(all(Im(answer) == 0)) answer <- Re(answer)
  answer
}

k <- quad(1,-1,-10^12*(10^12 - 1)/2) %>%
  subset(. > 0)


# We can confirm our result by inputing our values into a hypergeometric calculator

hypergeo <- function(N,k,n,x){
  #N: The number of items in the population.
  #k: The number of items in the population that are classified as successes.
  #n: The number of items in the sample.
  #x: The number of items in the sample that are classified as successes.
  a = choose(k,x)
  b = choose(N-k, n-x)
  c = choose(N,n)
  d = a * b / c
  return(d)
}

hypergeo(21, 15, 2, 2) # first example
hypergeo(120, 85, 2, 2) # second example
hypergeo(1e12,k, 2, 2) # final solution



# End of File