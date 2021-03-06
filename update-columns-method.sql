/*
Updates one column at a time.  This is *much* slower than doing it in a single sum(case()) way
but gets the same results

"0m rows" (0.4m) 2, 3 seconds - about 1.5 slower than the case-when method, but not very precise measure
"1m rows" (1.4m) 230 seconds, 294 
"2m rows" (2.1m) 440 seconds
"4m rows"  (4.3m) 18 minutes - about 20 times slower than case when
"14m rows" 75 minutes

Because it is doing this by EXECUTE one query at a time, if it gets interrupted
the columns it has done so far are persistant and you could start again from the
column that died.  

After the first chunk below has populated the first three columns (id, year and var0)
the table already has the same size on disk as the entire table as created by the sum-case method.
So populating the other columns is space neutral

Writing to disk at about 30 million  B/sec to start with then it slows down as it gets on to the next columns

*/
-- You need to have first created the empty table with make-empty-wide-tables.sql
-- First we populate the first three columns:
USE pivot_experiments
INSERT dbo.wide_updates(id, year, var0)
SELECT
	id,
	year,
	value
FROM pivot_experiments.dbo.fact_14_million_rows
WHERE fk_variable_code = 0
--  this took about 70 seconds with the 14 million row version, I don't think this is a big bottleneck


-- The table structure is settled now, no more rows being added, so we can
-- convert it from a heap (failure to do this would make all the joins in
-- the next step unbearably slow):
ALTER TABLE dbo.wide_updates ADD PRIMARY KEY (id, year);

DECLARE @i INT = 1 -- start from the first empty column
DECLARE @j VARCHAR(2)
DECLARE @query NVARCHAR(2000)
WHILE @i <= 30
BEGIN
	SET @j = CAST(@i AS VARCHAR(2))
	SET @query = 
		'UPDATE dbo.wide_updates
		SET dbo.wide_updates.var' + @j + ' = b.value
		FROM dbo.wide_updates				AS a 
		INNER JOIN dbo.fact_14_million_rows	AS b 
			ON a.year = b.year and a.id = b.id 
		WHERE fk_variable_code = ' + @j
	EXECUTE(@query)
	SET @i = @i + 1
	
END






