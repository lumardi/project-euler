# Project Euler

# Problem 5

#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  
# Brute Force:

div.seq <- function(x,i,j){
  #checks whether all remainders of x/(i:j) = 0
  !any(x %% i:j != 0)  
}

i = 2520
k = 0
while(k == 0){
  if(div.seq(i,1,20) == T){
    k = i
  } else{
    i = i + 1
  } 
  print(i)
}





# End of File