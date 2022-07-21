-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- Project Euler

-- Problem 100
--If a box contains twenty-one coloured discs, composed of fifteen blue discs and six red discs, and two discs were taken at random, it can be seen that the probability of taking two blue discs, P(BB) = (15/21)×(14/20) = 1/2.
--The next such arrangement, for which there is exactly 50% chance of taking two blue discs at random, is a box containing eighty-five blue discs and thirty-five red discs.
--By finding the first arrangement to contain over 1012 = 1,000,000,000,000 discs in total, determine the number of blue discs that the box would contain.


-- We can solve this mathematically by realizing this is a Hypergeometric Distribution
-- Hypergeometric probability: H = (C(k,x) * C(N-k,n-x))/C(N,n)
-- We are given: N = 1e12, n = x = 2, H(N,k,n,x) = 1/2
-- by replacing given values we find that: k*(k-1) = 0.5*N*(N-1)
-- We can solve this equation for N = 1e12: k^2 - k - -10^12*(10^12 - 1)/2) = 0
-- Since we are dealing with probabilities, we only need positive values of k


WITH quad(a,b,c) AS (
  SELECT 1, -1, (-1*POWER(10,12)*(POWER(10,12) - 1))/2 
)
SELECT -b + (SQRT(POWER(b,2) - 4*a*c))/2*a AS x1, -b - (SQRT(POWER(b,2) - 4*a*c))/2*a AS x2
FROM quad
