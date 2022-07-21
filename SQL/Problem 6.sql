-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- Project Euler

-- Problem 6
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

WITH nums AS (
  SELECT 1 AS value
  UNION ALL
  SELECT value + 1 AS value
  FROM nums
  WHERE value < 100
)
SELECT (SQUARE(SUM(value)) - SUM(value*value)) as 'Answer'
FROM nums







