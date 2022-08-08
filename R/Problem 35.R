# Project Euler

# Problem 35



library(tidyverse)
library(primes)
library(combinat)


circular.prime <- function(x){
  nums = unlist(strsplit(as.character(x),''))
  
  anagrams = permn(nums) %>%
    map_chr(~{paste(.x,collapse = '')}) %>%
    unique() %>%
    subset(. != x) %>%
    as.numeric() %>%
    is_prime()
  
  ifelse(any(anagrams == F), F, T)
}


primes <- 1:1e6 %>%
  subset(is_prime(.)) %>%
  subset(.,map_dbl(.,circular.prime) == 1) %>%
  nrow()



#End of File