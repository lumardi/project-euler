-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- Project Euler

-- Problem 1
-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
-- The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.

WITH nums AS
   (SELECT 1 AS value
    UNION ALL
    SELECT value + 1 AS value
    FROM nums
    WHERE nums.value <= 999)
SELECT SUM(value) AS 'Answer'
FROM nums 
WHERE nums.value % 3 = 0 OR nums.value % 5 = 0;


