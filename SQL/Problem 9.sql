-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- Project Euler

-- Problem 9
-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a2 + b2 = c2
-- For example, 32 + 42 = 9 + 16 = 25 = 52. There exists exactly one Pythagorean triplet for which
-- a + b + c = 1000. Find the product abc.

-- Notes:
-- Definition of Pythagorean Triplet:
-- a < b < c, all natural numbers
-- c^2 = a^2 + b^2
-- Euclid's Formula:
-- a = m^2 - n^2
-- b = 2*m*n
-- c = m^2 + n^2
-- We are given: 
-- a + b + c = 1000
-- Simplifying:
-- (m^2 - n^2) + (2*m*n) + (m^2 + n^2) = 1000
-- 2*m^2 + 2*m*n = 1000
-- m^2 + m*n = 500
-- m(m + n) = 500
-- n = - m + (500/m)
--
-- We can guess that 500 %% m == 0 & 500 %% (m+n) == 0  (note a)
-- Also, 250 < m^2 < 500 // sqrt(250) < m < sqrt(500)   (note b)


WITH nums(x) AS (
  SELECT FLOOR(SQRT(250)) 
  UNION ALL
  SELECT x + 1
  FROM nums
  WHERE x < FLOOR(SQRT(500)) 
),
m AS(
  SELECT x
  FROM nums
  WHERE 500 % x = 0
),
n(x) AS (
  SELECT 500/(m.x) - m.x
  FROM m
),
a(x) AS (
  SELECT m.x*m.x - n.x*n.x
  FROM m,n
),
b(x) AS (
  SELECT 2*m.x*n.x
  FROM m,n
),
c(x) AS (
  SELECT m.x*m.x + n.x*n.x
  FROM m,n
)
SELECT a.x*b.x*c.x AS 'Answer'
FROM a,b,c;

