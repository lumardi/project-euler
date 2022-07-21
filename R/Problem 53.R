# Project Euler

# Problem 53

#There are exactly ten ways of selecting three from five, 12345:
# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
#How many, not necessarily distinct, values of (n r) for 1 <= n <= 100, are greater than one-million?


# Note: r <= n

combinatoric <- function(n, r){
  factorial(n)/(factorial(r) * factorial(n - r))
}

aux <- 23:100 %>%
  map(~combinatoric(.x, 1:.x)) %>%
  unlist() %>%
  subset(. >= 1e6) %>%
  enframe(name = NULL)












# End of File