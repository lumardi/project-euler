# Project Euler

# Problem 7


#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

#What is the 10 001st prime number?
  
is.prime <- Vectorize(
  function(x) {
    if(!identical(round(x), x)){
      check = F
    } 
    if(x == 1){
      check = F
    }
    if(x %in% c(2,3)){
      check = T
    } else {
      check = !any(x %% 2:(floor(sqrt(x))) == 0)
    }
    return(check)
  }
) 

k = 0
i = 0

i = 0
primes = c()
while(length(primes) < 10001){
  if(is.prime(i) == T){
    primes = c(primes,i)
    i = i + 1
  } else {i = i + 1} 
}

max(primes)


# End of File 