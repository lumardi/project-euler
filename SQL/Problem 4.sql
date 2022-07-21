-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- Project Euler

-- Problem 4
-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
-- Find the largest palindrome made from the product of two 3-digit numbers.

-- Note: We can assume that the largest palindrome will be a product of 9XX numbers

WITH nums AS (
  SELECT 900 AS value
  UNION ALL
  SELECT value + 1 AS value
  FROM nums
  WHERE value < 999
),
prods(x, y, xy) AS (
 SELECT c1.value, c2.value, (c1.value * c2.value)
    FROM nums c1, nums c2
)
SELECT MAX(xy) AS 'Answer'
FROM prods 
WHERE xy = CAST(REVERSE(xy) AS int)
