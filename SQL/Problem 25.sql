-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- Problem 25
-- The Fibonacci sequence is defined by the recurrence relation:
-- Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
-- Hence the first 12 terms will be:
--   F1 = 1
--   F2 = 1
--   F3 = 2
--   F4 = 3
--   F5 = 5
--   F6 = 8
--   F7 = 13
--   F8 = 21
--   F9 = 34
--   F10 = 55
--   F11 = 89
--   F12 = 144
-- The 12th term, F12, is the first term to contain three digits.
-- What is the index of the first term in the Fibonacci sequence to contain 1000 digits?


-- WITH RECURSIVE factorial(i, factor) AS (
--   VALUES(600851475143, 2)
--   UNION ALL
--   SELECT
--       CASE i % factor
--           WHEN 0 THEN i/factor   
--           ELSE i
--       END,
--       CASE i % factor
--           WHEN 0 THEN factor      
--           ELSE factor+1           
--       END
--   FROM factorial
--   WHERE factor <> i
-- )
-- SELECT MIN(i) AS 'Answer'
-- FROM factorial;




WITH num AS (
  SELECT 0 AS f0, 1 AS f1
	UNION ALL
	SELECT f1 AS f0, f0 + f1 AS f1 
	FROM num
  WHERE f1 < 4000000000000
)
--WHILE 
SELECT * 
--SELECT LENGTH(MAX(f0)) AS 'Answer'
FROM num








--CREATE TEMP TABLE IF NOT EXISTS Variables (Name TEXT PRIMARY KEY, Value TEXT);

--INSERT OR REPLACE INTO Variables VALUES ('VarStr', 'Val1');
--INSERT OR REPLACE INTO Variables VALUES ('VarInt', 123);
--INSERT OR REPLACE INTO Variables VALUES ('VarBlob', x'12345678');

