# Project Euler

# Problem 24
#A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
#012   021   102   120   201   210
#What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
  

# 2783915460

## Notes:
# 10! permutations == 3,628,800 permutations
# Since values are in lexicographic order, we know that: 
# 0XXXXXXXX numbers are in the 1st to 362,880th position
# 1XXXXXXXX numbers are in the 362,881st to 725,759th position 
# 2XXXXXXXX numbers are in the 725,760th to 1,088,640th position -> 1st digit is 2!

# Generalizing: 
# Let n be the desired n-th lexicographic position. We know that n = 1e6
# Let k be the position in the string (range 1:K) We know that K = 1:10

# Combinatorics formula: 
# C = n!/(r! * (n - r)!)

# 1st number: (1e6 - 1)/9! 
# 2nd number: ((1e6 - 1) - (2 * 9!))/8!
# 3rd number: ((((1e6 - 1) - (2 * 9!))/8!) - (3 * 8!))/7!



# End of File