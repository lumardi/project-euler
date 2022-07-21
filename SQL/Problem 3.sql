-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- Project Euler

-- Problem 3
-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143?

WITH RECURSIVE factorial(i, factor) AS (
  VALUES(600851475143, 2)
  UNION ALL
  SELECT
      CASE i % factor
          WHEN 0 THEN i/factor   
          ELSE i
      END,
      CASE i % factor
          WHEN 0 THEN factor      
          ELSE factor+1           
      END
  FROM factorial
  WHERE factor <> i
)
SELECT MIN(i) AS 'Answer'
FROM factorial;

